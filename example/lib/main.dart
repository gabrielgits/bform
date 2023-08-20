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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BformForm(
        width: MediaQuery.of(context).size.width - 20,
        border: Border.all(color: Colors.red),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const BformTextInput(label: 'Input Example'),
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
            Align(
              alignment: Alignment.centerRight,
              child: BformButton(
                onPressed: () {},
                colors: [Colors.green, Colors.yellow, Colors.red],
                style: BformButtonStyle.highlighted,
                label: ('Examble Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
