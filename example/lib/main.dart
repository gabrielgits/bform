import 'package:bform/bform.dart';
import 'package:flutter/material.dart';

import 'models/exemple_model.dart';
import 'models/theme_model.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(child: MyApp()),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var appearance = BformAppearance.defaultTheme;

  final listThemes = [
    ThemeModel(
        selectId: 0,
        title: 'Default',
        subtitle: 'Default Theme',
        imagePath: 'assets/images/theme1.jpg'),
    ThemeModel(
        selectId: 1,
        title: 'Business',
        subtitle: 'Business Theme',
        imagePath: 'assets/images/theme2.jpg'),
    ThemeModel(
        selectId: 2,
        title: 'Soft',
        subtitle: 'Soft Theme',
        imagePath: 'assets/images/theme3.jpg'),
    ThemeModel(
        selectId: 3,
        title: 'Sky',
        subtitle: 'Sky Theme',
        imagePath: 'assets/images/theme4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BformForm(
        appearance: appearance,
        width: MediaQuery.of(context).size.width - 20,
        border: Border.all(color: Colors.red),
        borderTitle: Border.all(),
        title: const Text(
          'Form Example',
          style: TextStyle(fontSize: 15),
        ),
        child: Column(
          children: [
            BformGroupRadio(
              label: 'Themes',
              itemsList: listThemes,
              select: listThemes.first,
              onChange: (IBformModel value) {
                setState(() {
                  switch (value.selectId) {
                    case 1:
                      {
                        appearance = BformAppearance.business;
                        break;
                      }
                    case 2:
                      {
                        appearance = BformAppearance.soft;
                        break;
                      }
                    case 3:
                      {
                        appearance = BformAppearance.sky;
                        break;
                      }
                    default:
                      {
                        appearance = BformAppearance.defaultTheme;
                        break;
                      }
                  }
                });
              },
              appearance: appearance,
              border: Border.all(),
            ),
            const SizedBox(height: 30),
            BformTextInput(title: 'Input Example', appearance: appearance),
            const SizedBox(height: 30),
            BformDatePicker(
              title: const Text('Date Example'),
              data: '2022-10-10',
              appearance: appearance,
            ),
            const SizedBox(height: 30),
            BformTimerPicker(
              title: const Text('Timer Example'),
              textStyle: const TextStyle(fontSize: 22),
              color: Colors.yellowAccent,
              buttonColor: Colors.redAccent,
              appearance: appearance,
            ),
            const SizedBox(height: 30),
            BformListTile(
              item: ExampleModel(),
              color: Colors.grey,
              appearance: appearance,
            ),
            const SizedBox(height: 30),
            BformGroupRadio(
              label: 'Select Title',
              itemsList: [ExampleModel()],
              select: ExampleModel(),
              onChange: (_) {},
              color: Colors.orange,
              appearance: appearance,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: BformButton(
                //color: Colors.white,
                appearance: appearance,
                //color: Colors.white,
                child: const Text('Examble Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
