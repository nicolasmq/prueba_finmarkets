
import 'package:flutter/material.dart';

class CardChip extends StatelessWidget {
  const CardChip({
    super.key,
    required this.label,
    this.onTap
  });

  final String? label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.8),
            borderRadius: BorderRadius.circular(5.0)),
        child: Center(
          child: Text(
            label!,
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: const TextStyle(
                overflow: TextOverflow.fade,
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}