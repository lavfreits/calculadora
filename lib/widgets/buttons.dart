import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.nameButton,
      this.colorTxtBtn,
      this.colorBtn,
      this.shape,
      this.padding,
      required this.onTap});

  final String nameButton;
  final Color? colorTxtBtn;
  final Color? colorBtn;
  final ShapeBorder? shape;
  final double? padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
          padding: EdgeInsets.only(
              top: 10, bottom: 10, left: padding ?? 10, right: padding ?? 10),
          onPressed: onTap,
          //todo
          elevation: 2.0,
          fillColor: colorBtn ?? Colors.deepPurple[200],
          shape: shape ?? const CircleBorder(),
          child: Center(
            child: Text(
              nameButton,
              style:
                  TextStyle(color: colorTxtBtn ?? Colors.white, fontSize: 20),
            ),
          )),
    );
  }
}
