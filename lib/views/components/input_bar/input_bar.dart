import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';

class InputBar extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNode;
  final bool hasText;
  final VoidCallback onEmojiPressed;
  final VoidCallback onImagePressed;
  final VoidCallback? onAttachPressed; // nullable
  final VoidCallback onSendPressed;

  final InputDecoration? decoration;
  // final String? attachicon;
  // final String? imageicon;

  const InputBar({
    super.key,
    required this.textController,
    required this.focusNode,
    required this.hasText,
    required this.onEmojiPressed,
    required this.onImagePressed,
    this.onAttachPressed, // optional now
    required this.onSendPressed,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            minLines: 1,
            maxLines: 3,
            controller: textController,
            focusNode: focusNode,
            decoration: decoration,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(
            Icons.sentiment_satisfied_alt_outlined,
            color: AppColors.mediumGray,
          ),
          onPressed: onEmojiPressed,
        ),

        // Show attach button only if onAttachPressed is not null
        if (onAttachPressed != null)
          IconButton(icon: Icon(Icons.attach_file), onPressed: onAttachPressed),

        IconButton(icon: Icon(Icons.image), onPressed: onImagePressed),

        const SizedBox(width: 4),

        if (hasText)
          IconButton(
            icon: const Icon(Icons.send, color: AppColors.primary),
            onPressed: () {
              onSendPressed();
            },
          ),
      ],
    );
  }
}
