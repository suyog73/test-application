#!/bin/bash


echo Adding dependencies ✋✋✋

echo -e "\n"
echo -e "\n"


flutter pub add cloud_firestore:4.4.5
flutter pub add custom_full_image_screen:0.0.4
flutter pub add firebase_auth:4.2.2
flutter pub add firebase_core:2.8.0
flutter pub add firebase_storage:11.0.16
flutter pub add flutter_dotenv:5.0.2
flutter pub add flutter_launcher_icons:0.12.0
flutter pub add flutter_local_notifications:13.0.0
flutter pub add fluttertoast:8.2.1
flutter pub add form_field_validator:1.1.0
flutter pub add http:0.13.5
flutter pub add intl:0.18.0
flutter pub add lottie:2.3.1
flutter pub add timezone:0.9.1

flutter clean 
flutter pub get

echo -e "\n"
echo -e "\n"


echo All dependencies are successfully added 😊😊😊