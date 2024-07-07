import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';

class TopUpOptions extends StatefulWidget {
  final Function(String?) onChange;
  const TopUpOptions({super.key, required this.onChange});

  @override
  State<TopUpOptions> createState() => _TopUpOptionsState();
}

class _TopUpOptionsState extends State<TopUpOptions> {
  String? _selectedOption;

  List<String> topUpOptions = const [
    'AED 5',
    'AED 10',
    'AED 20',
    'AED 30',
    'AED 50',
    'AED 75',
    'AED 100',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 0,
      children: topUpOptions.map((option) {
        return FilterChip(
          backgroundColor: white,
          selectedColor: white,
          checkmarkColor: blue,
          side: BorderSide(
            color: _selectedOption == option ? blue : grey,
            width: 1.4.h,
          ),
          label: GenericText(
            text: option,
            size: 13.sp,
            color: _selectedOption == option ? blue : deepGrey.withOpacity(.5),
          ),
          selected: _selectedOption == option,
          onSelected: (bool selected) {
            _selectedOption = selected ? option : null;
            widget.onChange(_selectedOption);
            setState(() {});
          },
        );
      }).toList(),
    );
  }
}
