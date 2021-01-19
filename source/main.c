/* ---------- デバイス依存コード ---------- */
#if defined(PIC18F)
    #pragma config LVP = OFF
    #pragma config BOR = OFF
    #pragma config WDT = OFF
    #pragma config OSC = HS

    #include "FreeRTOS.h"
    #include "task.h"
    #include "queue.h"

    /* PIC18Fのメイン関数名はmain() */
    #define MAIN main
    /* タスクスケジューラを開始するAPI関数 */
    #define START_SCHEDULER()       vTaskStartScheduler()
#elif defined(ESP32)
    #include "freertos/FreeRTOS.h"
    #include "freertos/task.h"
    #include "freertos/queue.h"
    #include "driver/gpio.h"

    /* ESP32のメイン関数名はapp_main() */
    #define MAIN app_main
    /* ESP32ではapp_main()呼び出し前にタスクスケジューラが開始済みのため、
     *ユーザー・アプリケーション側では実行不要 */
    #define START_SCHEDULER()
#endif

/* デバイスを初期化する。 */
void vDeviceInitialize(void)
{
    /* LED用のGPIOを出力モードにして初期値を0とする。*/
#if defined(ESP32)
    gpio_pad_select_gpio(GPIO_NUM_0);
    gpio_pad_select_gpio(GPIO_NUM_2);
    gpio_set_direction(GPIO_NUM_0, GPIO_MODE_OUTPUT);
    gpio_set_direction(GPIO_NUM_2, GPIO_MODE_OUTPUT);
    gpio_set_level(GPIO_NUM_0, 0);
    gpio_set_level(GPIO_NUM_2, 0);
#elif defined(PIC18F)
    TRISD &= 0xfc;
    PORTD &= 0xfc;
#endif
}

/* LEDの点灯状態を設定する。 1:点灯、0:消灯 */
void vSetLedStatus(UBaseType_t uNum, BaseType_t xState)
{
#if defined(ESP32)
    switch (uNum) {
    case 0:
        gpio_set_level(GPIO_NUM_0, xState);
        break;
    case 1:
        gpio_set_level(GPIO_NUM_2, xState);
        break;
    }
#elif defined(PIC18F)
    switch (uNum) {
    case 0:
        LATDbits.LATD0 = xState;
        break;
    case 1:
        LATDbits.LATD1 = xState;
        break;
    }
#endif
}

/* ---------- デバイス非依存コード ---------- */
#define QUEUE_LENGTH 2
QueueHandle_t xQueue;

/* LEDをトグルする。 */
void vToggleLed(UBaseType_t uNum)
{
    static BaseType_t xState = 0;
    vSetLedStatus(uNum, xState);
    xState = !xState;
}

/* 一定時間だけワンショットでLEDを点灯させるタスク */
void vFlashTask(void *pvParameters)
{
    TickType_t xPeriod = (TickType_t)pvParameters;
    vSetLedStatus(1, 1);
    /* (引数の数値+1)*10ミリ秒だけLEDを1回点灯し、タスクを終了する。 */
    vTaskDelay((xPeriod % 10 + 1) * 100 / portTICK_PERIOD_MS);
    vSetLedStatus(1, 0);
    vTaskDelete(NULL);
}

/* 受信用タスク */
void vReceiverTask(void *pvParameters) {
    UBaseType_t uxValue;
    while(1) {
        /* キューからメッセージを取り出す。 */
        if(xQueueReceive(xQueue, &uxValue, portMAX_DELAY)) {
            /* 受信したメッセージをパラメータとして新しいタスクを生成する。 */
            xTaskCreate(vFlashTask, "FLS", configMINIMAL_STACK_SIZE + 10, (void *)uxValue, tskIDLE_PRIORITY + 1, NULL);
        }
    }
}

/* メッセージ送信用タスク */
void vSenderTask(void *pvParameters) {
    static UBaseType_t uxCounter = 0;
    while(1) {
        /* キューを使ってメッセージを送信する。　*/
        xQueueSend(xQueue, &uxCounter, 0);
        uxCounter++;
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}

/* LED点滅タスク */
void vBlinkTask(void *pvParameters)
{
    TickType_t xPeriod = (TickType_t)pvParameters;
    while (1) {
        vToggleLed(0);
        vTaskDelay(xPeriod / portTICK_PERIOD_MS);
    }
}

void MAIN(void)
{
    vDeviceInitialize();
    xQueue = xQueueCreate(QUEUE_LENGTH, sizeof(UBaseType_t));
    xTaskCreate(vReceiverTask, "RECV", configMINIMAL_STACK_SIZE + 10, NULL, tskIDLE_PRIORITY + 2, NULL);
    xTaskCreate(vSenderTask, "SEND", configMINIMAL_STACK_SIZE + 10, NULL, tskIDLE_PRIORITY + 2, NULL);
    xTaskCreate(vBlinkTask, "BLK", configMINIMAL_STACK_SIZE + 10, (void *)500, tskIDLE_PRIORITY + 1, NULL);
    START_SCHEDULER();
}