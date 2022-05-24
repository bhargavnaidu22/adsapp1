import 'package:adsapp/components/NotificationBadge.dart';
import 'package:adsapp/components/bottom_navigation.dart';
import 'package:adsapp/components/drawer.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CatrgoryScreen extends StatefulWidget {
  const CatrgoryScreen({Key? key}) : super(key: key);

  @override
  _CatrgoryScreenState createState() => _CatrgoryScreenState();
}

class _CatrgoryScreenState extends State<CatrgoryScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  List<Color> _bgColors = [bgColor1, bgColor2, bgColor3, bgColor4];
  List<Color> _fgColors = [fgColor1, fgColor2, fgColor3, fgColor4];
  Categoryy category1 = Categoryy(
    Icons.shopping_bag_outlined,
    "Fashion",
    "Clothing, Footware, Watches",
  );
  Categoryy category2 = Categoryy(
    Icons.sticky_note_2_outlined,
    "Recharge",
    "Mobile, DTH Recharge",
  );
  Categoryy category3 = Categoryy(
    Icons.travel_explore_outlined,
    "Travel",
    "Flight, Bus, Hotel, Cab",
  );
  Categoryy category4 = Categoryy(
    Icons.food_bank_outlined,
    "Food",
    "Pizza, Groceries, Cakes",
  );
  Categoryy category5 = Categoryy(
    Icons.devices_rounded,
    "Electronic",
    "Mobile, Laptops, Accessories",
  );
  @override
  Widget build(BuildContext context) {
    List<Categoryy> _categories = [
      category1,
      category2,
      category3,
      category4,
      category5,
    ];
    return Scaffold(
      key: _drawerKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _drawerKey.currentState?.openDrawer(),
          icon: Icon(Icons.sort),
        ),
        title: Text("Explore by Category"),
        automaticallyImplyLeading: false,
        actions: [
          NotificationBadge(),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        padding: EdgeInsets.all(8),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: _categories.map((data) {
          int index = _categories.indexOf(data) % 4;
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/addsScreen");
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: mFillColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mBorderColor, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: _bgColors[index],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      data.icon,
                      color: _fgColors[index],
                    ),
                  ),
                  Text(
                    data.title,
                    style: mCategoryTitleStyle1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    data.subtitle,
                    style: mCategorySubtitleStyle1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Categoryy {
  IconData icon;
  String title;
  String subtitle;
  Categoryy(this.icon, this.title, this.subtitle);
}
