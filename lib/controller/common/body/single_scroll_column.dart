import 'package:flutter/material.dart';


class SingleScrollColumn extends StatelessWidget {
  const SingleScrollColumn({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.horizontalPadding =  16.0,
    this.verticalPadding =  16.0,
    required this.children,
    this.containerHeight,
  }) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double horizontalPadding;
  final double verticalPadding;
  final List<Widget> children;
  final double? containerHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}
