import 'package:flutter/material.dart';

import 'utils/bform_appearance.dart';

class BformTimerPicker extends StatefulWidget {
  final Widget title;
  final Color? buttonColor;
  final String? buttonText;
  final BformAppearance? appearance;
  final Color? color;
  final BoxBorder? border;
  final ValueChanged<String>? onChange;
  final TextStyle? textStyle;

  const BformTimerPicker({
    super.key,
    required this.title,
    this.buttonColor,
    this.buttonText,
    this.appearance,
    this.color,
    this.border,
    this.onChange,
    this.textStyle,
  });

  @override
  State<BformTimerPicker> createState() => _BformTimerPickerState();
}

class _BformTimerPickerState extends State<BformTimerPicker> {
  TimeOfDay data = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title,
        const SizedBox(height: 10),
        Container(
          decoration: decoration(),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(data.format(context), style: widget.textStyle),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: widget.buttonColor),
                onPressed: () async {
                  final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: data,
                    initialEntryMode: TimePickerEntryMode.input,
                    /*
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child ?? Container(),
                      );
                    },
                    */
                  );
                  if (timeOfDay != null && timeOfDay != data) {
                    setState(() {
                      data = timeOfDay;
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.timer),
                    Text(
                      widget.buttonText ?? 'Change',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Decoration decoration() {
    if (widget.appearance == BformAppearance.soft) {
      return BoxDecoration(
        border: widget.border,
        borderRadius: BorderRadius.circular(15),
      );
    } else if (widget.appearance == BformAppearance.business) {
      return BoxDecoration(color: widget.color, border: widget.border);
    } else if (widget.appearance == BformAppearance.sky) {
      return BoxDecoration(
        color: widget.color,
        border: widget.border,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(blurRadius: 1)],
      );
    }
    return BoxDecoration(
      color: widget.color,
      border: widget.border,
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [BoxShadow(blurRadius: 5)],
    );
  }
}
