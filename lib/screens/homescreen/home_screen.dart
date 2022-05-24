import 'package:adsapp/components/NotificationBadge.dart';
import 'package:adsapp/components/StoreWidget.dart';
import 'package:adsapp/components/bottom_navigation.dart';
import 'package:adsapp/components/drawer.dart';
import 'package:adsapp/models/Store.dart';
import 'package:adsapp/screens/categories_screen.dart';
import 'package:adsapp/screens/profile_screen.dart';
import 'package:adsapp/screens/stores_screen.dart';
import 'package:adsapp/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';
import 'components/HomeCateegoryWidget.dart';
import 'components/HomeStoreWidget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _index = 0;
  List<Widget> _widgetOptions = [
    HomeScreen(),
    CatrgoryScreen(),
    StoreScreen(),
    ProfileScreen()
  ];

  void onTapped(int value) {
    setState(() {
      _index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(index: _index, onTapped: onTapped),
        body: _widgetOptions.elementAt(_index));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<String> _banners = [
    "assets/images/b0.jpg",
    "assets/images/b1.jpg",
    "assets/images/b2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => _drawerKey.currentState?.openDrawer(),
          icon: Icon(Icons.sort),
        ),
        title: Text("Letz Add"),
        actions: [
          NotificationBadge(),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            height: 60,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: ListTile(
              dense: true,
              minLeadingWidth: 0,
              tileColor: Colors.grey.withOpacity(0.2),
              leading: Icon(Icons.location_on),
              title: Text("Visakhapatnam", style: TextStyle(fontSize: 14)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
      body: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(12),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: 150,
              child: CarouselSlider.builder(
                unlimitedMode: true,
                slideBuilder: (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        _banners[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                slideIndicator: CircularSlideIndicator(
                  alignment: Alignment.bottomCenter,
                  itemSpacing: 10,
                  indicatorRadius: 3,
                  padding: EdgeInsets.all(16),
                  currentIndicatorColor: mYellowButton,
                  indicatorBackgroundColor: Colors.white,
                ),
                itemCount: _banners.length,
                initialPage: 0,
                enableAutoSlider: true,
                autoSliderTransitionTime: Duration(seconds: 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Categories",
                style: mTitleStyle,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    HomeCategoryWidget(
                      title: "Fashion",
                      subtitle: "Clothing, Footware, Watches",
                      icon: "assets/icons/fashion.svg",
                    ),
                    SizedBox(width: 8),
                    HomeCategoryWidget(
                      title: "Recharge",
                      subtitle: "Mobile, Electricity, DTH Recharge",
                      icon: "assets/icons/bill.svg",
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    HomeCategoryWidget(
                      title: "Travel",
                      subtitle: "Flight, Bus, Hotel",
                      icon: "assets/icons/travel.svg",
                    ),
                    SizedBox(width: 8),
                    HomeCategoryWidget(
                      title: "More",
                      subtitle: "See all categories",
                      icon: "assets/icons/more.svg",
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stores",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: mTitleColor,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/storeScreen"),
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: mSubtitleColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StoreWidget(
                store: Store("Amazon", "Shopping", "assets/images/amazon.png"))
          ],
        ),
      ),
    );
  }
}
