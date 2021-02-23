# freertos-pic18f452

PIC18F452でFreeRTOSを動かすためのポーティングです。

Interface誌2021年4月号に掲載した記事のソースコードです。

# 前提条件

* Explorer8 (マイクロチップ・テクノロジー)
* PIC18F452
* MPLAB X IDE v5.45
* C18 Standard-Eval Version v3.47
* PICKit3
# インストール

## 1. MPLAB X IDEのインストール

以下のサイトからダウンロードしてインストールします。

[MPLAB X IDE](https://www.microchip.com/en-us/development-tools-tools-and-software/mplab-x-ide)

## 2. C18コンパイラのインストール

以下のサイトからC18コンパイラをインストールしてインストールします。現在Windows版のみダウンロードできます。

[MPLAB C Compiler for PIC18 MCUs(C18)](https://www.microchip.com/DevelopmentTools/ProductDetails/PartNO/SW006011)

Standard-Eval Versionはすべての最適化が有効になっていますが、有効期限がくると一部の最適化が効かなくなります。LITE modeは最初から期限切れの状態のStandard-Eval Versionと考えて良いです。このポーティングではどちらのバージョンでも動作します。

## 3. プロジェクトを開く

MPLAB X IDEからgit cloneしたルートフォルダを開きます。

## 4. コンパイラのヘッダファイルのパスを修正する

C18コンパイラ内の`timers.h`とFreeRTOSの`timers.h`でファイル名が競合しているので、C18コンパイラの`timers.h`を先にインクルードするように、インクルードパスを設定します。具体的には、MPLAB X IDEのプロジェクトのプロパティから、[Conf]-[C18(Global Options)]-[mcc18]を選択し、次の順序でインクルードディレクトリを設定します。

* `C:¥Program Files (x86)¥Microchip¥mplabc18¥v3.47¥h`
* `source`
* `freertos¥include`
* `freertos¥portable¥MPLAB¥PIC18`
* `freertos¥portable¥Common¥include`

## 5. ビルドとボードへの書き込み

MPLAB X IDEでプロジェクトをビルドし、Explorer8ボードにPICKit3経由で書き込みます。



