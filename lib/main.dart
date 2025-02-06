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
      home: WebPortfolioScreen(),
    );
  }
}

class WebPortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pradeep's Portfolio",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              // Phone Mockup
              Container(
                width: 300,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text("12:30 PM",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          children: [
                            _buildAppIcon(Icons.article, "Resume",
                                'https://drive.google.com/file/d/1BO0JIw7JQNliLNma5WmgMrDh-iU5tbBy/view?usp=sharing'),
                            _buildAppIcon(Icons.work, "Projects",
                                'https://github.com/Pradeep1234566'),
                            _buildAppIcon(Icons.code, "Tech Stack", ''),
                            _buildAppIcon(Icons.star, "Achievements", ''),
                            _buildAppIcon(Icons.school, "Education", ''),
                            _buildAppIcon(Icons.contact_mail, "Contact", ''),
                          ],
                        ),
                      ),
                    ),
                    // Dock Bar
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
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
              ),
            ],
          ),
        ),
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
