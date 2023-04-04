# NoteDo

NoteDo is a simple, yet powerful note-taking and to-do app built using Flutter, with the Bloc pattern and SQLite database, following the Clean Architecture principles.

## Features

- Create, edit, and delete notes
- Create, edit, and delete to-do tasks
- Check off completed tasks
- Pin important notes
- Mark notes and tasks with different colors for organization
- Search notes and tasks
- Dark mode support

## Installation

1. Clone this repository:
git clone https://github.com/MuktharAmiyan/NoteDo.git

2. Change into the directory:
cd NoteDo

3. Install the dependencies:
flutter pub get

flutter run


## Architecture

The app is structured using the following layers:

- Presentation layer: contains the UI components, built with the Flutter framework, and the Blocs, responsible for managing the app state and handling the user interactions.

- Domain layer: contains the business logic, use cases, and interfaces, which are agnostic to the framework and database implementation details.

- Data layer: contains the implementation of the interfaces defined in the domain layer, using the Sqflite database and the Flutter framework.

## Screenshots
<!-- 
![Screenshot 1](screenshots/screenshot1.png)

![Screenshot 2](screenshots/screenshot2.png)

## Contributing

Contributions are always welcome! If you have any ideas or suggestions, please open an issue or a pull request.

## License

This project is licensed under the [MIT License](LICENSE). -->

