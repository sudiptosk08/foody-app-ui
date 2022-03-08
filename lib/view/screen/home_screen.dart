import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/view/screen/food_list_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class HomeScreen extends KFDrawerContent {
  HomeScreen({Key key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _chosenValue2 = 'Deliver To';
  final List<String> placeImageList = [
    'assets/images/placeImg1.png',
    'assets/images/placeImg2.png',
    'assets/images/placeImg3.png',
  ];
  final List<String> logoImgList = [
    'assets/images/icon1.png',
    'assets/images/icon2.png',
    'assets/images/icon3.png',
  ];
  final List<String> popularImageList = [
    'assets/images/popularImg1.png',
    'assets/images/popularImg1.png',
    'assets/images/food1.jpeg',
    'assets/images/food2.jpg',
  ];
  final List<String> popularRestaurantName = [
    'Panshi In',
    'Food House',
    'Woondaal King',
    'Pizza Express',
  ];

  final List<String> restaurantName = [
    'Hungry Station',
    'Artisan Coffee Shop',
    'KFC',
  ];
  final List<String> recipeCount = [
    '30 recipes',
    '47 recipes',
    '50 recipes',
    '29 recipes',
  ];

  final List<String> placeName = [
    'Jail road. Zinda Bazar, Sylhet',
    'Mira bazar. Sylhet',
    'Zindabazar road,Sylhet',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            titleSpacing: 0.0,
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
                        onTap: widget.onMenuPressed,
                        child: Image.asset(
                          'assets/images/menu.png',
                          height: KSize.geHeight(context, 38),
                          width: KSize.getWidth(context, 38),
                          fit: BoxFit.fitHeight,
                        )),
                    Column(
                      children: [
                        DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                          focusColor: KColor.primary,
                          dropdownColor: KColor.white,
                          value: _chosenValue2,
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
                    GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Image.asset('assets/images/profileMenu.png',
                            fit: BoxFit.scaleDown,
                            height: KSize.geHeight(context, 38),
                            width: KSize.getWidth(context, 38))),
                  ],
                ))),
        backgroundColor: KColor.white,
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Spacing
                    SizedBox(height: KSize.geHeight(context, 30)),
                    Text('Welcome Foody!', style: KTextStyle.headline6),

                    /// Spacing
                    SizedBox(height: KSize.geHeight(context, 14)),
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
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: KSize.geHeight(context, 14),
                                      horizontal: KSize.getWidth(context, 14)),
                                  child: Image.asset('assets/images/shape.png',
                                      height: KSize.geHeight(context, 16),
                                      width: KSize.getWidth(context, 16),
                                      fit: BoxFit.fitHeight)),
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: KSize.geHeight(context, 13),
                                    horizontal: KSize.getWidth(context, 14)),
                                child: Image.asset(
                                    'assets/images/preferences.png',
                                    height: KSize.geHeight(context, 13.76),
                                    width: KSize.getWidth(context, 13.75),
                                    fit: BoxFit.contain),
                              ),
                              hintText: 'Find Your Food',
                              hintStyle: TextStyle(fontFamily: 'Poppins')),
                        ))),

                    /// Spacing
                    SizedBox(height: KSize.geHeight(context, 30)),

                    /// Nearby place Text
                    Row(
                      children: [
                        Text('Nearby Place',
                            style: KTextStyle.headline8.copyWith(fontSize: 18)),
                        Spacer(),
                        Text('See All',
                            style: KTextStyle.caption
                                .copyWith(color: KColor.primary)),
                        Text(' (12)',
                            style: KTextStyle.caption
                                .copyWith(color: KColor.primary))
                      ],
                    ),

                    SizedBox(height: KSize.geHeight(context, 15)),

                    /// Nearby Places ListView
                    SizedBox(
                      height: KSize.geHeight(context, 210),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: placeImageList.length,
                          itemBuilder: (context, index) {
                            return Card(
                                elevation: 0,
                                margin: EdgeInsets.only(bottom: 12),
                                child: Container(
                                    height: KSize.geHeight(context, 60),
                                    decoration: BoxDecoration(
                                        color: KColor.whiteSmoke,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                          left: KSize.getWidth(context, 5),
                                          right: KSize.getWidth(context, 20.75),
                                          top: KSize.geHeight(context, 5),
                                          bottom: KSize.geHeight(context, 5),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(placeImageList[index],
                                                height:
                                                    KSize.geHeight(context, 50),
                                                width:
                                                    KSize.getWidth(context, 50),
                                                fit: BoxFit.fill),
                                            SizedBox(
                                                width: KSize.getWidth(
                                                    context, 20)),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(restaurantName[index],
                                                    style: KTextStyle.bodyText
                                                        .copyWith(
                                                            color: KColor.black,
                                                            fontSize: 14)),
                                                // Spacer(),
                                                Text(placeName[index],
                                                    style: KTextStyle.bodyText2
                                                        .copyWith(
                                                            color: KColor.glide,
                                                            fontSize: 13,
                                                            height: 1)),
                                                SizedBox(
                                                    height: KSize.geHeight(
                                                        context, 5))
                                              ],
                                            ),
                                            Expanded(
                                                child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Image.asset(
                                                  logoImgList[index],
                                                  height: KSize.geHeight(
                                                      context, 18),
                                                  width: KSize.getWidth(
                                                      context, 22.88),
                                                  fit: BoxFit.fitWidth),
                                            ))
                                          ],
                                        ))));
                          }),
                    ),
                    SizedBox(height: KSize.geHeight(context, 30)),

                    ///Popular restaurants Text
                    Row(
                      children: [
                        Text('Popular Restaurants',
                            style: KTextStyle.headline8.copyWith(fontSize: 18)),
                        Spacer(),
                        Text('See All',
                            style: KTextStyle.caption
                                .copyWith(color: KColor.primary)),
                        Text(' (12)',
                            style: KTextStyle.caption
                                .copyWith(color: KColor.primary)),
                      ],
                    ),
                    SizedBox(height: KSize.geHeight(context, 15)),

                    /// Popular restaurants List
                    SizedBox(
                      height: KSize.geHeight(context, 200),
                      child: ListView.builder(
                          itemCount: popularImageList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  context.nextPage(FoodListScreen());
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        right: KSize.getWidth(context, 20)),
                                    child: Container(
                                        height: KSize.geHeight(context, 200),
                                        decoration: BoxDecoration(
                                          color: KColor.whiteSmoke,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(popularImageList[index],
                                                fit: BoxFit.fill,
                                                height: KSize.geHeight(
                                                    context, 140),
                                                width: KSize.getWidth(
                                                    context, 230)),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: KSize.geHeight(
                                                        context, 9),
                                                    left: KSize.getWidth(
                                                        context, 10),
                                                    right: KSize.getWidth(
                                                        context, 10)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: KSize.getWidth(
                                                            context, 135),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            /// Restaurant name
                                                            Text(
                                                                popularRestaurantName[
                                                                    index],
                                                                style: KTextStyle
                                                                    .bodyText
                                                                    .copyWith(
                                                                        color: KColor
                                                                            .black,
                                                                        height:
                                                                            1)),

                                                            Text(
                                                                recipeCount[
                                                                    index],
                                                                style: KTextStyle
                                                                    .caption
                                                                    .copyWith(
                                                                        color: KColor
                                                                            .glide))
                                                          ],
                                                        )),
                                                    Icon(Icons.star,
                                                        size: 15,
                                                        color: KColor.yellow),
                                                    Icon(Icons.star,
                                                        size: 15,
                                                        color: KColor.yellow),
                                                    Icon(Icons.star,
                                                        size: 15,
                                                        color: KColor.yellow),
                                                    Icon(Icons.star,
                                                        size: 15,
                                                        color:
                                                            KColor.greyLight),
                                                    SizedBox(
                                                        width: KSize.getWidth(
                                                            context, 3.6)),
                                                    Text('8',
                                                        style: KTextStyle
                                                            .overLine
                                                            .copyWith(
                                                                fontSize: 9)),
                                                  ],
                                                ))
                                          ],
                                        ))));
                          }),
                    ),

                    /// Spacing
                    SizedBox(
                        height: kBottomNavigationBarHeight +
                            KSize.geHeight(context, 15)),
                  ],
                ))));
  }
}
