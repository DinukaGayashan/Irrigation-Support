import 'package:flutter/material.dart';
import 'package:irrigation_support/constants.dart';

class AreaUnitConverter extends StatefulWidget {
  const AreaUnitConverter({Key? key}) : super(key: key);

  @override
  State<AreaUnitConverter> createState() => _AreaUnitConverterState();
}

class _AreaUnitConverterState extends State<AreaUnitConverter> {
  final fromValueController = TextEditingController();
  final toValueController = TextEditingController();
  String fromUnit = areaUnits[0];
  String toUnit = areaUnits[1];
  String fromValue = '1';
  late String toValue =
  getConvertedAreaValue(double.parse(fromValue), fromUnit, toUnit)
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                  value: fromUnit,
                  items: areaUnits.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                      toValue = getConvertedAreaValue(
                          double.tryParse(fromValue) ?? 0.0,
                          fromUnit,
                          toUnit)
                          .toString();
                    });
                  }),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-80,
                    child: TextField(
                      controller: fromValueController,
                      textAlign: TextAlign.right,
                      keyboardType: const TextInputType.numberWithOptions(),
                      autofocus: true,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      onTap: (() {
                        fromValueController.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: fromValueController.value.text.length);
                      }),
                      onChanged: (value) {
                        fromValue = value;
                        setState(() {
                          toValue = getConvertedAreaValue(
                              double.tryParse(fromValue) ?? 0.0,
                              fromUnit,
                              toUnit)
                              .toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Text(
                      areaUnitSigns[fromUnit].toString(),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30,),
              DropdownButton(
                  value: toUnit,
                  items: areaUnits.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                      toValue = getConvertedAreaValue(
                          double.tryParse(fromValue) ?? 0.0,
                          fromUnit,
                          toUnit)
                          .toString();
                    });
                  }),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-80,
                    child: TextField(
                      controller: toValueController,
                      textAlign: TextAlign.right,
                      keyboardType: const TextInputType.numberWithOptions(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      onTap: (() {
                        toValueController.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: toValueController.value.text.length);
                      }),
                      onChanged: (value) {
                        toValue = value;
                        setState(() {
                          fromValue = getConvertedAreaValue(
                              double.tryParse(toValue) ?? 0.0, toUnit, fromUnit)
                              .toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Text(
                      areaUnitSigns[toUnit].toString(),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
