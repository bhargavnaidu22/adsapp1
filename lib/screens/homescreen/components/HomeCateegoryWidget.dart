import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

class HomeCategoryWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  const HomeCategoryWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/categoryScreen");
        },
        child: Container(
          padding: EdgeInsets.only(left: 16),
          height: 64,
          decoration: BoxDecoration(
            color: mFillColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0,1),
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 32,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: mCategoryTitleStyle),
                      Text(subtitle, style: mCategorySubtitleStyle)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}