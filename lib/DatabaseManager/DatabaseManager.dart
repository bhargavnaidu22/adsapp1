import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Coupons.dart';
import '../models/Store.dart';

class DatabaseManager {
// final CollectionReference categories = FirebaseFirestore.instance.collection('Coupons');
// Future<List> getCategories() async{
//   List a =[];
//   try{
//       DocumentSnapshot snapshot = await categories.doc('data').get();
//         var data  = snapshot.data() as Map;
//         var categoriesData = data['categories'];
//         categoriesData.forEach((element) {
//           a.add(element.data);
//         });
//         return a;
//     }
//     catch(e){  print("object");
//       print(e.toString());
//     }
//     return a;
// }
  FirebaseFirestore? _instance;
  List<Store> _list = [];
  List<Store> getCategories(){
    getCategoriesFromFirestore();
    return _list;
  }
  Future<void> getCategoriesFromFirestore() async{
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance!.collection("Coupons");
    DocumentSnapshot snapshot = await categories.doc('data').get();
    var data  = snapshot.data() as Map;
    var categoriesData = data['categories'] as List<dynamic>;
    categoriesData.forEach((element) {
      _list.add(Store.fromJson(element));
    });

  }
}
