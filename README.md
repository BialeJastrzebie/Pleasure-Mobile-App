# PLeasure_mobile_app

## Welcome to PŁeasure, a new Flutter project designed for Lodz University of Technology students.

### PŁeasure is an app that aims to enhance the student experience by offering a variety of features:

- **Exploring Map:** Students can browse a map featuring locations of interest tailored for them. These locations offer various discounts and deals exclusively for students.

- **Customizable Schedule:** Users can set up their own class schedules within the app, making it easier to manage their academic commitments.

- **Integrated Friend Plans:** By adding friends within the app, users can create and share integrated plans, facilitating coordination and socialization.

#### Stay tuned for updates and enhancements as we continue to develop Pleasure to cater to the needs and interests of students everywhere!


## Getting Started
Useful websites:
- [Icons](https://www.flaticon.com/)
- [Schedule of work](https://github.com/users/Juhasen/projects/3/views/1)

## Steps to start debugging in physical device
1. Connect your device to your computer using a USB cable.
2. Enable USB debugging on your device.
3. In the terminal, run the flutter devices command to verify that Flutter recognizes your device.
```
adb devices
```
5. Run the app with the following command:
```
flutter run
```
6. Run the django server with the following command:
```
python manage.py runserver 0.0.0.0:8000
```
7. Change the port number of the phone to 8000 in the app.
```
adb reverse tcp:8000 tcp:8000
```
8. Open the app on your device.
9. Enjoy!
