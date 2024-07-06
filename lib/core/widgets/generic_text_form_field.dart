import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/constants/string_constant.dart';
import 'package:top_up_test/core/utils/text_field_validators.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';

class GenericTextFormField extends StatefulWidget {
  final TextEditingController editingController;
  final String label;
  final String? hint;
  final String? errorText;
  final IconData? icon;
  final TextInputType inputType;
  final TextAlign textAlign;
  final int maxLine;
  final int? maxLen;
  final bool isRequired;
  final bool showErrorMsg;
  final bool obscureText;
  final bool isBusy;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry contentPadding;
  // final bool shouldEnableClearbutton;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final List<TextFieldValidatorEntity>? validators;
  final double labelSize;
  final bool hasSpaceBetween;
  final bool willShowDot;
  final Color borderColor;

  const GenericTextFormField(
      {required this.editingController,
      required this.label,
      this.obscureText = false,
      this.inputType = TextInputType.text,
      this.textAlign = TextAlign.start,
      this.maxLine = 1,
      this.maxLen,
      this.isRequired = false,
      this.showErrorMsg = true,
      this.icon,
      this.hint,
      this.isBusy = false,
      this.onChanged,
      this.contentPadding = const EdgeInsets.all(8),
      // this.shouldEnableClearbutton = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.validator,
      this.validators,
      this.errorText,
      this.labelSize = 16,
      this.hasSpaceBetween = false,
      this.willShowDot = false,
      this.borderColor = grey,
      super.key});

  @override
  State<GenericTextFormField> createState() => _GenericTextFormFieldState();
}

class _GenericTextFormFieldState extends State<GenericTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (bool isFocused) {},
      skipTraversal: true,
      child: TextFormField(
        onChanged: widget.onChanged,
        keyboardType: widget.inputType,
        enabled: !widget.isBusy,
        maxLines: widget.maxLine,
        maxLength: widget.maxLen,
        cursorColor: grey,
        textAlignVertical: TextAlignVertical.center,
        textAlign: widget.textAlign,
        textCapitalization: widget.textCapitalization,
        validator: widget.validator ??
            (String? value) {
              if (widget.isRequired && value!.trim() == '') {
                return widget.showErrorMsg ? errRequiredMsg : '??';
              }

              if (widget.validators != null && value != null && value.trim() != '') {
                for (var validator in widget.validators!) {
                  if (!validator.isValid(value.trim())) {
                    return validator.message;
                  }
                }
              }
              return null;
            },
        controller: widget.editingController,
        obscureText: widget.obscureText,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: black,
        ),
        decoration: InputDecoration(
          label: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: GenericText(
              text: widget.label,
              color: deepGrey.withOpacity(.5),
              weight: FontWeight.w500,
            ),
          ),
          filled: true,
          fillColor: widget.editingController.text == '' ? grey : white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 1.4.h,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: grey,
              width: 1.4.h,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 1.4.h,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 1.4.h,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 1.4.h,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          errorStyle: TextStyle(
            color: red,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: widget.contentPadding,
          hintText: widget.hint,
          errorText: widget.errorText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
