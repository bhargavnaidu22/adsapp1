import 'package:adsapp/constants.dart';
import 'package:flutter/material.dart';

class AddsScreen extends StatefulWidget {
  const AddsScreen({Key? key}) : super(key: key);

  @override
  _AddsScreenState createState() => _AddsScreenState();
}

class _AddsScreenState extends State<AddsScreen> {
  String _appBarTitle = "Company Name";
  @override
  void initState() {
    super.initState();
    // final args = ModalRoute.of(context)!.settings.arguments as Map;
    // args
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
          bottom: TabBar(
            indicatorColor: Colors.grey,
            tabs: [
              Tab(child: Text("Coupons", style: mTitleStyle)),
              Tab(child: Text("Deals", style: mTitleStyle)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Coupons")),
            Center(child: Text("Deals"))
          ],
        ),
      ),
    );
  }
}
