List<String> lengthUnits=['cm', 'm'];

Map<String,String> lengthUnitSigns={
  'cm':'cm',
  'm':'m',
};

Map<String,double> lengthUnitValues={
  'cm':100,
  'm':1,
};

double getConvertedLengthValue(double value, String initialUnit, String finalUnit){
  return value*lengthUnitValues[finalUnit]!/lengthUnitValues[initialUnit]!;
}