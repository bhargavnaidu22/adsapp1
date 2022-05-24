import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdvertiseScreen extends StatefulWidget {
  const AdvertiseScreen({Key? key}) : super(key: key);
  @override
  _AdvertiseScreenState createState() => _AdvertiseScreenState();
}

class _AdvertiseScreenState extends State<AdvertiseScreen> {
  CollectionReference _ref = FirebaseFirestore.instance.collection("ads");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32344D),
      appBar: AppBar(
        title: Text("Advertise"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _ref
            .where("category", isEqualTo: "Category 1")
            .where("status", isEqualTo: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.length == 0) {
            return Center(
              child: Text(
                "No data available",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            );
          }
          int _total = snapshot.data!.docs.length;
          List<QueryDocumentSnapshot> _data = snapshot.data!.docs;
          return PageView.builder(
            itemCount: _total,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  InteractiveViewer(
                    child: Center(
                        child: Image.network(
                      _data[index]["image"],
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              _data[index]["title"],
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          Text(
                            "${index + 1}/$_total",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
