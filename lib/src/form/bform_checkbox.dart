import 'package:flutter/material.dart';

class BformCheckbox extends StatefulWidget {
  final String label;
  final VoidCallback? onChange;
  final double padding;
  final Color? color;
  final BoxBorder? border;
  final bool inicialState;

  const BformCheckbox({
    Key? key,
    required this.label,
    this.onChange,
    this.padding = 0,
    this.border,
    this.color,
    this.inicialState = false,
  }) : super(key: key);

  @override
  State<BformCheckbox> createState() => _BformGroupRadioState();
}

class _BformGroupRadioState extends State<BformCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = widget.inicialState;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
        border: widget.border,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Checkbox(
            checkColor: widget.color,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          const SizedBox(width: 10),
          Text(
            widget.label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
