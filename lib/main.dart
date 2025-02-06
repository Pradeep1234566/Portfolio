import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneHomeScreen(),
    );
  }
}

class PhoneHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Status Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            alignment: Alignment.centerRight,
            child: Text(
              "12:30 PM",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          // Home Screen with App Icons
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(20),
              children: [
                _buildAppIcon(Icons.article, "Resume", 'https://drive.google.com/file/d/1BO0JIw7JQNliLNma5WmgMrDh-iU5tbBy/view?usp=sharing'),
                _buildAppIcon(Icons.work, "Projects", 'https://github.com/Pradeep1234566'),
                _buildAppIcon(Icons.code, "Tech Stack", ''),
                _buildAppIcon(Icons.star, "Achievements", ''),
                _buildAppIcon(Icons.school, "Education", ''),
                _buildAppIcon(Icons.contact_mail, "Contact", ''),
              ],
            ),
          ),
          // Dock Bar
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, color: Colors.white, size: 30),
                Icon(Icons.search, color: Colors.white, size: 30),
                Icon(Icons.settings, color: Colors.white, size: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppIcon(IconData icon, String label, String url) {
    return GestureDetector(
      onTap: () {
        if (url.isNotEmpty) {
          launchUrl(Uri.parse(url));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.white),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
