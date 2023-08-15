import 'package:bform/bform.dart';

class BformObjImpl implements BformObj {
  @override
  int get id => 1;
  @override
  String get title => 'Model Title';
  @override
  String get subtitle => 'Model Subtitle';
  @override
  String get imagePath => 'assets/images/refresh.png';
  @override
  bool isSame(BformObj value) => id == value.id;
}
