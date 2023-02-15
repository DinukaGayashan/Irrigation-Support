import 'package:flutter/material.dart';
import 'package:irrigation_support/constants.dart';
import 'package:irrigation_support/screens/length_unit_converter.dart';

import 'area_unit_converter.dart';

class UnitConverter extends StatefulWidget {
  const UnitConverter({Key? key}) : super(key: key);
  static const String id = 'UnitConverter';

  @override
  State<UnitConverter> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: measurements.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Unit Converter'),
          centerTitle: true,
          bottom: TabBar(
            tabs: measurements.map((String items) {
              return Tab(
                text: items,
              );
            }).toList(),
          ),
        ),
        body: const TabBarView(
          children: [
            LengthUnitConverter(),
            AreaUnitConverter(),
          ],
        ),
      ),
    );
  }
}
