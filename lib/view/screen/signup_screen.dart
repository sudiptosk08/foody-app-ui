import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widgets/k_button.dart';
import 'package:flutter_app/view/global_widgets/k_textfield.dart';
import 'package:flutter_app/view/screen/bottom_navigation_screen.dart';
import 'package:flutter_app/view/screen/signIn_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KColor.background,
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: KSize.geHeight(context, 80)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('SIGN UP',
                          style: KTextStyle.headline6.copyWith(height: 1)),
                    ),
                   
                     Padding(
                      padding: const EdgeInsets.only(left:10.0,top: 3),
                      child:Text('Complete this step for best adjustment',
                        style: KTextStyle.bodyText2),),
                    SizedBox(height: KSize.geHeight(context, 15)),
                    Container(
                        height: KSize.geHeight(context, 478),
                        decoration: BoxDecoration(
                            color: KColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: KSize.getWidth(context, 20),
                                vertical: KSize.geHeight(context, 40)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Your Email',
                                    style: KTextStyle.bodyText2
                                        .copyWith(color: KColor.cyan)),
                                SizedBox(height: KSize.geHeight(context, 5)),
                                KTextField(
                                    hintText: 'Enter Email',
                                    isPasswordField: false,
                                    type: TextInputType.emailAddress),
                                SizedBox(height: KSize.geHeight(context, 30)),
                                Text('Password',
                                    style: KTextStyle.bodyText2
                                        .copyWith(color: KColor.cyan)),
                                SizedBox(height: KSize.geHeight(context, 5)),
                                KTextField(
                                    hintText: 'Enter Password',
                                    isPasswordField: true,
                                    type: TextInputType.visiblePassword),
                                SizedBox(height: KSize.geHeight(context, 30)),
                                Text('Mobile',
                                    style: KTextStyle.bodyText2
                                        .copyWith(color: KColor.cyan)),
                                SizedBox(height: KSize.geHeight(context, 5)),
                                KTextField(
                                    hintText: 'Enter Number',
                                    isPasswordField: false,
                                    type: TextInputType.number),
                                Spacer(),
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSwitched = !isSwitched;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                            height: KSize.geHeight(context, 12),
                                            width: KSize.getWidth(context, 24),
                                            decoration: BoxDecoration(
                                                color: isSwitched == true
                                                    ? KColor.primary
                                                    : KColor.gray,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Align(
                                                alignment: isSwitched == true
                                                    ? Alignment.centerRight
                                                    : Alignment.centerLeft,
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                KSize.getWidth(
                                                                    context, 4),
                                                            vertical:
                                                                KSize.geHeight(
                                                                    context, 2)),
                                                    child: Image.asset(
                                                        'assets/images/toggle.png',
                                                        scale: 1.2))))),
                                    SizedBox(
                                        width: KSize.getWidth(context, 10)),
                                    Text('I accepted all terms & conditions',
                                        style: KTextStyle.bodyText2.copyWith(
                                            color: KColor.tertiary
                                                .withOpacity(0.5),
                                            height: 1))
                                  ],
                                ),
                                Spacer(),
                                KButton(
                                    buttonText: 'SIGN UP',
                                    onPressed: () {
                                      context.nextReplacementPage(
                                          BottomNavigationScreen());
                                    },
                                    color: KColor.primary)
                              ],
                            ))),
                    SizedBox(height: KSize.geHeight(context, 40)),
                    Center(
                        child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        context.nextReplacementPage(SignInScreen());
                      },
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'I already have an account?',
                            style: KTextStyle.bodyText2
                                .copyWith(color: KColor.cyanLight)),
                        TextSpan(text: ' Sign In', style: KTextStyle.subTitle1),
                      ])),
                    )),
                    SizedBox(height: KSize.geHeight(context, 83)),
                  ],
                ))));
  }
}
