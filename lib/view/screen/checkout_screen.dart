import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/view/global_widgets/k_button.dart';
import 'package:flutter_app/view/screen/bottom_navigation_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class CheckoutScreen extends KFDrawerContent {
  final bool dataPass;

  CheckoutScreen({this.dataPass = false, Key key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int cardIndex = 0;
  bool value = false;
  final List<String> cardImageList = [
    'assets/images/card1.png',
    'assets/images/card1.png',
    'assets/images/card2.png',
    'assets/images/card3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            titleSpacing: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: KColor.black,
              ),
            ),
            title: Padding(
                padding: EdgeInsets.only(
                  left: KSize.getWidth(context, 18),
                  right: KSize.getWidth(context, 18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          context.nextReplacementPage(BottomNavigationScreen());
                        },
                        child: widget.dataPass
                            ? Image.asset('assets/images/back.png',
                                height: KSize.geHeight(context, 18),
                                width: KSize.getWidth(context, 18),
                                fit: BoxFit.fitHeight)
                            : Container()),
                    Spacer(),
                    Transform.translate(
                        offset: Offset(-15, 0),
                        child: Text('Checkout', style: KTextStyle.headline8)),
                    Spacer()
                  ],
                ))),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin:
                EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Spacing
                SizedBox(height: KSize.geHeight(context, 46)),
                Text('Delivery Details',
                    style: KTextStyle.headline8
                        .copyWith(fontWeight: FontWeight.w500)),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 11)),

                /// Address Text .... Change
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('New York, Street 12, Calofony\nRoad USA',
                        style:
                            KTextStyle.caption.copyWith(color: KColor.glide)),
                    Text('Change',
                        style:
                            KTextStyle.caption.copyWith(color: KColor.primary))
                  ],
                ),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 26)),

                ///  Contact Number Text .... Change
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('+880-17048-3990',
                        style:
                            KTextStyle.caption.copyWith(color: KColor.glide)),
                    Text('Change',
                        style:
                            KTextStyle.caption.copyWith(color: KColor.primary))
                  ],
                ),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 30)),

                Text('Payment Method',
                    style: KTextStyle.headline4.copyWith(fontSize: 18)),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 12)),
                SizedBox(
                  height: KSize.geHeight(context, 75),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cardImageList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(
                                right: KSize.getWidth(context, 14)),
                            child: Center(
                                child: Container(
                                    height: KSize.geHeight(context, 75),
                                    width: index == 0
                                        ? KSize.getWidth(context, 48)
                                        : KSize.getWidth(context, 80),
                                    decoration: BoxDecoration(
                                        borderRadius: index == 0
                                            ? BorderRadius.circular(35)
                                            : BorderRadius.circular(18),
                                        border: Border.all(
                                            color: KColor.lightness)),
                                    child: index != 0
                                        ? Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Image.asset(
                                                cardImageList[index],
                                                fit: BoxFit.contain),
                                          )
                                        : Icon(Icons.add,
                                            color: KColor.primary, size: 30))));
                      }),
                ),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 30)),

                /// CheckBox
                Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          value = !value;
                        });
                      },
                      child: Container(
                        height: KSize.geHeight(context, 22),
                        width: KSize.getWidth(context, 19),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: KColor.primary, width: 2)),
                        child: value
                            ? Icon(Icons.check, size: 10, color: KColor.primary)
                            : Container(),
                      ),
                    ),
                    SizedBox(width: KSize.getWidth(context, 11)),
                    Text('Use cash on delivery',
                        style: KTextStyle.subTitle1
                            .copyWith(color: KColor.secondary))
                  ],
                ),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 40)),

                /// Delivery Fee
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery Fee',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.glide)),
                    Text('\$5.30',
                        style: KTextStyle.headline4.copyWith(fontSize: 15))
                  ],
                ),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.glide)),
                    Text('\$311.05',
                        style: KTextStyle.headline4.copyWith(fontSize: 15))
                  ],
                ),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 20.5)),
                Divider(color: KColor.greyLight, height: 1),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 20.5)),

                /// Delivery Time Text
                Text('Delivery Time',
                    style: KTextStyle.bodyText2.copyWith(color: KColor.glide)),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 9.5)),

                /// Date Time  Edit Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('28 Feb 2021',
                        style: KTextStyle.subTitle1
                            .copyWith(color: KColor.secondary)),
                    SizedBox(width: KSize.getWidth(context, 114)),
                    Text('10:30 am',
                        style: KTextStyle.subTitle1
                            .copyWith(color: KColor.secondary)),
                    Spacer(),
                    Text('Edit', style: KTextStyle.subTitle1)
                  ],
                ),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 83)),

                /// Button
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: KSize.getWidth(context, 22)),
                    child: KButton(
                        buttonText: 'CONFIRM',
                        onPressed: () {
                          context.nextPage(BottomNavigationScreen());
                        },
                        color: KColor.primary)),

                /// Spacing
                SizedBox(height: KSize.geHeight(context, 52)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}
