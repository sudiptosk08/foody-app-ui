import 'package:flutter/material.dart';

import 'package:flutter_app/view/global_widgets/k_button.dart';
import 'package:flutter_app/view/screen/bottom_navigation_screen.dart';
import 'package:flutter_app/view/screen/signIn_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _currentPage = 0;

  final List<Widget> list = [
    SliderScreen(
        title: 'GPS Tracking',
        subTitle:
            'Loved the class! Such beautiful land and collective impact infrastructure social entrepreneur.',
        index: 0,
        backgroundImage: 'assets/images/onBoardImg1.png'),
    SliderScreen(
        title: 'GPS Tracking',
        subTitle:
            'Loved the class! Such beautiful land and collective impact infrastructure social entrepreneur.',
        index: 1,
        backgroundImage: 'assets/images/onBoardImg2.png'),
    SliderScreen(
        title: 'Quick Food Delivery',
        subTitle:
            'Loved the class! Such beautiful land and collective impact infrastructure social entrepreneur.',
        index: 2,
        backgroundImage: 'assets/images/onBoardImg3.png')
  ];

  PageController _controller = PageController(initialPage: 0);

  onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KColor.white,
        //backgroundColor: KColor.background,
        body: SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: KSize.geHeight(context, 668),
                        child: PageView.builder(
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          physics: BouncingScrollPhysics(),
                          onPageChanged: onChanged,
                          itemBuilder: (context, int index) {
                            return list[index];
                          },
                        )),
                    Transform.translate(
                        offset:
                            _currentPage != 2 ? Offset(0, -20) : Offset(0, -35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(3, (int index) {
                            return AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: KSize.geHeight(context, 4),
                                width: (index == _currentPage)
                                    ? KSize.getWidth(context, 20)
                                    : KSize.getWidth(context, 7),
                                margin: EdgeInsets.symmetric(
                                    horizontal: KSize.getWidth(context, 3)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: (index == _currentPage)
                                        ? KColor.primary
                                        : KColor.grey.withOpacity(0.5)));
                          }),
                        )),

                    ///button
                    if (_currentPage != 2)
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: KSize.getWidth(context, 27)),
                          child: KButton(
                              color: KColor.primary,
                              onPressed: () {
                                print('test');
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOutQuint);
                              },
                              buttonText: 'CONTINUE')),

                    if (_currentPage == 2)
                      Transform.translate(
                          offset: _currentPage != 2
                              ? Offset(0, -20)
                              : Offset(0, -20),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: KSize.getWidth(context, 27)),
                            child: KButton(
                                color: KColor.blue,
                                buttonText: 'SIGN IN WITH FACEBOOK',
                                onPressed: () {
                                  context.nextPage(BottomNavigationScreen());
                                }),
                          )),
                    if (_currentPage == 2)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: KSize.getWidth(context, 27)),
                        child: KButton(
                            color: KColor.primary,
                            buttonText: 'SIGN IN',
                            onPressed: () {
                              context.nextPage(SignInScreen());
                            }),
                      ),
                    SizedBox(height: KSize.geHeight(context, 30)),
                    if (_currentPage == 2)
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Or Start to', style: KTextStyle.bodyText2),
                        TextSpan(
                            text: ' Search Now',
                            style: KTextStyle.bodyText2
                                .copyWith(color: KColor.primary)),
                      ])),
                    SizedBox(height: KSize.geHeight(context, 40))
                  ],
                )))));
  }
}

///Slider class
class SliderScreen extends StatelessWidget {
  final String title, subTitle, backgroundImage;
  final int index;

  const SliderScreen({
    Key key,
    this.title,
    this.subTitle,
    this.index,
    this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (index != 2)
          Container(
              margin: EdgeInsets.only(
                  right: KSize.getWidth(context, 30),
                  top: KSize.geHeight(context, 35)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List<Widget>.generate(1, (int index) {
                  return Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          onTap: () {
                            context.nextPage(SignInScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(),
                              Text('Skip',
                                  style: KTextStyle.bodyText2.copyWith(
                                      color: KColor.primary, height: 1)),
                              SizedBox(width: KSize.getWidth(context, 5.9)),
                              Icon(Icons.arrow_forward_ios,
                                  color: KColor.primary, size: 15)
                            ],
                          )));
                }),
              )),
        SizedBox(height: KSize.geHeight(context, 20)),
        Flexible(
            child: Transform.translate(
                offset: Offset(0, 20),
                child: Image.asset(backgroundImage,
                    height: KSize.geHeight(context, 480),
                    width: double.infinity))),
        Transform.translate(
            offset: index != 2 ? Offset(0, -50) : Offset(0, -40),
            child:
                Text(title, style: KTextStyle.headline8.copyWith(height: 1))),
        Transform.translate(
            offset: index != 2 ? Offset(2, -40) : Offset(2, -25),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(subTitle,
                    textAlign: TextAlign.center,
                    style: KTextStyle.bodyText2.copyWith(height: 1.5))))
      ],
    ));
  }
}
