import 'package:flutter/material.dart';

class ReuseContainer extends StatelessWidget {
  Color color;
  Widget customChild;
  ReuseContainer({
    Key? key,
    required this.color,
    required this.customChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: customChild,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
