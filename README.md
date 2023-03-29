# Note IT

Note IT is a simple Note taking mobile application built with Flutter.

## Setup Instructions

To setup the project, make sure you have flutter installed. The project currently works with **`Flutter 3.7.5`**. The project is configured to use [FVM](https://fvm.app/) incase you may have different Flutter Versions installed.

Follow below steps to clone and run the project in development mode.

```bash
#!/bin/bash

# Clone the project (SSH)
git clone git@github.com:stivo-m/note_me.git

cd note_me

# If you are using FVM, run the following to configure
fvm flutter pub get

# if you are not using FVM, you can run normal flutter commands
flutter pub get
```

Once you have cloned the project and installed all the dependencies, you need to create signing configurations for android. Follow [these instructions](https://docs.flutter.dev/deployment/android#create-an-upload-keystore) on Flutter's documentation.

```bash
#!/bin/bash

# Run the code (FOr FVM Users)
fvm flutter run

# Run the code (FOr normal Users)
flutter run
```

The project is configured with three flavors:

- development
- staging
- production

By default, the `flutter run` command runs the project in development and in debug mode.

If you would like to run the project in a different flavor, you can add the `--flavor` option to the `flutter run` command along with the specific entry point to change internal flavors.

If you are using `VSCode`, the debugger will already be configured to work with the flavors and you should be good to go without the below steps. THis is the actual configuration

These different entry points are located at `lib/bin/environments` and can be run as follows (If using FVM, just add `fvm` before `flutter` command).

##### Run in development

```bash
flutter run --flavor development -t lib/bin/environments/main_development.dart
```

##### Run in staging

```bash
flutter run --flavor staging -t lib/bin/environments/main_staging.dart
```

##### Run in production

```bash
flutter run --flavor production -t lib/bin/environments/main_production.dart
```

## Architecture

The Application is built upon the [Domain-Driven Design Principals](https://en.wikipedia.org/wiki/Domain-driven_design) and the [Layered Architecture](https://en.wikipedia.org/wiki/Multitier_architecture).
It is organized into four distinct layers:

1. **Domain Layer**
   This layer defines domain specific aspects of the application. These include, but are not limited to, interfaces, facades, constants, value objects, entities and bounded contexts.

2. **Infrastructure Layer**
   This layer defines ways the application should interact with the outside world. It provides concrete implementation of various interfaces from the domain layer, and usually will include, database connections and operations, api repositories, and any other outward facing aspects of the app.
3. **Application Layer**
   This layer is expected to provide common elements in the application that are used to control how the application functions. Its usually the glue between the outside layer and the inward layer of the app. It will involve all logic to handle state management, view models, helper functions, encryption and decryption, among others.
4. **Presentation Layer**
   This layer defines the user-interface related aspects of the application. All the UI related widgets and screens are defined and presented in this layer.

These layers are categorized under the `app` directory defined within the `lib` directory. In addition to `app` directory, there `bin` directory that is used to provide the application with required initialization logic.

Within the `bin` directory, you will find definitions of different environments the application can run in, configurations for icons, splash screens, and the `bootstrap` directory, where the application will be setup, routes configured, and any other startup logic prepared.

## How to Contribute

TBD
