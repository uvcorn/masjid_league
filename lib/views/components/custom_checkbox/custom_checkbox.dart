import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? showCheckbox;
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  final String leadingText;
  final TextStyle? leadingTextStyle;
  final String clickableText;
  final TextStyle? clickableTextStyle;
  final VoidCallback onLinkTap;
  final bool useSpaceBetweenAlignment;
  final bool centerAlignment;

  const CustomCheckbox({
    super.key,
    this.showCheckbox,
    this.value,
    this.onChanged,
    required this.leadingText,
    this.leadingTextStyle,
    required this.clickableText,
    this.clickableTextStyle,
    required this.onLinkTap,
    this.useSpaceBetweenAlignment = false,
    this.centerAlignment = false,
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

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final MainAxisAlignment mainRowAlignment = widget.useSpaceBetweenAlignment
        ? MainAxisAlignment.spaceBetween
        : (widget.centerAlignment
              ? MainAxisAlignment.center
              : MainAxisAlignment.start);

    final bool shouldShowCheckbox = widget.showCheckbox == true;

    return Row(
      mainAxisAlignment: mainRowAlignment,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (shouldShowCheckbox)
              Transform.translate(
                offset: const Offset(-8.0, 0.0),
                child: Checkbox(
                  value: _isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isChecked = newValue ?? false;
                    });
                    widget.onChanged?.call(newValue);
                  },
                  activeColor: Colors.grey,
                  checkColor: Colors.white,
                  materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap, // Keep this!
                ),
              ),

            // Padding(
            //   padding: const EdgeInsets.only(left: -4.0), // Experiment with negative values
            //   child: Text(widget.leadingText, style: widget.leadingTextStyle ?? textTheme.bodySmall),
            // ),
            Text(
              widget.leadingText,
              style: widget.leadingTextStyle ?? textTheme.bodySmall,
            ),
          ],
        ),

        if (!widget.useSpaceBetweenAlignment && !widget.centerAlignment)
          const SizedBox(width: 4),
        if (widget.useSpaceBetweenAlignment) const Spacer(),

        GestureDetector(
          onTap: widget.onLinkTap,
          child: Text(
            widget.clickableText,
            style: widget.clickableTextStyle ?? textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
