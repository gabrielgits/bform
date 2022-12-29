import 'package:bform/bform.dart';
import 'package:bform/src/models/ibform_model.dart';
import 'package:flutter/material.dart';

class BformGroupRadio extends StatefulWidget {
  final IBformModel select;
  final List<IBformModel> itemsList;
  final String label;
  final ValueChanged<IBformModel> onChange;
  final double padding;
  final Color? color;
  final BoxBorder? border;
  final BformAppearance? appearance;
  final DecorationImage? background;

  const BformGroupRadio({
    Key? key,
    required this.label,
    required this.itemsList,
    required this.select,
    required this.onChange,
    this.padding  = 0,
    this.appearance,
    this.border,
    this.background,
    this.color = Colors.white54,
  }) : super(key: key);

  @override
  State<BformGroupRadio> createState() => _BformGroupRadioState();
}

class _BformGroupRadioState extends State<BformGroupRadio> {
  late IBformModel seletedValue;

  @override
  void initState() {
    super.initState();
    seletedValue = widget.select;
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
              for (var item in widget.itemsList)
                RadioListTile<IBformModel>(
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
    if (widget.appearance == BformAppearance.soft) {
      return BoxDecoration(
        border:widget.border,
        image: widget.background,
        //borderRadius: BorderRadius.circular(10),
        //boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.black12)],
      );
    } else if (widget.appearance == BformAppearance.business) {
      return BoxDecoration(
        color: widget.color,
        border: widget.border,
        image: widget.background,
        //borderRadius: BorderRadius.circular(8),
        // boxShadow: const [BoxShadow(blurRadius: 2)],
      );
    } else if (widget.appearance == BformAppearance.sky) {
      return BoxDecoration(
        color: widget.color,
        border: widget.border,
        image: widget.background,
        borderRadius: BorderRadius.circular(16),
        //boxShadow: const [BoxShadow(blurRadius: 2)],
      );
    }
    return BoxDecoration(
      color: widget.color,
      border: widget.border,
      image: widget.background,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
