import 'package:bform/bform.dart';
import 'package:flutter/material.dart';

import 'borm_obj_impl.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: BformAppbar(
          title: 'Bform Example',
          color: Colors.blueGrey,
          icon: Icons.menu,
        ),
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
  bool checkActive = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          BformForm(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width - 20,
            border: Border.all(color: Colors.red),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const BformTextInput(
                  label: 'Input Example',
                  hintText: 'Hint Text Example',
                ),
                const SizedBox(height: 30),
                BformCheckbox(
                  inicialState: checkActive,
                  label: 'Checkbox',
                  onChange: (value) {
                    checkActive = value;
                  },
                ),
                const SizedBox(height: 30),
                BformGroupRadio(
                  label: 'Select Title',
                  listItems: const [
                    BformObjImpl(1),
                    BformObjImpl(2),
                    BformObjImpl(3),
                  ],
                  item: const BformObjImpl(1),
                  onChange: (_) {},
                  color: Colors.orange,
                ),
                const SizedBox(height: 30),
                BformDivider(),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerRight,
                  child: BformButton(
                    onPressed: () {
                      setState(() {
                        checkActive = !checkActive;
                      });
                    },
                    iconAsset: 'assets/images/google.png',
                    fontSize: 16,
                    weight: MediaQuery.of(context).size.width * 0.4,
                    colors: [Colors.green, Colors.yellow, Colors.red],
                    style: BformButtonStyle.highlighted,
                    label: ('Examble Button'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          BformDivider(),
          const SizedBox(height: 30),
          BformTableText(
            titles: const ['Title 1', 'Title 2'],
            actionButtons: const [
              Icon(Icons.add),
              Icon(Icons.delete),
              Icon(Icons.edit),
            ],
            listElements: [
              ['1 Element 1', '1 Element 2'],
              ['2 Element 1', '2 Element 2'],
              ['3 Element 1', '3 Element 2'],
            ],
          ),
        ],
      ),
    );
  }
}
