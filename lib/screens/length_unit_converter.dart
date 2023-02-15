import 'package:flutter/material.dart';
import 'package:irrigation_support/constants.dart';

class UnitConverter extends StatefulWidget {
  const UnitConverter({Key? key}) : super(key: key);
  static const String id = 'UnitConverter';

  @override
  State<UnitConverter> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  final fromValueController = TextEditingController();
  final toValueController = TextEditingController();
  String fromUnit = lengthUnits[0];
  String toUnit = lengthUnits[1];
  String fromValue = '1';
  late String toValue =
      getConvertedLengthValue(double.parse(fromValue), fromUnit, toUnit)
          .toString();

  @override
  Widget build(BuildContext context) {
    fromValueController.text = fromValue.toString();
    toValueController.text = toValue.toString();
    fromValueController.selection = TextSelection.fromPosition(
        TextPosition(offset: fromValueController.text.length));
    toValueController.selection = TextSelection.fromPosition(
        TextPosition(offset: toValueController.text.length));

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
                        toValue = getConvertedLengthValue(
                                double.tryParse(fromValue) ?? 0.0,
                                fromUnit,
                                toUnit)
                            .toString();
                      });
                    }),
                TextField(
                  controller: fromValueController,
                  textAlign: TextAlign.right,
                  keyboardType: const TextInputType.numberWithOptions(),
                  autofocus: true,
                  onTap: (() {
                    fromValueController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: fromValueController.value.text.length);
                  }),
                  onChanged: (value) {
                    fromValue = value;
                    setState(() {
                      toValue = getConvertedLengthValue(
                              double.tryParse(fromValue) ?? 0.0,
                              fromUnit,
                              toUnit)
                          .toString();
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
                        toValue = getConvertedLengthValue(
                                double.tryParse(fromValue) ?? 0.0,
                                fromUnit,
                                toUnit)
                            .toString();
                      });
                    }),
                TextField(
                  controller: toValueController,
                  textAlign: TextAlign.right,
                  keyboardType: const TextInputType.numberWithOptions(),
                  onTap: (() {
                    toValueController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: toValueController.value.text.length);
                  }),
                  onChanged: (value) {
                    toValue = value;
                    setState(() {
                      fromValue = getConvertedLengthValue(
                              double.tryParse(toValue) ?? 0.0, toUnit, fromUnit)
                          .toString();
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
