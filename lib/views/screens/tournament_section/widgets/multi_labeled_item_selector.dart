import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_text/custom_text.dart';
import 'label_item_card.dart';
import 'show_labeled_item_dialog.dart';

class MultiLabeledItemSelector extends StatefulWidget {
  final String label; // e.g. "Venue", "Division"
  final String initialText;

  const MultiLabeledItemSelector({
    super.key,
    required this.label,
    required this.initialText,
  });

  @override
  State<MultiLabeledItemSelector> createState() =>
      _MultiLabeledItemSelectorState();
}

class _MultiLabeledItemSelectorState extends State<MultiLabeledItemSelector> {
  late List<String> items;

  @override
  void initState() {
    super.initState();
    items = [widget.initialText];
  }

  Future<void> _addItem() async {
    final result = await showLabeledItemDialog(
      context: context,
      title: "Add ${widget.label}",
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        items.add(result.trim());
      });
    }
  }

  Future<void> _editItem(int index) async {
    final result = await showLabeledItemDialog(
      context: context,
      title: "Edit ${widget.label}",
      initialValue: items[index],
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        items[index] = result.trim();
      });
    }
  }

  void _deleteItem(int index) {
    if (items.length > 1) {
      setState(() {
        items.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Item list
        ...List.generate(items.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: LabeledItemCard(
              index: index,
              text: items[index],
              onEdit: () => _editItem(index),
              onDelete: items.length > 1 ? () => _deleteItem(index) : null,
            ),
          );
        }),

        /// Add Button
        GestureDetector(
          onTap: _addItem,
          child: Container(
            height: 40.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.mediumGray),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: CustomText(
                text: "Add ${widget.label}",
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
