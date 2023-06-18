//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:sh_new_project/selfdefense.dart';
import 'package:sh_new_project/safetytips.dart';

class SafetyPage extends StatelessWidget {
  void handleSafetyTipsPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SafetyTipsPage()),
    );
  }

  void handleSelfDefensePressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelfDefensePage()),
    );
  }

  void handleBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 229, 234),
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.14,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 239, 221, 233),
                  radius: 55,
                  backgroundImage: AssetImage("assets/images/logo.jpeg"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 10, right: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_right,
                        size: 30, color: Color.fromARGB(255, 139, 18, 148)),
                    GestureDetector(
                      onTap: () => handleSafetyTipsPressed(context),
                      child: Text(
                        "Safety tips",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 139, 18, 148),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.arrow_right,
                        size: 30, color: Color.fromARGB(255, 139, 18, 148)),
                    GestureDetector(
                      onTap: () => handleSelfDefensePressed(context),
                      child: Text(
                        "Self defense",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 139, 18, 148),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 300),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_right, size: 20),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: RichText(
                    text: TextSpan(
                      text: " Back",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 62, 62, 62),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
