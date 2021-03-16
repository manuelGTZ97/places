import 'package:flutter/material.dart';

class OvalGradientContainer extends StatelessWidget {
  final String title;
  final double height;
  final double borderBottomLeft;
  final double borderBottomRight;

  OvalGradientContainer(
      {this.title, this.height, this.borderBottomLeft, this.borderBottomRight});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.centerLeft,
        child: Text(
          title ?? 'Places App',
          style: Theme.of(context).textTheme.headline5,
        ),
        height: height ?? 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(borderBottomLeft ?? 40),
              bottomRight: Radius.circular(borderBottomRight ?? 40)),
        ));
  }
}
