import 'package:flutter/material.dart';
import 'utils/bform_appearance.dart';

class BformDatePicker extends StatefulWidget {
  final Widget title;
  final String data;
  final Icon? icon;
  final BformAppearance? appearance;
  final String? errorText;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<String>? onChange;

  const BformDatePicker({
    Key? key,
    required this.title,
    required this.data,
    this.onChange,
    this.icon,
    this.appearance,
    this.errorText,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  @override
  State<BformDatePicker> createState() => _BformDatePickerState();
}

class _BformDatePickerState extends State<BformDatePicker> {
  DateTime data = DateTime.now();
  @override
  Widget build(BuildContext context) {
    TextEditingController dateInput =
        TextEditingController(text: '${data.day}/${data.month}/${data.year}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title,
        const SizedBox(height: 5),
        TextField(
          controller: dateInput,
          decoration: decoration(),
          readOnly: true,
          //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: data,
                firstDate: widget.firstDate ?? DateTime(2020),
                lastDate: widget.lastDate ?? DateTime(2030));

            if (pickedDate != null) {
              setState(() {
                data = pickedDate;
                dateInput.text =
                    '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}'; //set output date to TextField value.
              });
              if (widget.onChange != null) {
                widget.onChange!(
                    '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}');
              }
            }
          },
        )
      ],
    );
  }

  InputDecoration decoration() {
    final myIcon = widget.icon ?? const Icon(Icons.date_range);

    if (widget.appearance == BformAppearance.soft) {
      return InputDecoration(
        errorText: widget.errorText,
        icon: myIcon,
        border: InputBorder.none,
      );
    } else if (widget.appearance == BformAppearance.business) {
      return InputDecoration(
        errorText: widget.errorText,
        suffixIcon: myIcon,
        border: const OutlineInputBorder(),
      );
    } else if (widget.appearance == BformAppearance.sky) {
      return InputDecoration(
        errorText: widget.errorText,
        suffixIcon: myIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      );
    }
    return InputDecoration(
      errorText: widget.errorText,
      icon: myIcon,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
