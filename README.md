# Campsite Finder

##  How to Run

Make sure you have Flutter installed and set up.
Then, run the following commands in your project directory:

```bash
# Get Flutter packages
flutter pub get

# Run on Web
flutter run -d chrome

# Run on Android
flutter run -d android

# Run on iOS
flutter run -d ios

# Run tests
flutter test
```

---

### Introduction

Imagine you’re building a scalable campsite platform for hosts and guests like *Roadsurfer Spots*.
This app focuses on **prospective campers** who are looking for an individual camping site.

As a camper, you can:

* View camping sites in a list.
* Filter them by various attributes.
* View individual camping site details from the filtered list.
* *(Bonus)* View all camping sites on a map with clustering.

---

###  Setup & Requirements

* **Framework**: Flutter & Dart *(latest stable versions)*
* **State Management**: Riverpod
* **Platform**: Runs on Web, Android, and iOS

---



### App Functionality

* **Home View**

  * Shows a list of all campsites, ordered by name.
  * Allows filtering by sensible properties.
  * Updates displayed list automatically when filters are active.
* **Detail View**

  * Tap a campsite to view its detailed information.
  * Choose which properties to show and how they’re presented.
* **(Bonus) Map View**

  * Display all campsites on an interactive map.
  * Cluster nearby campsites for better usability.

---

### Campsite Data

The list of campsites is fetched as JSON from this public API:
**[Campsite Mock API](https://62ed0389a785760e67622eb2.mockapi.io/spots/v1/campsites)**


### Testing

Write **unit tests** where appropriate to ensure functionality and maintain code quality.

---

###  UX Guidelines

* Follow **best mobile UX principles**.
* Keep the app visually appealing and intuitive.
* If any part of the task is not explicit enough, feel free to come up with your own sensible UX.

---


