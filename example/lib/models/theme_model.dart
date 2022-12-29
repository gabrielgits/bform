import 'package:bform/bform.dart';

class ThemeModel implements IBformModel {
  @override
  final int selectId;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String imagePath;

  ThemeModel({
    required this.selectId,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  bool isSame(IBformModel value) => selectId == value.selectId;
}
