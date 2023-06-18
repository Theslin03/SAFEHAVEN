//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SafetyTipsPage extends StatefulWidget {
  @override
  _SafetyTipsPageState createState() => _SafetyTipsPageState();
}

class _SafetyTipsPageState extends State<SafetyTipsPage> {
  Map<String, String>? selectedArticle;
  Map<String, String>? selectedLecture;

  List<Map<String, String>> popularArticles = [
    {
      'title': 'SAFETY TIPS FOR WOMEN',
      'url': 'https://paladinsecurity.com/safety-tips/for-women/',
    },
    {
      'title': 'Psychological safety',
      'url':
          'https://www.safetyandhealthmagazine.com/articles/21201-psychological-safety-hot-concept-workplace-safety',
    },
    {
      'title': 'TOP 10 SAFETY TIPS FOR WOMEN',
      'url': 'https://issuesiface.com/magazine/top-10-safety-tips-for-women',
    },
  ];

  List<Map<String, String>> videoLectures = [
    {
      'title': '''What Should A Woman Do 
    To Feel Safe?''',
      'url': 'https://www.youtube.com/watch?v=6eFeEHi9ODM',
    },
    {
      'title': '''The Concept Of 
    Feeling Safe Changed My Life''',
      'url': 'https://www.youtube.com/watch?v=xK7vwnC6EMM',
    },
    {
      'title': '''After watching this,
    your brain will not be the same''',
      'url': 'https://www.youtube.com/watch?v=LNHBMFCzznE',
    },
  ];

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
                    Text(
                      "Popular articles",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 139, 18, 148),
                      ),
                    ),
                    DropdownButton<Map<String, String>?>(
                      value: selectedArticle,
                      onChanged: (Map<String, String>? value) {
                        setState(() {
                          selectedArticle = value;
                        });

                        if (value != null) {
                          launchURL(value['url']!);
                        }
                      },
                      items: popularArticles.map((article) {
                        return DropdownMenuItem<Map<String, String>?>(
                          value: article,
                          child: TextButton(
                            onPressed: () => launchURL(article['url']!),
                            child: Text(article['title']!),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.arrow_right,
                        size: 30, color: Color.fromARGB(255, 139, 18, 148)),
                    Text(
                      "Video lectures",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 139, 18, 148),
                      ),
                    ),
                    DropdownButton<Map<String, String>>(
                      value: selectedLecture,
                      onChanged: (Map<String, String>? value) {
                        setState(() {
                          selectedLecture = value;
                        });

                        if (value != null) {
                          launchURL(value['url']!);
                        }
                      },
                      items: videoLectures.map((lecture) {
                        return DropdownMenuItem<Map<String, String>>(
                          value: lecture,
                          child: TextButton(
                            onPressed: () => launchURL(lecture['url']!),
                            child: Text(lecture['title']!),
                          ),
                        );
                      }).toList(),
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
