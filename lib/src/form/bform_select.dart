import 'package:flutter/material.dart';

import 'bform_obj.dart';

class BformSelect extends StatefulWidget {
  final BformObj item;
  final List<BformObj> listItems;
  final String label;
  final ValueChanged<BformObj> onChange;
  final double padding;
  final Color? color;
  final BoxBorder? border;

  const BformSelect({
    Key? key,
    required this.label,
    required this.listItems,
    required this.item,
    required this.onChange,
    this.padding = 5,
    this.border,
    this.color,
  }) : super(key: key);

  @override
  State<BformSelect> createState() => _BformSelectState();
}

class _BformSelectState extends State<BformSelect> {
  late BformObj seletedValue;

  @override
  void initState() {
    super.initState();
    seletedValue = widget.item;
  }

  @override
  void didUpdateWidget(covariant BformSelect oldWidget) {
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
          width: 200,
          padding: EdgeInsets.all(widget.padding),
          decoration: decoration(),
          child: DropdownButton<BformObj>(
            value: seletedValue,
            icon: const SizedBox(),
            underline: const SizedBox(),
            onChanged: (value) {
              widget.onChange(value!);
              setState(() {
                seletedValue = value;
              });
            },
            items: widget.listItems
                .map<DropdownMenuItem<BformObj>>((BformObj value) {
              return DropdownMenuItem(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value.title),
                    Image(
                      image: AssetImage(value.imagePath),
                      height: 50,
                    ),
                  ],
                ),
              );
            }).toList(),
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
