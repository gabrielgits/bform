import 'package:flutter/material.dart';

enum BformButtonStyle {
  regular,
  highlighted,
  outlined,
}

class BformButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  final List<Color> colors;
  final Color? textColor;
  final BformButtonStyle style;
  final IconData? icon;
  final String? iconAsset;
  final bool iconSuffix;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? weight;

  const BformButton({
    super.key,
    required this.label,
    this.onPressed,
    this.iconAsset,
    this.colors = const [],
    this.textColor,
    this.style = BformButtonStyle.regular,
    this.icon,
    this.iconSuffix = false,
    this.fontSize,
    this.fontWeight,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Ink(
          width: this.weight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            color: style == BformButtonStyle.regular && colors.isNotEmpty
                ? colors.first
                : null,
            border: switch (style) {
              BformButtonStyle.outlined => Border.all(
                  color: colors.first,
                ),
              _ => null,
            },
            gradient: style == BformButtonStyle.highlighted
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: colors,
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicWidth(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (iconSuffix == false && iconAsset != null)
                    Expanded(
                        child: Image.asset(
                      iconAsset!,
                      height: fontSize == null ? null : fontSize! * 1.5,
                      width: fontSize == null ? null : fontSize! * 1.5,
                    )),
                  if (iconSuffix == false && icon != null) //
                    Expanded(child: Icon(icon)),
                  Expanded(
                    child: Text(
                      label,
                      textAlign: iconAsset != null //
                          ? TextAlign.start
                          : TextAlign.center,
                      style: switch (style) {
                        BformButtonStyle.outlined => TextStyle(
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                            color: colors.first,
                          ),
                        _ => TextStyle(
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                            color: textColor,
                          ),
                      },
                    ),
                  ),
                  if (iconSuffix == true && iconAsset != null)
                    Expanded(child: Image.asset(iconAsset!)),
                  if (iconSuffix == true && icon != null) //
                    Expanded(child: Icon(icon)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
