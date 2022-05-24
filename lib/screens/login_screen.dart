import 'package:adsapp/constants.dart';
import 'package:adsapp/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _flag = false;
  bool _resend = false;
  bool _loading = false;
  String _phone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBlueBackground,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(gradient: mBlueLinearBackground),
          height: SizeConfig.screenHeight,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                right: -80,
                child: Container(
                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    Image.asset(
                      "assets/images/tv.png",
                      height: SizeConfig.screenHeight * 0.15,
                    ),
                    Text(
                      "LETZ ADD",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _flag
                          ? Text("Verify Phone Number",
                              style: mBigTitleStyle, textAlign: TextAlign.start)
                          : Text("Phone Verification",
                              style: mBigTitleStyle,
                              textAlign: TextAlign.start),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _flag
                          ? Text(
                              "Enter the OTP sent to +91 $_phone",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.start,
                            )
                          : Text(
                              "We will send you an OTP on this phone number.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.start,
                            ),
                    ),
                    SizedBox(height: 50),
                    _flag
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _singleOtpNode(true, false),
                              _singleOtpNode(false, false),
                              _singleOtpNode(false, false),
                              _singleOtpNode(false, true),
                            ],
                          )
                        : _phoneWidget(),
                    SizedBox(height: 20),
                    _flag
                        ? SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "/dashboardScreen",
                                  (route) => false,
                                );
                              },
                             child: Text(
                                "Verify & Proceed",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: mYellowButton,
                                padding: EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // if (_phone.length == 10)
                                  setState(() {
                                    _flag = true;
                                  });
                              },
                              child: Text(
                                "Send OTP",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: mYellowButton,
                                padding: EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                    SizedBox(height: 15),
                    _flag
                        ? InkWell(
                            onTap: _resend ? () {} : null,
                            child: Text(
                              "Don't received the OTP? Resend OTP",
                              style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                            ),
                          )
                        : Text(
                            "By providing my phone number, I hereby agree theTerm of ServicesandPrivacy Policy.",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _singleOtpNode(bool first, bool last) {
    return Container(
      width: 50,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        autofocus: true,
        showCursor: true,
        cursorColor: mYellowButton,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.3), 
          hintStyle: TextStyle(color: Colors.white54),
          hintText: "-",
          counterText: "",
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  TextFormField _phoneWidget() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          _phone = value;
        });
      },
      maxLength: 10,
      keyboardType: TextInputType.number,
      style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        contentPadding: EdgeInsets.all(14),
        border: OutlineInputBorder(borderSide: BorderSide.none),
        counterText: "",
        hintStyle: TextStyle(color: Colors.white54),
        hintText: "Enter phone number",
        prefixIcon: Icon(Icons.phone, color: Colors.white),
      ),
    );
  }
}
