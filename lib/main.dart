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
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Section
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pradeep L Pawar",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Flutter Developer | Embedded Systems Engineer",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // About Me Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Me",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "I am an aspiring software and embedded systems engineer with expertise in Flutter, Python, C++, and real-time operating systems. Passionate about innovation and problem-solving.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              // Projects Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Projects",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _buildProjectCard(
                        title: 'EEG Signal Classification',
                        description: 'Developed a robust ML model to classify EEG signals and detect human emotions.',
                        url: 'https://github.com/Pradeep1234566'),
                    _buildProjectCard(
                        title: 'Attention-Based Saliency Detection',
                        description: 'Engineered an algorithm to analyze 3D point clouds and identify salient regions.',
                        url: 'https://github.com/Pradeep1234566'),
                    _buildProjectCard(
                        title: 'AI-Powered Tweet Generation',
                        description: 'Fine-tuned GPT-2 for generating domain-specific tweets with high relevance.',
                        url: 'https://github.com/Pradeep1234566'),
                  ],
                ),
              ),
              // Contact Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Me",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.email, color: Colors.blue),
                          onPressed: () => launchUrl(Uri.parse('mailto:pradeeplaxmanraopawar@gmail.com')),
                        ),
                        IconButton(
                          icon: Icon(Icons.link, color: Colors.blue),
                          onPressed: () => launchUrl(Uri.parse('https://linkedin.com/in/pradeep-pawar-64345126a')),
                        ),
                        IconButton(
                          icon: Icon(Icons.code, color: Colors.blue),
                          onPressed: () => launchUrl(Uri.parse('https://github.com/Pradeep1234566')),
                        ),
                      ],
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

  Widget _buildProjectCard({required String title, required String description, required String url}) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Icon(Icons.link, color: Colors.blueAccent),
        onTap: () => launchUrl(Uri.parse(url)),
      ),
    );
  }
}
