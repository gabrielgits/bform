import 'package:bform/src/models/ibform_model.dart';
import 'package:flutter_test/flutter_test.dart';

class BformModel implements IBformModel {
  @override
  String get imagePath => 'defaut.png';

  @override
  bool isSame(IBformModel value) {
    return selectId == value.selectId;
  }

  @override
  int get selectId => 1;

  @override
  String get subtitle => 'subtitle';

  @override
  String get title => 'title';
}

void main() {
  test('Test BForm Model ', () {
    final bformModel = BformModel();
    expect(bformModel.selectId, 1);
    expect(bformModel.isSame(BformModel()), true);
    expect(bformModel.imagePath, const TypeMatcher<String>());
  });
}
