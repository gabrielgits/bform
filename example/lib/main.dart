import 'package:bform/bform.dart';
import 'package:flutter/material.dart';

import 'models/borm_obj_impl.dart';


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

  BformObjImpl bformObj = BformObjImpl();

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
            const BformTextInput(title: 'Input Example'),
            const SizedBox(height: 30),
            BformGroupRadio(
              label: 'Select Title',
              itemsList: [bformObj],
              select: bformObj,
              onChange: (_) {},
              color: Colors.orange,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: (){},
                child: const Text('Examble Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
