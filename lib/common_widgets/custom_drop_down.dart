import 'package:flutter/material.dart';
import 'package:kodiary_test/constants/custom_sizedBox.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.dropdownValue,
    required this.items,
    required this.headingText,
    this.onChanged,
  });

  final String headingText;
  final String dropdownValue;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headingText,
          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        sBoxH10,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(4.0),
          ),
          width: double.infinity,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
