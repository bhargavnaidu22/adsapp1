import 'package:adsapp/DatabaseManager/DatabaseManager.dart';
import 'package:adsapp/components/StoreWidget.dart';
import 'package:adsapp/constants.dart';
import 'package:adsapp/models/Coupons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/Store.dart';

class AddsScreen extends StatefulWidget {
  const AddsScreen({Key? key}) : super(key: key);

  @override
  _AddsScreenState createState() => _AddsScreenState();
}

class _AddsScreenState extends State<AddsScreen> {
  String _appBarTitle = "Company Name";
  List a = [];
  @override
  void initState() {
    super.initState();
    // final args = ModalRoute.of(context)!.settings.arguments as Map;
    // args
    fetchCoupons();
  }

  fetchCoupons() async{
    dynamic result = await getCategories();
    if(result == null)
      {
        print("Null");
      }
    else{
      setState((){
        a = result;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
        ),
        body: Container(
          child:ListView.builder(
            itemCount: a.length,
            itemBuilder: (context,index){
              return StoreWidget(store: a[index]);
            },
          )
        )
      ),
    );
  }
  Future getCategories() async {
    var data = await FirebaseFirestore.instance.collection("Coupons").doc(
        "data").collection("categories").orderBy('title').get();
    setState((){
      a = List.from(data.docs.map((e) => Coupons.fromSnapshot(e)));
    });
    return a;
  }
}
