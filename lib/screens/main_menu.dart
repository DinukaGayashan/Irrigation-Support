import 'package:flutter/material.dart';

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
