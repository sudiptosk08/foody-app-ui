import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';

import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  String imagePath;
  String titleText;
  String subtitle;
  String price;

  CartItem({Key key, this.imagePath, this.titleText, this.price, this.subtitle})
      : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  var chosenValue;
  var count = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: KSize.geHeight(context, 5)),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.15,
        child: Container(
          height: KSize.geHeight(context, 130),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: KSize.geHeight(context, 130),
                width: KSize.getWidth(context, 120),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          widget.imagePath,
                        ),
                        fit: BoxFit.contain)),
              ),
              Container(
                width: KSize.getWidth(context, 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: KSize.geHeight(context, 15)),
                      child: Text(widget.titleText,
                          maxLines: 1,
                          style: KTextStyle.headline4.copyWith(
                            fontSize: 18,
                          )),
                    ),
                    Text('Spicy chicken, beef',
                        style:
                            KTextStyle.caption.copyWith(color: KColor.glide)),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '\$',
                          style: KTextStyle.subTitle1.copyWith(
                            fontSize: 15.43,
                          )),
                      TextSpan(
                          text: widget.price,
                          style: KTextStyle.headline8.copyWith(
                            fontSize: 19.84,
                            fontWeight: FontWeight.normal,
                          )),
                    ])),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: KSize.geHeight(context, 14),
                        right: KSize.geHeight(context, 12.78)),
                    child: Transform.translate(
                        offset: Offset(10, 0),
                        child: SizedBox(
                            height: KSize.geHeight(context, 18),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                              focusColor: KColor.primary,
                              value: chosenValue,
                              style: TextStyle(color: KColor.secondary),
                              iconEnabledColor: KColor.secondary,
                              items: <String>[
                                'M',
                                'S',
                                'L',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: KTextStyle.headline4
                                          .copyWith(fontSize: 14)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  chosenValue = value;
                                });
                              },
                            )))),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding:
                            EdgeInsets.only(bottom: KSize.geHeight(context, 5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: KSize.geHeight(context, 26.19),
                                width: KSize.getWidth(context, 26.28),
                                margin: EdgeInsets.only(
                                    right: KSize.getWidth(context, 7.72)),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: KColor.primary)),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (count == 1) {
                                          count;
                                        } else {
                                          --count;
                                        }
                                      });
                                    },
                                    child: Icon(Icons.remove,
                                        color: KColor.primary, size: 20))),
                            Text(count.toString(),
                                style: TextStyle(fontSize: 20.0)),
                            Container(
                              height: KSize.geHeight(context, 28.28),
                              width: KSize.getWidth(context, 28.28),
                              margin: EdgeInsets.only(
                                  left: KSize.getWidth(context, 7.72),
                                  right: KSize.getWidth(context, 7.72)),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: KColor.primary),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  child: Icon(Icons.add,
                                      color: KColor.white, size: 20)),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        closeOnScroll: true,
        secondaryActions: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Image.asset('assets/images/delete.png',
                fit: BoxFit.fitHeight,
                width: KSize.getWidth(context, 75),
                height: KSize.geHeight(context, 80)),
          )
        ],
      ),
    );
  }
}
