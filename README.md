# RealTymeCurrencies

## Repo
- Added `.gitignore` for a cleaner history

## Application
- The app structure is `MVVM` + Dependency injection
- The app is now following protocol oriented programming for better usability as well as testability
- All network calls are now under protocol which allow flexible mocking and implementing
- All views conform with SwiftUI
- Respect and strictly follow SOLID principle
- Apply as much as possible the `static dispatch` to help with app performance and security

## Tests
- Create mock services for testing view model input and output
- Tested `ListViewModel`

## Demo
![DEMO](demo.gif)