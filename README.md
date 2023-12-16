# Mains Platform

Platform for conducting Coding and Debugging mains test

## Index
1. [Setting up Firebase and new questions](#setting_firebase)
2. [Setting up new Firebase link](#setting_link)
3. [Features](#features)
4. [Admin Panel](#admin_panel)
5. [Building](#building)
6. [Closing the app](#closing)
7. [Checklist](#checklist)
## Setting up Firebase and new questions <span id="setting_firebase"></div>
I am currently using my own firebase realtime database through it's REST API (since the package isn't available on Flutter desktop Linux).  
1. First, create your Firebase database with any name.  
2. Now to prepare the questions, open the file `./lib/data/offline_md_questions.dart`. There is a const map (key-value pair) named offlineMdQuestions. Here is where the questions are written for generating the json file. You should write the questions in Markdown format. Each question should be a map entry of format "question_id": "question_in_markdown", where question_id is a unique identifier for each question. THIS SHOULD BE UNIQUE! NO DUPLICATE question_id SHOULD EVER HAPPEN! It could be something like `question1, question2, etc`.
3. The password hint is also in the above map, with the key set as "passwordHint". This key should not be changed
4. To change the correct password which will be used for the password cracking section, open `./lib/other/constants.dart` and change the offlineTestingUserPassword constant variable to the new one.
5. Now run in command line: `dart run ./lib/other/cog_helper_scripts/generate_db_json.dart`
6. After running this, there should be a file called `import_this_to_firebase.json` in the firebase folder.
7. Upload this json file to your Firebase database using Import Json option
8. Then copy the text in `./firebase/firebase_rule.json` and paste it to firebase rules to set up authentication and access control (spoiler alert, there is actually no authentication, everything except the questions can be edited by anyone with the link to the database, since I don't know how to do actual Firebase authentication. So keep the link secret.)
9. The questions are now set up.

## Setting up new Firebase link <span id="setting_link"></div>
To update the Firebase database link which is used by the platform, edit the file in the assets folder called `.env`
There are a few variables in it:
* COG_FIREBASE_LINK - The link to the firebase database
* COG_PASSWORD_TIMER_DURATION_MINUTES - The time given for password cracking in minutes
* COG_QUESTION_TIMER_DURATION_MINUTES - The time given for all questions, this includes the minutes given for the password timer, that is, if question time is 60 minutes and the password time is 10, total time is still 60, out of which 10 minutes is given to password.
* COG_ZEPHYRUS_VERSION - The Zephyrus version. Not much use except that its used for the folder name where the user data is stored
* COG_FEEDBACK_FORM_LINK - This is the link which is shown after the user submits all the answers, which is used for feedback, usually a Google form.

All variables should be of the form KEY=VALUE

## Features <span id="features"></div>
* User cannot start the test without us, the admins alowwing it from our end.
* The platform is designed in such a way that even in the case of power failure, the user can resume from where they stopped.  
* To do this, all the UI states are saved to a database offline, and it uses the given phone number as the key for resuming, so that if a person gets interrupted while writing an answer due to a power failure, after turning it back on, they can resume from exactly where they stopped by asking them to use the same phone number, which will automatically restore everything.  
* Each time the user click next/previous/ or a question number, the answer is uploaded to firebase so that we, the admin can see them while they're doing it.  
When 
* When the user times out, their progress is automatically uploaded

## Admin Panel <span id="admin_panel"></div>
To enter admin panel, we have to follow these steps:
1. When it asks to press space, type `STARTADMIN` instead, it will override the start signal checking.
2. Now in the users form, type `Admin Panel` in the Name input and `Just Let Me In` in the email input and press submit. It will now open the admin panel
3. In the admin panel, we can see every responses and control the start signal.
4. To toggle the start signal, click the Play/Pause button on the top right
5. To refresh responses, press the refresh icon on the top right
6. To see any of the response, click it. This will show the response side by side with the questions.
7. While seeing a response, if you want to refresh that particular user's response, click refresh icon on the top right next to the rules button.  
Note: The passwords and secret codes used above can be changed in the `constants.dart` file

## Building <span id="building"></div>
1. First install Flutter
2. Clone this repo
3. Do `flutter pub get` in the cloned directory.
4. To run, do `flutter run` and choose any desktop targets like Linux/Windows/macOS, this will run the app in debug mode
5. To build, do `flutter build {os_name} --release` where {os_name} should be substituted with your current OS's name, viz, linux/windows etc
6. This will perform the build process and it will be in the build folder, search online for where the resulting binary actually is, since it's different on all OS
7. Now you can copy the files and distribute to all target computers


## Closing the app <span id="closing"></div>
Just use ALT+F4 to close it

## Checklist <span id="checklist"></div>
Things to check if they're working correctly before PushingToProd™
- [x] Normal use case - Normally finished test within time limit, without interruptions  
- [x] No start signal given  
- [ ] Password time out  
- [ ] Questions time out  
- [ ] Password only interrupted, closed, restore state  
- [ ] Questions some part interrupted, closed, restore state  
- [ ] Admin panel dashboard refresh, start, stop  
- [ ] Admin panel check any user  
- [ ] Admin panel no inadvertent mutation of candidate answers  

## Workarounds
The data/flutter_assets/assets folder is there just to replicate the running environment, it contains a symlink to the .env file in the assets folder. When its built and packaged, the .env file is put correctly in the correct folder layout but when you run it using `flutter run`, it won't find the asset file. So I replicated the build folder instead of correcting the code.