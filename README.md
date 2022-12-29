## Bform

Package to allows you to create beautiful forms.

| **Support** | Android | iOS | Linux | macOS | Web | Windows |
|-------------|---------|------|-------|--------|-----|-------------|

## Features

- text input
- date picker
- timer picker
- select
- group radio
- list tile

## Getting started

2. To use this package, add bform as dependency in your `pubspec.yaml` file:

```yaml
dependencies:
   bform: "^0.1.0"
```

3. Import the package into your dart file:

```dart
import 'package:bform/bform.dart';
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:bform/bform.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: BformTextInput(
              title: 'Your Name',
              icon: Icons.edit,
            ),
          ),
        ),
      ),
    );
  }
}

```

## Additional information

For any bugs, issues and more information, please contact the package authors on email: gvgabrielvieiragabrielvieira@gmail.com.

## Developer(s)

[<img src="https://avatars.githubusercontent.com/u/72738617?s=64&amp;v=4" width="180" />](https://gabrielvieira.ao)
#### **Gabriel Vieira**

## License

#### MIT LICENSE