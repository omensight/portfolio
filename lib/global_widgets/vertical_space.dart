import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class VerticalSpace extends StatelessWidget {
  final double verticalSpace;
  const VerticalSpace({
    super.key,
    this.verticalSpace = kSpace,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSpace,
    );
  }
}
