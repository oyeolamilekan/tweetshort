import 'package:flutter/material.dart';

import '../config/size_config.dart';
import '../extentions/num.dart';

class TWEETSHORTButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double radius;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Function? onPressed;
  final List<BoxShadow>? boxShadow;
  final Border? border;

  const TWEETSHORTButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width,
    this.height = 50.0,
    this.radius = 8,
    this.color,
    this.padding,
    this.margin,
    this.border,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      color: Colors.transparent,
      child: Container(
        width: width ?? 100.w,
        height: height,
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: border,
          boxShadow: boxShadow,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onPressed as void Function()?,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
