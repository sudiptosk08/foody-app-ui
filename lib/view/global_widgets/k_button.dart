import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class KButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;

  const KButton({Key key, this.buttonText, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: KSize.geHeight(context, 50),
        width: context.screenWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
          onPressed: onPressed,
          child: Text(buttonText, style: KTextStyle.button),
        ));
  }
}
