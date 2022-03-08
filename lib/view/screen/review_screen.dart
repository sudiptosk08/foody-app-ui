
import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bottom_navigation_screen.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController userNameController = TextEditingController();
  bool isVisibility = false;
  final bool isUserNameField = false;
  final List<String> reviewImageList = [
    'assets/images/review1.png',
    'assets/images/review2.png',
    'assets/images/review3.png',
  ];
  final List<String> reviewerNameList = [
    'Nathasa Malkuba',
    'Furinai Millabi',
    'Sami Rafi'
  ];
  final List<String> reviewerDateList = [
    '28/02/2021',
    '01/03/2021',
    '01/03/2021'
  ];
  final List<String> reviewList = [
    'Loved the class! Such beautiful land and collective impact infrastructure social entrepreneurship mass incarceration',
    'Never run so well and It\'s all thanks to Jordan. Silo framework overcome justice ideate,citizen-centered effective',
    'Big up my running crew,they better not say running crew who! Commitment equal opportunity empower'
  ];

  void showToast() {
    setState(() {
      isVisibility = !isVisibility;
    });
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
                // leading: IconButton(
                //   onPressed:() {
                   
                //   },
                //   icon: Icon(Icons.arrow_back_ios_new_outlined,color: KColor.black,)),
                centerTitle: true,
                title: Padding(
                    padding: EdgeInsets.only(
                      left: KSize.getWidth(context, 18),
                      right: KSize.getWidth(context, 18),
                    
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Transform.translate(
                            offset: Offset(-15, 0),
                            child: Text('Review', style: KTextStyle.headline8)),
                        Spacer()
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

                        /// Review List
                        SizedBox(
                          height: KSize.geHeight(context, 495),
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: reviewImageList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: KSize.geHeight(context, 30)),
                                    child: Container(
                                        height: KSize.geHeight(context, 145),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                    reviewImageList[index],
                                                    fit: BoxFit.fill,
                                                    height: KSize.geHeight(
                                                        context, 48),
                                                    width: KSize.getWidth(
                                                        context, 53.36)),
                                                SizedBox(
                                                    width: KSize.getWidth(
                                                        context, 9.44)),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        reviewerNameList[index],
                                                        style: KTextStyle
                                                            .headline6
                                                            .copyWith(
                                                                fontSize: 15)),
                                                    SizedBox(
                                                        height: KSize.geHeight(
                                                            context, 5)),
                                                    Text(
                                                        reviewerDateList[index],
                                                        style: KTextStyle
                                                            .caption
                                                            .copyWith(
                                                                fontSize: 13,
                                                                color: KColor
                                                                    .glide))
                                                  ],
                                                ),
                                                Spacer(),
                                                Image.asset(
                                                    'assets/images/menu2.png',
                                                    fit: BoxFit.fill,
                                                    height: KSize.geHeight(
                                                        context, 12),
                                                    width: KSize.getWidth(
                                                        context, 4))
                                              ],
                                            ),
                                            SizedBox(
                                                height: KSize.geHeight(
                                                    context, 16)),
                                            if (index == 0)
                                              Flexible(
                                                  child: Image.asset(
                                                      'assets/images/longText.png',
                                                      height: KSize.geHeight(
                                                          context, 78))),
                                            if (index != 0)
                                              Flexible(
                                                  child: Text(reviewList[index],
                                                      style: KTextStyle
                                                          .subTitle1
                                                          .copyWith(
                                                              fontSize: 15,
                                                              color: KColor
                                                                  .blueMagenta,
                                                             )))
                                          ],
                                        )));
                              }),
                        ),

                        /// Spacing
                        SizedBox(height: KSize.geHeight(context, 35)),

                        Container(
                            alignment: Alignment.center,
                            height: KSize.geHeight(context, 51),
                            decoration: BoxDecoration(
                                color: KColor.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  print('pinki');
                                });
                              },
                              controller: userNameController,
                              keyboardType: TextInputType.text,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: KSize.getWidth(context, 13),
                                          top: KSize.geHeight(context, 10),
                                          bottom: KSize.geHeight(context, 11),
                                          right: KSize.getWidth(context, 15)),
                                      child: Image.asset(
                                          'assets/images/eclipse.png')),
                                  suffixIcon: userNameController.text.isEmpty
                                      ? null
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              left: KSize.getWidth(context, 13),
                                              top: KSize.geHeight(context, 10),
                                              bottom:
                                                  KSize.geHeight(context, 11),
                                              right:
                                                  KSize.getWidth(context, 15)),
                                          child: Icon(Icons.send)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: KColor.lightShade
                                              .withOpacity(0.5))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: KColor.lightShade
                                              .withOpacity(0.5))),
                                  contentPadding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
                                  hintText: 'Write your review',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                  )),
                            ))),

                        /// Spacing
                        SizedBox(
                            height: kBottomNavigationBarHeight +
                                KSize.geHeight(context, 116)),
                      ],
                    )))));
  }
 // ignore: missing_return
 Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }

}
