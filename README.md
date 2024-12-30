# Flutter APK analyzer

Downloads and inspects Flutter apks.

Currently, it only lists which packages were used.

## Usage

You'll need an Android emulator with Play Store support. You should create one 
with the preset `Medium Phone` as it's the one this script was designed for.
> You could use any other as long as it has Play Store and you change the 
coordinates of the `Install` button in the code.

You can download any number of apks. Just pass their corresponding IDs:

```sh
$ ./download_apks.sh com.your_app_package com.another_app
```

Many apks will be found. You'll need to unzip the one targeted to your phone's
architecture:

```sh
$ ls com.your_app_package
base.apk    split_config.arm64_v8a.apk    split_config.xxhdpi.apk
$ unzip -d app com.your_app_package/split_config.arm64_v8a.apk
```

Then finally analyze the apk:

```sh
$ ./analyze.sh app
app_links
async
auto_size_text
calendar_view
...
```
