/* ---------- デバイス依存コード ---------- */
#if defined(PIC18F)
    #pragma config LVP = OFF
    #pragma config OSC = HS

    #include "FreeRTOS.h"
    #include "task.h"
    #include "queue.h"

    /* PIC18Fのメイン関数名はmain() */
    #define MAIN main
    /* タスクスケジューラを開始するAPI関数 */
    #define START_SCHEDULER() vTaskStartScheduler()
#elif defined(ESP32)
    #include "freertos/FreeRTOS.h"
    #include "freertos/task.h"
    #include "freertos/queue.h"
    #include "driver/gpio.h"

    /* ESP32のメイン関数名はapp_main() */
    #define MAIN app_main
    /* ESP32ではapp_main()呼び出し前にタスクスケジューラが
       開始済みのため、ユーザー・アプリケーション側では実行不要 */
    #define START_SCHEDULER()
#endif

/* デバイスを初期化する。 */
void vDeviceInitialize(void)
{
    /* LED用のGPIOを出力モードにして初期値を0とする。*/
#if defined(ESP32)
    gpio_config_t conf;
    conf.intr_type = GPIO_INTR_DISABLE;
    conf.mode = GPIO_MODE_OUTPUT;
    conf.pin_bit_mask = (1ULL << GPIO_NUM_0)
                        | (1ULL << GPIO_NUM_2)
                        | (1ULL << GPIO_NUM_4);
    conf.pull_down_en = 0;
    conf.pull_up_en = 0;
    gpio_config(&conf);
    gpio_set_level(GPIO_NUM_0, 0);
    gpio_set_level(GPIO_NUM_2, 0);
    gpio_set_level(GPIO_NUM_4, 0);
#elif defined(PIC18F)
    /* LEDが接続しているポートDの0〜3を出力モードに設定 */
    TRISD &= 0xf0;
    PORTD &= 0xf0;
#endif
}

/* LEDの点灯状態を設定する。 1:点灯、0:消灯 */
void vSetLedStatus(UBaseType_t uNum, BaseType_t xState)
{
#if defined(ESP32)
    static int led[3] = {GPIO_NUM_0, GPIO_NUM_2, GPIO_NUM_4};
    gpio_set_level(led[uNum], xState);
#elif defined(PIC18F)
    if (xState == 0) {
        LATD &= (1 << uNum);
    }
    else {
        LATD |= (1 << uNum);
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
        /* キューにメッセージが届くまで待つ。 */
        if(xQueueReceive(xQueue, &uxValue, portMAX_DELAY)) {
            /* 受信した値をパラメータとして新しいタスクを生成する。 */
            xTaskCreate(vFlashTask, "FLS",
                        configMINIMAL_STACK_SIZE + 10,
                        (void *)uxValue, tskIDLE_PRIORITY + 1, NULL);
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
    xTaskCreate(vReceiverTask, "RCV",
                configMINIMAL_STACK_SIZE + 10,
                NULL, tskIDLE_PRIORITY + 2, NULL);
    xTaskCreate(vSenderTask, "SND",
                configMINIMAL_STACK_SIZE + 10,
                NULL, tskIDLE_PRIORITY + 2, NULL);
    xTaskCreate(vBlinkTask, "BLK",
                configMINIMAL_STACK_SIZE + 10,
                (void *)500, tskIDLE_PRIORITY + 1, NULL);
    START_SCHEDULER();
}
