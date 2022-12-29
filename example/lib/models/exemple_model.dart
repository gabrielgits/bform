import 'package:bform/bform.dart';

class ExampleModel implements IBformModel {

  @override
  int get selectId => 1;
  @override
  String get title => 'Model Title';
  @override
  String get subtitle => 'Model Subtitle';
  @override
  String get imagePath => 'assets/images/refresh.png';
  @override
  bool isSame(IBformModel value) => selectId == value.selectId;

}
