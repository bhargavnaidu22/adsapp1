import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              trailing: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundColor: mBackgroundColor,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ),
            Padding(
               padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Robert Ali",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "1234567890",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.person_outline_sharp),
              title: Text(
                "My Profile",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: (){},
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.notifications_outlined),
              title: Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.settings_outlined),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: Icon(Icons.logout_rounded),
              title: Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
