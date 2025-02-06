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
                            _buildAppIcon(Icons.contact_mail, "Contact", '',
                                isContact: true, context: context),
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

  Widget _buildAppIcon(IconData icon, String label, String url,
      {bool isContact = false, BuildContext? context}) {
    return GestureDetector(
      onTap: () {
        if (isContact && context != null) {
          _showContactDialog(context);
        } else if (url.isNotEmpty) {
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

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Contact Me"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.email, color: Colors.blue),
                title: Text("pradeeplaxmanraopawar@gmail.com"),
                onTap: () => launchUrl(
                    Uri.parse("mailto:pradeeplaxmanraopawar@gmail.com")),
              ),
              ListTile(
                leading: Icon(Icons.link, color: Colors.blue),
                title: Text("LinkedIn"),
                onTap: () => launchUrl(Uri.parse(
                    "https://linkedin.com/in/pradeep-pawar-64345126a")),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.blue),
                title: Text("+91 701 9572 787"),
                onTap: () => launchUrl(Uri.parse("tel:+917019572787")),
              ),
              ListTile(
                leading: Icon(Icons.share, color: Colors.blue),
                title: Text("Twitter"),
                onTap: () =>
                    launchUrl(Uri.parse("https://x.com/PradeepPawar007")),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
