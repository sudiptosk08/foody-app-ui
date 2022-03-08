import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bottom_navigation_screen.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({Key key}) : super(key: key);

  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  int selectedIndex = 0;
  final List<String> imageList = [
    'assets/images/base1.png',
    'assets/images/base2.png',
    'assets/images/base3.png',
    'assets/images/base4.png',
    'assets/images/base4.png',
  ];
  final List<String> restaurantImageList = [
    'assets/images/restaurantImg1.png',
    'assets/images/restaurantImg2.png',
    'assets/images/restaurantImg1.png',
  ];
  final List<String> restaurantNameList = [
    'Artisan Coffee Shop',
    'KAZY ASPARAGAS',
    'Artisan Coffee Shop',
  ];

  final List<String> categoryList = [
    'All',
    'Halal',
    'Spicy',
    'Vegetarian',
    'Fastfood',
  ];
  String _chosenValue2 = 'Deliver To';

  void changeIndex(int index) {
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
                    top: KSize.geHeight(context, 5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                          focusColor: KColor.primary,
                          dropdownColor: KColor.white,
                          value: _chosenValue2,
                          //elevation: 5,
                          style: TextStyle(color: KColor.primary),
                          iconEnabledColor: KColor.secondary,
                          icon: Icon(Icons.keyboard_arrow_down),

                          items: <String>[
                            'Deliver To',
                            'Sylhet',
                            'Dhaka',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: KTextStyle.subTitle1
                                      .copyWith(color: KColor.secondary)),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _chosenValue2 = value;
                            });
                          },
                        )),
                        Transform.translate(
                            offset: Offset(0, -15),
                            child: Text('Parijat, Housing Estate',
                                style: KTextStyle.subTitle1))
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Image.asset('assets/images/filter.png',
                            fit: BoxFit.scaleDown,
                            height: KSize.geHeight(context, 21),
                            width: KSize.getWidth(context, 21)))
                  ],
                ))),
        backgroundColor: KColor.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 18)),
          child: Column(
            children: [
              SizedBox(height: KSize.geHeight(context, 30)),

              /// Search TextField
              Container(
                alignment: Alignment.center,
                height: KSize.geHeight(context, 46),
                decoration: BoxDecoration(
                    color: KColor.whiteSmoke,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: KSize.geHeight(context, 14),
                              horizontal: KSize.getWidth(context, 14)),
                          child: Image.asset('assets/images/shape.png',
                              height: KSize.geHeight(context, 16),
                              width: KSize.getWidth(context, 16),
                              fit: BoxFit.fitHeight),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: KSize.geHeight(context, 13),
                              horizontal: KSize.getWidth(context, 14)),
                          child: Image.asset('assets/images/preferences.png',
                              height: KSize.geHeight(context, 13.76),
                              width: KSize.getWidth(context, 13.75),
                              fit: BoxFit.contain),
                        ),
                        hintText: 'Find Your Restaurants',
                        hintStyle: TextStyle(fontFamily: 'Poppins')),
                  ),
                ),
              ),

              SizedBox(height: KSize.geHeight(context, 20)),

              /// Restaurants Status List
              SizedBox(
                  height: KSize.geHeight(context, 78),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                changeIndex(index);
                              });
                            },
                            child: Padding(
                                padding: EdgeInsets.only(
                                    right: KSize.getWidth(context, 24)),
                                child: Column(
                                  children: [
                                    Image.asset(imageList[index],
                                        fit: BoxFit.fitHeight,
                                        height: KSize.geHeight(context, 51.71),
                                        width: KSize.getWidth(context, 52)),
                                    Spacer(),
                                    Text(categoryList[index],
                                        style: KTextStyle.subTitle1.copyWith(
                                            fontSize: 13,
                                            color: selectedIndex == index
                                                ? KColor.primary
                                                : KColor.secondary))
                                  ],
                                )));
                      })),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 30)),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: restaurantImageList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          height: KSize.geHeight(context, 230),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: KColor.white),
                          child: Card(
                              elevation: 1,
                              shadowColor: KColor.whiteSmoke.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      /// Restaurant Image
                                      Image.asset(restaurantImageList[index],
                                          fit: BoxFit.fill,
                                          height: KSize.geHeight(context, 131),
                                          width: double.infinity),
                                      Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: KSize.getWidth(context, 0),
                                              top: KSize.geHeight(context, 0),
                                              bottom:
                                                  KSize.geHeight(context, 15)),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/watch.png',
                                                height: KSize.geHeight(
                                                    context, 10.88),
                                                width: KSize.getWidth(
                                                    context, 10.88),
                                              ),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 6.06)),
                                              Text('9:00 am',
                                                  style: KTextStyle.button
                                                      .copyWith(
                                                          fontSize: 13,
                                                          fontWeight: FontWeight
                                                              .normal))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 42,
                                          left: 20,
                                          child: Text('25%',
                                              style: KTextStyle.subTitle1
                                                  .copyWith(
                                                      fontSize: 28,
                                                      color: KColor.yellow))),
                                      Positioned(
                                        top: 75,
                                        left: 20,
                                        child: Text('Discount',
                                            style: KTextStyle.button.copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                height: 2)),
                                      ),
                                    ],
                                  ),

                                  /// White Part Of List
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              KSize.getWidth(context, 20),
                                          vertical:
                                              KSize.geHeight(context, 20)),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(restaurantNameList[index],
                                                  style: KTextStyle.subTitle1
                                                      .copyWith(
                                                          fontSize: 15,
                                                          color:
                                                              KColor.secondary,
                                                          height: 1.0)),
                                              Text('29 recipes',
                                                  style: KTextStyle.bodyText2
                                                      .copyWith(
                                                          color: KColor.glide,
                                                          height: 1.5))
                                            ],
                                          ),
                                          Spacer(),
                                          Icon(Icons.star,
                                              color: KColor.yellow, size: 15),
                                          Icon(Icons.star,
                                              color: KColor.yellow, size: 15),
                                          Icon(Icons.star,
                                              color: KColor.yellow, size: 15),
                                          Icon(Icons.star,
                                              color: KColor.yellow, size: 15),
                                          Icon(Icons.star,
                                              color: KColor.greyLight,
                                              size: 15),
                                          SizedBox(
                                              width: KSize.getWidth(
                                                  context, 4.84)),
                                          Text('8',
                                              style: KTextStyle.bodyText2
                                                  .copyWith(
                                                      color: KColor.greyDark,
                                                      fontSize: 13))
                                        ],
                                      ))
                                ],
                              )));
                    }),
              ),
              SizedBox(height: KSize.geHeight(context, 30)),
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
