import 'package:flutter/material.dart';

import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';

class KTextField extends StatefulWidget {
  final String hintText;
  final bool isPasswordField;
  final TextInputType type;

  const KTextField({
    Key key,
    this.hintText,
    this.isPasswordField,
    this.type,
  }) : super(key: key);

  @override
  _KTextFieldState createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: KSize.geHeight(context, 46),
      decoration: BoxDecoration(
          color: KColor.whiteSmoke, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextField(
          keyboardType: widget.type,
          obscureText: widget.isPasswordField,
          textAlignVertical:
              widget.isPasswordField ? TextAlignVertical.center : null,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
              )),
        ),
      ),
    );
  }
}
