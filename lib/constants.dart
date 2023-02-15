//supported measurements
List<String> measurements=['Length', 'Area'];


//length data
List<String> lengthUnits=['Centimeter', 'Meter'];

Map<String,String> lengthUnitSigns={
  'Centimeter':'cm',
  'Meter':'m',
};

Map<String,double> lengthUnitValues={
  'Centimeter':100,
  'Meter':1,
};

double getConvertedLengthValue(double value, String initialUnit, String finalUnit){
  return value*(lengthUnitValues[finalUnit]!/lengthUnitValues[initialUnit]!);
}


//area data
List<String> areaUnits=['Square Centimeter', 'Square Meter'];

Map<String,String> areaUnitSigns={
  'Square Centimeter':'cm2',
  'Square Meter':'m2',
};

Map<String,double> areaUnitValues={
  'Square Centimeter':10000,
  'Square Meter':1,
};

double getConvertedAreaValue(double value, String initialUnit, String finalUnit){
  return value*(areaUnitValues[finalUnit]!/areaUnitValues[initialUnit]!);
}