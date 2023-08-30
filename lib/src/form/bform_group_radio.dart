import 'package:flutter/material.dart';

import 'bform_obj.dart';

class BformGroupRadio extends StatefulWidget {
  final BformObj item;
  final List<BformObj> listItems;
  final String label;
  final ValueChanged<BformObj> onChange;
  final double padding;
  final Color? color;
  final BoxBorder? border;

  const BformGroupRadio({
    Key? key,
    required this.label,
    required this.listItems,
    required this.item,
    required this.onChange,
    this.padding = 0,
    this.border,
    this.color,
  }) : super(key: key);

  @override
  State<BformGroupRadio> createState() => _BformGroupRadioState();
}

class _BformGroupRadioState extends State<BformGroupRadio> {
  late BformObj seletedValue;

  @override
  void initState() {
    seletedValue = widget.item;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BformGroupRadio oldWidget) {
    super.didUpdateWidget(oldWidget);
    seletedValue = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(widget.padding),
          decoration: decoration(),
          child: Column(
            children: [
              for (var item in widget.listItems)
                RadioListTile<BformObj>(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.title),
                      Image(
                        image: AssetImage(item.imagePath),
                        height: 50,
                      ),
                    ],
                  ),
                  value: item,
                  groupValue: seletedValue,
                  onChanged: (value) {
                    widget.onChange(value!);
                    setState(() {
                      seletedValue = value;
                    });
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: widget.color,
      border: widget.border,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
