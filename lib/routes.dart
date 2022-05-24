import 'package:adsapp/screens/adds_screen.dart';
import 'package:adsapp/screens/advertise_screen.dart';
import 'package:adsapp/screens/categories_screen.dart';
import 'package:adsapp/screens/homescreen/home_screen.dart';
import 'package:adsapp/screens/login_screen.dart';
import 'package:adsapp/screens/profile_screen.dart';
import 'package:adsapp/screens/splash_screen.dart';
import 'package:adsapp/screens/stores_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  "/splashScreen" : (context) => SplashScreen(),
  "/loginScreen" : (context) => LoginScreen(),
  "/dashboardScreen": (context) => DashboardScreen(),
  "/homeScreen" : (context) => HomeScreen(),
  "/categoryScreen" : (context) => CatrgoryScreen(),
  "/storeScreen" : (context) => StoreScreen(),
  "/profileScreen" : (context) => ProfileScreen(),
  "/addsScreen" : (context) => AddsScreen(),
  "/advertiseScreen" : (context) => AdvertiseScreen(),
};
