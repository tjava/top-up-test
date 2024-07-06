import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/widgets/row_sized_box.dart';

class GenericButton extends StatefulWidget {
  final String? label;
  final Icon? icon;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final double width;
  final double height;
  final bool fulCurve;
  final bool isBusy;
  final Function()? onClick;
  final FocusNode? focusNode;

  const GenericButton({
    super.key,
    this.label,
    this.icon,
    this.labelColor,
    this.labelStyle,
    this.backgroundColor,
    this.width = 200.0,
    this.height = 52.0,
    this.fulCurve = true,
    required this.onClick,
    this.focusNode,
    this.isBusy = false,
  });

  @override
  State<GenericButton> createState() => _GenericButtonState();
}

class _GenericButtonState extends State<GenericButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        focusNode: widget.focusNode,
        onPressed: widget.isBusy ? null : widget.onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.fulCurve ? 30.0 : 8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.icon != null ? widget.icon! : const SizedBox(),
            RowSizedBox(3.w),
            widget.label != null
                ? Text(
                    widget.label ?? '',
                    style: widget.labelStyle ??
                        TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: widget.labelColor,
                        ),
                  )
                : const SizedBox(),
            _paddedLoading(),
          ],
        ),
      ),
    );
  }

  Widget _paddedLoading() {
    if (widget.isBusy) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: 16.w),
          const SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
