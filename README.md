# Kamyogya Internship Task

Welcome to the Project.

## Description

This Flutter application is designed to provide a simple interface for users to interact with an API endpoint. When the app is opened, users are presented with an input field where they can paste the API endpoint. Once the endpoint is pasted, users can click on the "Fetch Data" button to retrieve information from the API. Upon clicking, users must wait for 5 seconds before the data is displayed. Also, the application features a copy button next to the input field for easy copying the API endpoint.

## Features

- Copy button next to the api endpoint.
- Input field for pasting API endpoint.
- Fetch data button to retrieve data from API.
- Notification to indicate the completion of data fetching.

## Installation

To run the application you must follow these steps:

1. Make sure you've flutter installed on your system.
2. Clone this repository.
3. Open the repo on your desired IDE and run "flutter pub get".
4. Connect a device or an emulator.
5. Press f5 or type flutter run on your terminal.

## Usage

1. Open the application on your device.
2. Copy the give API endpoint and paste on below textbox.
3. Click on fetch data button.
4. Wait for 5 seconds and the data starts to fetch.
5. Upon completion of the data fetching you'll get a notification.

## Dependencies

The project uses the following packages:

- flutter_bloc
- dio
- fluttertoast
- equatable
- get_it
- flutter_local_notification
