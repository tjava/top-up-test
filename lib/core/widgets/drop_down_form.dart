import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/constants/string_constant.dart';
import 'package:top_up_test/core/widgets/column_sized_box.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';

class DropDownForm extends StatefulWidget {
  final String? label;
  final List<DropDownItem> items;
  final Function(String item) onChange;
  final DropDownItem? selected;
  const DropDownForm({
    super.key,
    this.label,
    required this.items,
    required this.onChange,
    this.selected,
  });

  @override
  State<DropDownForm> createState() => _DropDownFormState();
}

class _DropDownFormState extends State<DropDownForm> {
  DropDownItem? _selectedValue;

  bool _validated = false;
  bool _first = true;

  DropDownItem? _getSelectedValue() {
    return widget.items.contains(_selectedValue) ? _selectedValue : null;
  }

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          GenericText(
            text: widget.label!,
            size: 14.sp,
            color: _selectedValue == null ? grey : black,
            weight: FontWeight.w700,
          ),
        ColumnSizedBox(5.h),
        Container(
          height: 43.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _selectedValue == null ? grey : white,
            border: Border.all(
              color: grey,
              // width: 1.4.h,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DropdownButtonFormField<DropDownItem>(
            value: _getSelectedValue(),
            validator: (value) {
              _first = false;
              if (value == null) {
                _validated = false;
              } else {
                _validated = true;
              }
              setState(() {});
              return null;
            },
            hint: GenericText(
              text: 'Select item',
              weight: FontWeight.w500,
              color: _selectedValue == null ? deepGrey : black,
            ),
            icon: Icon(
              Icons.expand_more,
              size: 20.sp,
              color: lightGrey,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.transparent,
              filled: true,
            ),
            items: widget.items.map<DropdownMenuItem<DropDownItem>>(
              (DropDownItem value) {
                return DropdownMenuItem<DropDownItem>(
                  value: value,
                  child: GenericText(
                    text: value.title,
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                );
              },
            ).toList(),
            onChanged: (DropDownItem? newValue) {
              widget.onChange(newValue!.title);
              _selectedValue = newValue;
              setState(() {});
            },
          ),
        ),
        if (!_first)
          if (!_validated) ...[
            ColumnSizedBox(5.h),
            GenericText(
              text: '  $errRequiredMsg',
              size: 11.sp,
              weight: FontWeight.w400,
              color: red,
            ),
          ]
      ],
    );
  }
}

class DropDownItem extends Equatable {
  final String title;

  const DropDownItem({required this.title});

  @override
  List<Object> get props => [title];
}
