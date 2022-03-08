import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/screen/cart_screen.dart';
import 'package:flutter_app/view/screen/drawer_screen.dart';
import 'package:flutter_app/view/screen/restaurant_list_screen.dart';
import 'package:flutter_app/view/screen/review_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'food_ordering_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  State createState() {
    return _State();
  }
}

class _State extends State<BottomNavigationScreen>
    with SingleTickerProviderStateMixin {
  int _selectedItemIndex = 0;
  int selectindex;

  int _currentIndex = 0;

  final List<Widget> _bottomNavPages = [
    // HomeScreen(),
    DrawerScreen(),
    RestaurantListScreen(),
    CartScreen(
      dataPass: false,
    ),
    FoodOrderingScreen(),
    ReviewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _bottomNavPages[_currentIndex],
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: appValueNotifier.navBarStateNotifier,
          builder: (BuildContext context, value, Widget child) {
            return StyleProvider(
                style: Style(),
                child: ConvexAppBar(
                    height: value ? 0 : 56,
                    curveSize: value ? 0 : KSize.geHeight(context, 100),
                    top: -30,
                    color: value ? KColor.white : KColor.tints,
                    activeColor: value ? KColor.primary : KColor.primary,
                    backgroundColor: KColor.white,
                    
                    items: [
                      TabItem(
                        icon: Padding(
                          padding: EdgeInsets.all(1),
                          child: Image.asset('assets/images/nav1.png',
                              fit: BoxFit.fitHeight,
                              color: _selectedItemIndex == 0
                                  ? KColor.primary
                                  : KColor.tints),
                        ),
                        title: 'Home',
                      ),
                      TabItem(
                       isIconBlend: true,
                          icon: Padding(
                            padding: EdgeInsets.all(1),
                            child: Image.asset('assets/images/nav2.png',
                                fit: BoxFit.fitHeight,
                                color: _selectedItemIndex == 1
                                    ? KColor.primary
                                    : KColor.tints),
                          ),
                          title: 'Search'),
                      TabItem(
                        icon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset(
                              
                              'assets/images/cart.png',
                              scale: 100,
                                fit: BoxFit.contain,
                                 
                            )),
                            
                      ),
                     
                      TabItem(
                          icon: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Image.asset('assets/images/nav3.png',
                                  color: _selectedItemIndex == 3
                                      ? KColor.primary
                                      : KColor.tints)),
                          title: 'Order'),
                      TabItem(
                        icon: Padding(
                          padding: EdgeInsets.all(1),
                          child: Image.asset('assets/images/nav4.png',
                              fit: BoxFit.contain,
                              color: _selectedItemIndex == 4
                                  ? KColor.primary
                                  : KColor.tints),
                        ),
                        title: 'Account',
                      )
                    ],
                    initialActiveIndex: 0,
                    onTap: (int index) => setState(() {
                          _selectedItemIndex = index;
                        
                          _currentIndex = index;
                        }),
                    style: TabStyle.fixedCircle));
          },
        ));
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 15;

  @override
  double get iconSize => 18;

  @override
  TextStyle textStyle(Color txtcolor) {
    return TextStyle(fontSize: 14, color: txtcolor);
  }
}
