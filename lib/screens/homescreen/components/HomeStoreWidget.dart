import 'package:flutter/material.dart';
import '../../../constants.dart';

class HomeStoreWidget extends StatelessWidget {
  final String image;
  final String text;
  const HomeStoreWidget({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/storeScreen");
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: mFillColor,
          border: Border.all(width: 1, color: mBorderColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            Text(
              text,
              style: mStoreStyle,
            ),
          ],
        ),
      ),
    );
  }
}