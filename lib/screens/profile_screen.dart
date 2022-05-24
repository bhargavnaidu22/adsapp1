import 'package:adsapp/components/NotificationBadge.dart';
import 'package:adsapp/components/bottom_navigation.dart';
import 'package:adsapp/components/drawer.dart';
import 'package:adsapp/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _drawerKey.currentState?.openDrawer(),
          icon: Icon(Icons.sort),
        ),
        title: Text("Profile"),
        automaticallyImplyLeading: false,
        actions: [
          NotificationBadge(),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: mYellowButton,
                ),
                child: Row(
                  children: [
                    profilePic(),
                    SizedBox(width: 20),
                    Text(
                      "Robert",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              itemButton("Full Name", Icons.person_outline_outlined, "Robert"),
              itemButton("Phone Number", Icons.phone_outlined, "1234567890"),
              itemButton("Email", Icons.email_outlined, "inv@gmail.com"),
              Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit_outlined),
                    label: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: fgColor2,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemButton(String title, IconData icon, String data) {
    return ListTile(
      visualDensity: VisualDensity(vertical: -2),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 0,
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color(0xff00b894),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
      title: Text(title),
      trailing: Text(data),
    );
  }

   Widget profilePic() {
    return SizedBox(
      height: 80,
      width: 80,
      child: CircleAvatar(
        backgroundColor: mBackgroundColor,
        backgroundImage: AssetImage("assets/images/profile.png"),
      ),
    );
  }

  Widget profilePicwithEdit() {
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          Positioned(
            right: -5,
            bottom: 0,
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
