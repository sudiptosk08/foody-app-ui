import 'package:flutter/material.dart';

import 'package:flutter_app/view/global_widgets/k_button.dart';
import 'package:flutter_app/view/screen/bottom_navigation_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KColor.background,
        body: SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: KSize.getWidth(context, 20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: KSize.geHeight(context, 66)),

                        /// Heading
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('FORGOT PASSWORD',
                              style: KTextStyle.headline6.copyWith(height: 1)),
                        ),
                        

                        /// SubTitle
                        Padding(padding: const EdgeInsets.all(10.0),
                        child:Text(
                            'Enter your email or phone to request a password reset',
                            style: KTextStyle.bodyText2),),
                        SizedBox(height: KSize.geHeight(context, 15)),

                        /// ALl TextField
                        Container(
                            height: KSize.geHeight(context, 206),
                            decoration: BoxDecoration(
                                color: KColor.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: KSize.getWidth(context, 20),
                                    vertical: KSize.geHeight(context, 40)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        height: KSize.geHeight(context, 46),
                                        decoration: BoxDecoration(
                                            color: KColor.whiteSmoke,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: TextField(
                                                textAlign: TextAlign.center,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide
                                                                .none),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    hintText: 'Enter Email',
                                                    hintStyle: TextStyle(
                                                        fontFamily: 'Poppins'))))),
                                    Spacer(),
                                    KButton(
                                        buttonText: 'SEND NOW',
                                        onPressed: () {
                                          context.nextPage(
                                              BottomNavigationScreen());
                                        },
                                        color: KColor.primary)
                                  ],
                                ))),
                        SizedBox(height: KSize.geHeight(context, 40)),

                        /// Rich Text Having Problem
                        Center(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Having Problem?',
                                style: KTextStyle.bodyText2
                                    .copyWith(color: KColor.cyanLight)),
                            TextSpan(
                                text: ' Need Help', style: KTextStyle.subTitle1)
                          ])),
                        ),
                        SizedBox(height: KSize.geHeight(context, 332)),
                      ],
                    )))));
  }
}
