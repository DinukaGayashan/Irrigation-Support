import 'package:flutter/material.dart';

import 'package:irrigation_support/constants.dart';

class UnitConverter extends StatefulWidget {
  const UnitConverter({Key? key}) : super(key: key);
  static const String id = 'UnitConverter';

  @override
  State<UnitConverter> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  final fromValueController=TextEditingController();
  final toValueController=TextEditingController();


  @override
  Widget build(BuildContext context) {


    String fromUnit = lengthUnits[0];
    String toUnit = lengthUnits[1];
    double fromValue=1.0;
    late double toValue=getConvertedLengthValue(fromValue, fromUnit, toUnit);
    fromValueController.text=fromValue.toString();
    toValueController.text=toValue.toString();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Unit Converter',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text('Length'),
                DropdownButton(
                    value: fromUnit,
                    items: lengthUnits.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        fromUnit = value!;
                        toValue;
                      });
                    }),
                TextField(
                  controller: fromValueController,
                  textAlign: TextAlign.right,
                  keyboardType: const TextInputType.numberWithOptions(),
                  onChanged: (value) {
                    setState(() {
                      fromValue=double.parse(value);
                      toValue=getConvertedLengthValue(fromValue, fromUnit, toUnit);
                    });
                  },
                ),
                DropdownButton(
                    value: toUnit,
                    items: lengthUnits.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        toUnit = value!;
                        toValue;
                      });
                    }),
                TextField(
                  controller: toValueController,
                  textAlign: TextAlign.right,
                  keyboardType: const TextInputType.numberWithOptions(),
                  onChanged: (value) {
                    setState(() {
                      toValue=double.parse(value);
                      fromValue=getConvertedLengthValue(toValue, toUnit, fromUnit);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
