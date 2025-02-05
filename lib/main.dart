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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pradeep Pawar',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Full-Stack & Embedded Systems Developer',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Passionate about crafting innovative solutions in software, web, and embedded technologies.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 30),
            _buildSectionTitle('Projects'),
            _buildProjectCard(
              title: 'Smart Traffic Management',
              description: 'Developed an intelligent system using sensors.',
              url: 'https://github.com/yourgithub',
            ),
            _buildProjectCard(
              title: 'EEG-based Attention Detection',
              description: 'Built a system to analyze EEG signals.',
              url: 'https://github.com/yourgithub',
            ),
            _buildProjectCard(
              title: 'Social Media Management',
              description: 'Created a social media management tool with C++.',
              url: 'https://github.com/yourgithub',
            ),
            SizedBox(height: 30),
            _buildSectionTitle('Skills'),
            Wrap(
              spacing: 10,
              children: [
                _buildSkillChip('Flutter'),
                _buildSkillChip('Dart'),
                _buildSkillChip('Python'),
                _buildSkillChip('C++'),
                _buildSkillChip('Embedded Systems'),
                _buildSkillChip('Networking'),
              ],
            ),
            SizedBox(height: 30),
            _buildSectionTitle('Experience'),
            _buildExperienceCard(
              title: 'Software Developer Intern',
              company: 'XYZ Tech',
              duration: 'Jan 2024 - Present',
              description:
                  'Developed and optimized embedded software solutions.',
            ),
            SizedBox(height: 30),
            _buildContactSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String description,
    required String url,
  }) {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(description, style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.link, color: Colors.blueAccent),
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            throw 'Could not launch $url';
          }
        },
      ),
    );
  }

  Widget _buildExperienceCard({
    required String title,
    required String company,
    required String duration,
    required String description,
  }) {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          '$title at $company',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(duration, style: TextStyle(color: Colors.blueAccent)),
            SizedBox(height: 5),
            Text(description, style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      backgroundColor: Colors.blueAccent,
      label: Text(skill, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildContactSection() {
    return Column(
      children: [
        _buildSectionTitle('Contact Me'),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.email, color: Colors.white),
              onPressed: () async {
                final Uri emailUri =
                    Uri(scheme: 'mailto', path: 'pawarpradeep1707@gmail.com');
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri);
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.link, color: Colors.white),
              onPressed: () async {
                const String url = 'https://linkedin.com/in/yourlinkedin';
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.code, color: Colors.white),
              onPressed: () async {
                const String url = 'https://github.com/yourgithub';
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
