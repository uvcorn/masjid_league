import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? showCheckbox;
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  final String leadingText;
  final TextStyle? leadingTextStyle;
  final String clickableText;
  final TextStyle? clickableTextStyle;
  final VoidCallback? onLinkTap;
  final bool useSpaceBetweenAlignment;
  final bool centerAlignment;
  final double checkboxLabelSpacing;

  const CustomCheckbox({
    super.key,
    this.showCheckbox = true,
    this.value,
    this.onChanged,
    required this.leadingText,
    this.leadingTextStyle,
    required this.clickableText,
    this.clickableTextStyle,
    this.onLinkTap,
    this.useSpaceBetweenAlignment = false,
    this.centerAlignment = false,
    this.checkboxLabelSpacing = 0.0,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value ?? false;
  }

  @override
  void didUpdateWidget(covariant CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && widget.value != null) {
      _isChecked = widget.value!;
    }
  }

  void _toggleCheck() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChanged?.call(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final MainAxisAlignment rowAlignment = widget.useSpaceBetweenAlignment
        ? MainAxisAlignment.spaceBetween
        : (widget.centerAlignment
              ? MainAxisAlignment.center
              : MainAxisAlignment.start);

    return Row(
      mainAxisAlignment: rowAlignment,
      children: [
        GestureDetector(
          onTap: _toggleCheck,
          behavior: HitTestBehavior.opaque,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showCheckbox ?? true)
                Transform.translate(
                  offset: const Offset(-8.0, 0.0),
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (newValue) => _toggleCheck(),
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              SizedBox(width: widget.checkboxLabelSpacing.w),
              Transform.translate(
                offset: const Offset(-8.0, 0.0),
                child: Text(
                  widget.leadingText,
                  style:
                      widget.leadingTextStyle ??
                      textTheme.bodyMedium?.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),

        if (!widget.useSpaceBetweenAlignment && !widget.centerAlignment)
          SizedBox(width: 0.w),

        if (widget.useSpaceBetweenAlignment) const Spacer(),

        GestureDetector(
          onTap: widget.onLinkTap,
          child: Text(
            widget.clickableText,
            style: widget.clickableTextStyle ?? textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
