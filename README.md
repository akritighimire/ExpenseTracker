# mongoflutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Dart and MongoDB

This projects demonstrates how to talk to a MongoDB database.

## Download and Install MongoDB

Visit [https://docs.mongodb.com/manual/administration/install-community/](https://docs.mongodb.com/manual/administration/install-community/) and select your OS for instructions.

## Upload json dataset into database

1. Start your MongoDB server

   ```bash
   mongod
   ```

2. Import person.json with `mongoimport` executable

   ```bash
   mongoimport --jsonArray -d <yourDatabaseName> -c <yourCollectionName> --file <path/To/File.json>
   ```

## Run the project

Execute this command in your terminal:

```bash
dart bin/main.dart
```

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
