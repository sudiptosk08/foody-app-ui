import 'package:flutter/material.dart';
import 'package:flutter_app/view/screen/cart_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({Key key}) : super(key: key);

  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  int selectedIndex = 1;

  final List<String> categoryList = [
    'All',
    'Fast Food',
    'Heavy Food',
    'Platter',
    'Snacks',
  ];
  final List<String> foodItemNameList = [
    'Red n hot pizza',
    'Meat Pasta',
    'Brushetta',
    'Salad',
    'Snacks',
    'Red n hot pizza',
  ];
  final List<String> foodItemDetailsList = [
    'spicy chicken, beef',
    'meat & Basil',
    'topings & tomato',
    'Baked Salmon',
    'spicy chicken, beef',
    'meat & Basil',
  ];
  final List<String> foodImageList = [
    'assets/images/fastFood1.png',
    'assets/images/fastFood2.png',
    'assets/images/fastFood3.png',
    'assets/images/fastFood4.png',
    'assets/images/fastFood1.png',
    'assets/images/fastFood2.png',
  ];

  void changedIndex(int index) {
    selectedIndex = index;
  }

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
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/back.png',
                        height: KSize.geHeight(context, 18),
                        width: KSize.getWidth(context, 18),
                        fit: BoxFit.fitHeight,
                      )),
                  Text('Food Menu', style: KTextStyle.headline8),
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => context.nextPage(CartScreen(dataPass: true)),
                      child: Image.asset('assets/images/cart2.png',
                          fit: BoxFit.contain,
                          height: KSize.geHeight(context, 33),
                          width: KSize.getWidth(context, 33))),
                ],
              ))),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Spacing
            SizedBox(height: KSize.geHeight(context, 30)),

            ///Category List
            SizedBox(
              height: KSize.geHeight(context, 36),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                            height: KSize.geHeight(context, 36),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: KColor.greyLight1, width: 1))),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    right: KSize.getWidth(context, 16)),
                                child: Column(
                                  children: [
                                    Text(categoryList[index],
                                        style: KTextStyle.subTitle1.copyWith(
                                            height: 1.0,
                                            color: selectedIndex == index
                                                ? KColor.primary
                                                : KColor.glide)),
                                    Spacer(),
                                    
                                    Image.asset('assets/images/line2.png',
                                        height: KSize.geHeight(context, 2),
                                        width: selectedIndex == 0
                                            ? KSize.getWidth(context, 60)
                                            : KSize.getWidth(context, 60),
                                        fit: BoxFit.cover,
                                        color: selectedIndex == index
                                            ? KColor.primary
                                            : Colors.transparent),
                                            
                                  ],
                                ))));
                  }),
            ),

            /// Spacing
            SizedBox(height: KSize.geHeight(context, 40)),

            /// Food Item List
            Expanded(
              child: GridView.builder(
                  itemCount: foodItemNameList.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.60,
                      crossAxisSpacing: KSize.getWidth(context, 33),
                      mainAxisSpacing: KSize.geHeight(context, 30)),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0.5,
                      shadowColor: KColor.whiteSmoke,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Container(
                        height: KSize.geHeight(context, 255),
                        constraints: BoxConstraints.tightForFinite(height: 265),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Image.asset(
                                  foodImageList[index],
                                  height: KSize.geHeight(context, 150),
                                  width: KSize.getWidth(context, 160),
                                  fit: BoxFit.fill,
                                ),

                                /// Upper Container For Price
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    height: KSize.geHeight(context, 33),
                                    width: KSize.getWidth(context, 70),
                                    decoration: BoxDecoration(
                                        color: KColor.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: KSize.getWidth(context, 9),
                                          right: KSize.getWidth(context, 3),
                                          bottom: KSize.geHeight(context, 4.0)),
                                      child: Row(
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text('\$',
                                                  style: KTextStyle.overLine
                                                      .copyWith(
                                                          color: KColor.primary,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 9.8))),
                                          Flexible(
                                              child: Text('9.50',
                                                  style: KTextStyle.headline8
                                                      .copyWith(
                                                          fontSize: 20.25))),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                /// Love Image
                                Positioned(
                                    right: 10,
                                    top: 13,
                                    child: Container(
                                      width: 26,
                                      height: 27,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: KColor.grey200.withOpacity(0.5)
                                      ),
                                      
                                      child: Icon(Icons.favorite,color: KColor.red,size: 15,),
                                      )),

                                /// Bottom Container For Price
                                Positioned(
                                    bottom: -15,
                                    left: 10,
                                    child: Card(
                                        elevation: 0.5,
                                        shadowColor:
                                            KColor.primary.withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Container(
                                            height: KSize.geHeight(context, 33),
                                            width: KSize.getWidth(context, 70),
                                            decoration: BoxDecoration(
                                                color: KColor.white,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                            boxShadow:[  BoxShadow(
                                            color: KColor.grey.withOpacity(0.5),
                                            spreadRadius: 0.1,
                                            blurRadius: 5,
                                            offset: const Offset(
                                                0, 3),),
                                            ],
                                                    ),
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: KSize.getWidth(
                                                        context, 5)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('4.5',
                                                        style: KTextStyle
                                                            .overLine
                                                            .copyWith(
                                                                color: Colors
                                                                    .black)),
                                                    Icon(Icons.star,
                                                        size: 9,
                                                        color: KColor.yellow),
                                                    Text('(25+)',
                                                        style: KTextStyle
                                                            .overLine
                                                            .copyWith(
                                                                fontSize: 7,
                                                                color: KColor
                                                                    .grayish)),
                                                  ],
                                                )))))
                              ],
                            ),

                            ///Spacing
                            SizedBox(height: KSize.geHeight(context, 19)),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: KSize.getWidth(context, 10)),
                              child: Text(foodItemNameList[index],
                                  style: KTextStyle.bodyText.copyWith(
                                      color: KColor.secondary, height: 1)),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: KSize.getWidth(context, 10)),
                                child: Text(foodItemDetailsList[index],
                                    style: KTextStyle.caption.copyWith(
                                        color: KColor.glide, height: 1.5))),

                            ///Spacing
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: KSize.getWidth(context, 10)),
                              child: InkWell(
                                onTap: (){
                                   context.nextPage(CartScreen());
                                },
                                child: Container(
                                    height: KSize.geHeight(context, 25),
                                    width: KSize.getWidth(context, 65),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: KColor.primary,
                                      borderRadius: BorderRadius.circular(25)
                                    ),
                                        child: Text('Add',
                                            style: KTextStyle.caption1
                                                .copyWith(color: KColor.white))),
                              )),
                           
                            Spacer(),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
