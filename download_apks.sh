#!/usr/bin/env bash

for package in "$@"; do
	adb shell am start -a android.intent.action.VIEW -d "market://details?id=$package"
	sleep 3
	adb shell input tap 550 770
	sleep 1
done

for package in "$@"; do
	{
		while [[ -z "$(adb shell pm path $package)" ]]; do
			:
		done
		echo "Downloaded $package"
	} &
done

wait

for package in "$@"; do
	mkdir -p $package
	for path in $(adb shell pm path $package | cut -d ':' -f 2); do
		file_name=$(echo $path | sed 's/.*==\///')
		adb pull $path "$package/$file_name"
	done
done

