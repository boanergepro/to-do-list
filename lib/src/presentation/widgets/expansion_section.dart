import 'package:flutter/material.dart';

class ExpansionSection extends StatelessWidget {
  final ExpansionTileController controller;
  final bool initiallyExpanded;
  final String title;
  final List<Widget> children;

  const ExpansionSection({
    super.key,
    required this.controller,
    required this.initiallyExpanded,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      controller: controller,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
     shape: Border.all(color: Colors.transparent),
      collapsedShape: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: children,
    );
  }
}
