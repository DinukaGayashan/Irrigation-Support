import 'package:flutter/material.dart';
import 'package:irrigation_support/screens/unit_converter.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);
  static const String id = 'MainMenu';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Main Menu',
          ),
          centerTitle: true,
        ),
        body: MaterialButton(
          color: Colors.teal,
          onPressed: () {
            Navigator.pushNamed(context, UnitConverter.id);
          },
          child: const Text('Unit Converter'),
        ),
      ),
    );
  }
}
