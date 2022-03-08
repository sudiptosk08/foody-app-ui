import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/route/route_class_builder.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _drawerController = KFDrawerController(
          initialPage: RouteClassBuilder.fromString('HomeScreen'),
          items: [
            KFDrawerItem.initWithPage(
                text: Text('My Profile',
                    style: KTextStyle.subTitle1.copyWith(
                      color: KColor.secondary,
                    )),
                icon: Container(
                  height: KSize.geHeight(context, 20.84),
                  width: KSize.getWidth(context, 20.84),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/profileLogo.png'))),
                )),
            KFDrawerItem.initWithPage(
              text: Text('My Address ',
                  style: KTextStyle.subTitle1.copyWith(
                    color: KColor.secondary,
                  )),
              icon: Container(
                  height: KSize.geHeight(context, 20.84),
                  width: KSize.getWidth(context, 20.84),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/locationLogo.png')))),
            ),
            KFDrawerItem.initWithPage(
                text: Text('Payment Method',
                    style: KTextStyle.subTitle1.copyWith(
                      color: KColor.secondary,
                    )),
                icon: Container(
                  height: KSize.geHeight(context, 20.84),
                  width: KSize.getWidth(context, 20.84),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/card.png'))),
                ),
              ),
            KFDrawerItem.initWithPage(
              text: Text('Settings',
                  style: KTextStyle.subTitle1.copyWith(
                    color: KColor.secondary,
                  )),
              icon: Container(
                  height: KSize.geHeight(context, 20.84),
                  width: KSize.getWidth(context, 20.84),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/settings.png')))),
            ),
            KFDrawerItem.initWithPage(
                text: Text('Help & FAQ',
                    style: KTextStyle.subTitle1.copyWith(
                      color: KColor.secondary,
                    )),
                icon: Container(
                    height: KSize.geHeight(context, 20.84),
                    width: KSize.getWidth(context, 20.84),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/help.png')))))
          ],
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.yellow,
      body: KFDrawer(
          // menuPadding: EdgeInsets.zero,
          controller: _drawerController,
          header: KFDrawerItem(
            text: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Image.asset('assets/images/profile.png',
                      alignment: Alignment.centerLeft,
                      height: KSize.geHeight(context, 80),
                      width: KSize.getWidth(context, 90),
                      fit: BoxFit.contain),
              SizedBox(height: KSize.geHeight(context, 15)),
              Container(
                  //width: MediaQuery.of(context).size.width * 0.6,
                  child: Text('Adom Shafi', style: KTextStyle.headline4)),
              SizedBox(height: KSize.geHeight(context, 5)),
              Container(
                  //width: MediaQuery.of(context).size.width * 0.6,
                  child: Text('hellobesnik@gmail.com',
                      style: KTextStyle.bodyText2)),
            ],
          )),
          footer: KFDrawerItem(
            text: Container(
              height: KSize.geHeight(context, 40),
              width: KSize.getWidth(context, 117),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: KColor.primary),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 9)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/logout.png',
                        fit: BoxFit.fill,
                        height: KSize.geHeight(context, 26),
                        width: KSize.getWidth(context, 23)),
                    Text('Log Out',
                        style:
                            KTextStyle.subTitle1.copyWith(color: KColor.white)),
                  ],
                ),
              ),
            ),
            onPressed: () {
              appValueNotifier.hideBottomNavBar();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/onBoardScreen', (Route<dynamic> route) => false);
            },
          ),
          decoration: BoxDecoration(color: KColor.white)),
    );
  }
}
