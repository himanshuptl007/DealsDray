import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();
  String responseMessage = '';

  Future registerUser() async {
    final String apiUrl =
        "http://devapiv2.dealsdray.com/api/v2/user/email/referral";
    final response = await http.post(Uri.parse(apiUrl), body: {
      "email": emailController.text,
      "password": passwordController.text,
      "referralCode": referralCodeController.text,
      "userId": "62a833766ec5dafd6780fc85",
    });

    if (response.statusCode == 200) {
      setState(() {
        responseMessage = "User registered successfully!";
      });
    } else {
      setState(() {
        responseMessage = "Failed to register user. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: referralCodeController,
              decoration: InputDecoration(hintText: "Referral Code"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                registerUser();
              },
              child: Text("Register"),
            ),
            SizedBox(height: 10),
            Text(
              responseMessage,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
