import 'package:flutter/material.dart';

class BformCheckbox extends StatefulWidget {
  final String label;
  final Function(bool)? onChange;
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
    super.initState();
    isChecked = widget.inicialState;
  }

  @override
  void didUpdateWidget(covariant BformCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    isChecked = widget.inicialState;
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
              widget.onChange!(value!);
              setState(() {
                isChecked = value;
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
