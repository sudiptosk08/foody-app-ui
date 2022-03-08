import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widgets/cart_item.dart';
import 'package:flutter_app/view/global_widgets/k_button.dart';
import 'package:flutter_app/view/screen/checkout_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatefulWidget {
  final bool dataPass;

  const CartScreen({Key key, this.dataPass}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> selectedItemValue = [];

  // @override
  // void initState() {
  //   setState(() {
  //     appValueNotifier.hideBottomNavBar();
  //   });

  //   super.initState();
  // }

  final List<String> foodItemNameList = [
    'Red n hot Pizza',
    'Spicy Pizza',
    'Parata',
  ];
  final List<String> count = [
    '2',
    '3',
    '1',
  ];
  final List<String> price = [
    '120',
    '80',
    '150',
  ];

  final List<String> imageList = [
    'assets/images/cartFood1.png',
    'assets/images/cartFood1.png',
    'assets/images/cartFood1.png',
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: widget.dataPass
                      ? Image.asset('assets/images/back.png',
                          height: KSize.geHeight(context, 18),
                          width: KSize.getWidth(context, 18),
                          fit: BoxFit.fitHeight)
                      : Container()),
              Spacer(),
              Transform.translate(
                  offset: Offset(-15, 0),
                  child: Text('Cart', style: KTextStyle.headline8)),
              Spacer()
            ],
          ),
        ),
      ),
      backgroundColor: KColor.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Spacing
              SizedBox(height: KSize.geHeight(context, 20)),

              ...List.generate(
                  3,
                  (index) => CartItem(
                        imagePath: imageList[index],
                        titleText: foodItemNameList[index],
                        price: price[index],
                      )),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 25.00)),

              /// Delivery Fee
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery Fee',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.glide)),
                    Text('\$5.30',
                        style: KTextStyle.headline4.copyWith(fontSize: 15))
                  ],
                ),
              ),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 10)),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.glide)),
                    Text('\$311.05',
                        style: KTextStyle.headline4.copyWith(fontSize: 15))
                  ],
                ),
              ),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 20.5)),
              Divider(color: KColor.greyLight, height: 1),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 20.5)),

              /// Delivery Time Text
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Text('Delivery Time',
                    style: KTextStyle.bodyText2.copyWith(color: KColor.glide)),
              ),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 9.5)),

              /// Date Time  Edit Text
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('28 Feb 2021',
                        style: KTextStyle.subTitle1
                            .copyWith(color: KColor.secondary)),
                    SizedBox(width: KSize.getWidth(context, 100)),
                    Text('10:30 am',
                        style: KTextStyle.subTitle1
                            .copyWith(color: KColor.secondary)),
                    Spacer(),
                    Text('Edit', style: KTextStyle.subTitle1),
                  ],
                ),
              ),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 60)),

              /// Button
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: KSize.getWidth(context, 22)),
                  child: KButton(
                      buttonText: 'CHECKOUT',
                      onPressed: () {
                        context.nextPage(CheckoutScreen());
                      },
                      color: KColor.primary)),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 40)),
            ],
          ),
        ),
      ),
    );
  }
}
