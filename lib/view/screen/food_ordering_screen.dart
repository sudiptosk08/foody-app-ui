
import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bottom_navigation_screen.dart';

class FoodOrderingScreen extends StatefulWidget {
  const FoodOrderingScreen({Key key}) : super(key: key);

  @override
  _FoodOrderingScreenState createState() => _FoodOrderingScreenState();
}

class _FoodOrderingScreenState extends State<FoodOrderingScreen> {
  int selectedIndex = 0;
  final List<String> foodOrderImageList = [
    'assets/images/foodOrder1.png',
    'assets/images/foodOrder2.png',
    'assets/images/foodOrder3.png',
  ];
  final List<String> restaurantNameList = [
    '4 Item from KFC',
    'assets/images/foodOrder2.png',
    'assets/images/foodOrder1.png',
  ];

  void changeOder(int index) {
    selectedIndex = index;
  }

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
          //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: KColor.black,)),
          title: Padding(
            padding: EdgeInsets.only(
                left: KSize.getWidth(context, 18),
                right: KSize.getWidth(context, 18),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/back.png',
                      height: KSize.geHeight(context, 18),
                      width: KSize.getWidth(context, 18),
                      fit: BoxFit.fitHeight,
                    )),*/
                Spacer(),
                Transform.translate(
                    offset: Offset(-15, 0),
                    child: Text('My Order', style: KTextStyle.headline8)),
                Spacer()
              ],
            ),
          ),
        ),
        backgroundColor: KColor.white,
        body: Container(
          // margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Spacing
              SizedBox(height: KSize.geHeight(context, 30)),

              /// Order Status
              Container(
                  height: KSize.geHeight(context, 44),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: KColor.lightness.withOpacity(0.5))),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: KSize.getWidth(context, 29)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text('Complete Order',
                                      style: KTextStyle.bodyText.copyWith(
                                          color: selectedIndex == 0
                                              ? KColor.primary
                                              : KColor.secondary)),
                                  Spacer(),
                                  Image.asset('assets/images/line.png',
                                      height: KSize.geHeight(context, 2),
                                      width: KSize.getWidth(context, 90),
                                      fit: BoxFit.cover,
                                      color: selectedIndex == 0
                                          ? KColor.primary
                                          : Colors.transparent)
                                ],
                              )),
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text('Pending Order',
                                      style: KTextStyle.bodyText.copyWith(
                                          color: selectedIndex == 1
                                              ? KColor.primary
                                              : KColor.secondary)),
                                  Spacer(),
                                  Image.asset('assets/images/line.png',
                                      height: KSize.geHeight(context, 2),
                                      width: KSize.getWidth(context, 90),
                                      fit: BoxFit.cover,
                                      color: selectedIndex == 1
                                          ? KColor.primary
                                          : Colors.transparent)
                                ],
                              ))
                        ],
                      ))),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 30)),

              ///Food Order List
              Expanded(
                child: ListView.builder(
                    itemCount: foodOrderImageList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: KSize.getWidth(context, 18)),
                        height: KSize.geHeight(context, 120),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: KSize.geHeight(context, 20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Container(
                                      height: KSize.geHeight(context, 88),
                                      width: KSize.getWidth(context, 80),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(image:
                                         AssetImage(foodOrderImageList[index],),fit: BoxFit.cover)
                                      ),
                                      
                                      ),
                               Padding(
                                      padding: EdgeInsets.only(
                                          left: KSize.getWidth(context, 8),
                                          top: KSize.getWidth(context, 18),
                                          ),
                                      child: Container(
                                        width: 150,
                                      
                                        child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('4 Item from KFC',
                                                style: KTextStyle.bodyText
                                                    .copyWith(
                                                        color: KColor.secondary,
                                                        fontSize: 15,
                                                        height: 0.5)),
                                            SizedBox(
                                                height:
                                                     5),
                                            Text(
                                                'Pizza,Alo Bhorta,Thetul acar,Chicken tiriaky',
                                                maxLines: 2,
                                                style: KTextStyle.bodyText2
                                                    .copyWith(
                                                        color: KColor.glide,
                                                        fontSize: 13,
                                                        )),
                                            SizedBox(height: 9.5,),
                                            Expanded(
                                                child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/pepper.png',
                                                            fit: BoxFit.fill,
                                                            height:
                                                                KSize.geHeight(
                                                                    context,
                                                                    10.99),
                                                            width: KSize.getWidth(
                                                                context, 9.82)),
                                                        SizedBox(
                                                            width:10),
                                                        Text('Spicy',
                                                            style: KTextStyle
                                                                .caption
                                                                .copyWith(
                                                                    height: 1))
                                                      ],
                                                    ))),
                                            SizedBox(
                                                height:
                                                    KSize.geHeight(context, 3)),
                                          ],
                                        ),
                                      )),
                              Column(
                               
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: EdgeInsets.only(top: KSize.geHeight(context, 16)),
                                  child: Text('\$59',
                                          style: KTextStyle.bodyText.copyWith(
                                              color: KColor.secondary,
                                              fontSize: 15,
                                              height: 1)),
                                  ),
                                   
                                
                                   Text('Order Again',
                                          style: KTextStyle.subTitle1.copyWith(fontSize: 15)
                                              )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
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
