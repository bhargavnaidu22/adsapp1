import 'package:flutter/material.dart';

const mBackgroundColor = Color(0xffe5e8ff);
const mBlueColor = Color(0xFF006df0);
const mGreyColor = Color(0xFFB4B0B0);
const mTitleColor = Color(0xFF23374D);
const mSubtitleColor = Color(0xFF8E8E8E);
const mBorderColor = Color(0xFFE8E8F3);
const mFillColor = Color(0xFFFFFFFF);
const mCardTitleColor = Color(0xFF2E4ECF);
const mCardSubtitleColor = mTitleColor;

const mYellowButton = Color(0xFFffaf00);
const mBlueLinearBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xff0d3bd1),Color(0xff100DD1)],
);
const mBlackLinearBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Colors.black,Colors.transparent],
);
const mBlueBackground = Color(0xFF0d3bd1);

const bgColor1 = Color(0xFFf5e6fd);
const bgColor2 = Color(0xFFe3f8fb);
const bgColor3 = Color(0xFFfee5e1);
const bgColor4 = Color(0xFFe2e8ff);
const fgColor1 = Color(0xFFbd63fc);
const fgColor2 = Color(0xFF23c6d4);
const fgColor3 = Color(0xFFfe573c);
const fgColor4 = Color(0xFF6c76c4);

final RegExp emailValidatorRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your Email";
const String kEmailInavalidError = "Please enter valid Email";
const String kPassNullError = "Please enter your Password";
const String kPassShortError = "Password is too short, must be 6 characters";
const String kMatchPassError = "Password don't match";
const String kNamelNullError = "Please enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";

TextStyle mBigTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 20,
);
TextStyle mTitleStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: mTitleColor,
  fontSize: 16,
);
TextStyle mSubtitleStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.white,
  fontSize: 16,
);
TextStyle mCategoryTitleStyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: mTitleColor,
  fontSize: 12,
);
TextStyle mCategorySubtitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: mSubtitleColor,
  fontSize: 10,
);
TextStyle mCategoryTitleStyle1 = TextStyle(
  fontWeight: FontWeight.w600,
  color: mTitleColor,
  fontSize: 16,
);
TextStyle mCategorySubtitleStyle1 = TextStyle(
  fontWeight: FontWeight.w600,
  color: mSubtitleColor,
  fontSize: 14,
);

TextStyle mStoreStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: mTitleColor,
  fontSize: 14,
);
