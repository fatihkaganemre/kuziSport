#!/bin/bash

xcodebuild clean build -workspace Karate.xcworkspace -scheme "Karate" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=12.4,name=iPhone 8" CODE_SIGNING_REQUIRED=NO