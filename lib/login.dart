import 'package:flutter/material.dart';
import 'package:flutter_application/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  bool _showOtpWidget = false;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _otpController.dispose();
    super.dispose();
  }

   void _sendOtp() async{
    // TODO: Implement API call to send OTP to the user's phone number
    
    setState(() {
      _showOtpWidget = true;
    });
    
    // final response = await http.post(Uri.parse('http://devapiv2.dealsdray.com/api/v2/user/otp/'));
    
    // if (response.statusCode == 200) {
    //   final jsonData = jsonDecode(response.body);
    //   List<Product> products = [];

    //   for (var item in jsonData) {
    //     products.add(Product.fromJson(item));
    //   }

    //   return products;
    // } else {
    //   throw Exception('Failed to load products');
    // }
  }

  void _resendOtp() {
    // TODO: Implement API call to resend OTP to the user's phone number
  }

  void _verifyOtp() {
    String enteredOtp = _otpController.text;
    // TODO: Implement API call to verify the OTP entered by the user
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250.0,
              child: TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter phone number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            if (_showOtpWidget)
              SizedBox(
                width: 250.0,
                child: TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: _showOtpWidget ? _verifyOtp : _sendOtp,
              child: Text(_showOtpWidget ? 'Verify OTP' : 'Send OTP'),
            ),
            if (_showOtpWidget)
              TextButton(
                onPressed: _resendOtp,
                child: Text('Resend OTP'),
              ),
          ],
        ),
      ),
    );
  }
}
