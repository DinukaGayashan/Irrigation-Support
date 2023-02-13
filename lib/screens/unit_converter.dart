import 'package:flutter/material.dart';

class UnitConverter extends StatelessWidget {
  const UnitConverter({Key? key}) : super(key: key);
  static const String id = 'UnitConverter';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Unit Converter',
          ),
        ),
        body: MaterialButton(
          color: Colors.teal,
          onPressed: () {

          },
        ),
      ),
    );
  }
}
