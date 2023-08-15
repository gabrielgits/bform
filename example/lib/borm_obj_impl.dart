import 'package:bform/bform.dart';

class BformObjImpl implements BformObj {
  final int obj_id;
  const BformObjImpl(this.obj_id);
  @override
  int get id => obj_id;
  @override
  String get title => 'Model Title';
  @override
  String get subtitle => 'Model Subtitle';
  @override
  String get imagePath => 'assets/images/refresh.png';
  @override
  bool isSame(BformObj value) => id == value.id;
}
