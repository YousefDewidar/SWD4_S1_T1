import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  const CustomDropDown({super.key, required this.items});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedPeriod;

  @override
  void initState() {
    super.initState();
    selectedPeriod = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
    
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        padding: EdgeInsets.symmetric(horizontal: 12),
        value: selectedPeriod,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
        underline: SizedBox(),
        style: const TextStyle(fontSize: 14, color: Colors.black),
        onChanged: (String? newValue) {
          setState(() {
            selectedPeriod = newValue!;
          });
        },
        items:
            widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
      ),
    );
  }
}
