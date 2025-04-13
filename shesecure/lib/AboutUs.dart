import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.yellow[100],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB0BEC5),
              Color(0xFF78909C)
            ], // Light and dark shades of blue-gray
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // Your child widgets go here

        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rotating Poster
              Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/women_safety_poster.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 6.3, // 2 * pi radians
                      child: child,
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              // Section: What is the Women Safety App?
              _buildSectionCard(
                icon: Icons.info,
                title: 'What is the Women Safety App?',
                content:
                    'The Women Safety App is designed to enhance personal safety by providing real-time assistance and resources to women in distress. It leverages technology to offer features like emergency alerts, location tracking, and quick access to support services.',
              ),
              SizedBox(height: 16),
              // Section: Why is it Important?
              _buildSectionCard(
                icon: Icons.lock,
                title: 'Why is it Important?',
                content:
                    'In today\'s world, personal safety is a significant concern. Women, in particular, often face situations where they may feel vulnerable. This app aims to empower users by providing tools that can deter potential threats and ensure help is just a tap away.',
              ),
              SizedBox(height: 16),
              // Section: How Does it Work?
              _buildSectionCard(
                icon: Icons.settings,
                title: 'How Does it Work?',
                content: 'The app offers several key features:\n\n'
                    '- *Emergency Alerts*: Send immediate alerts to predefined contacts with your real-time location.\n'
                    '- *Location Tracking*: Trusted contacts can monitor your journey in real-time, ensuring you reach your destination safely.\n'
                    '- *Nearby Safe Zones*: Locate nearby police stations, hospitals, and safe zones quickly.\n'
                    '- *Community Reporting*: Report incidents anonymously to inform others and help create a safer community.',
              ),
              SizedBox(height: 16),
              // Section: Developer Details
              _buildSectionCard(
                icon: Icons.person,
                title: 'Developer Details',
                content: '',
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/developer_photo.png'),
                  ),
                  title: Text('Rohit Bamne'),
                  subtitle: Text('Lead Developer\nrohit54@gmail.com'),
                ),
              ),
              SizedBox(height: 8),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),

                elevation: 4,
                // Adds shadow for a lifted effect
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),

                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: _buildSectionContent(
                    'Rohit Bamne is a seasoned software developer with a passion for creating applications that make a difference. With over 10 years of experience in mobile app development, he has led multiple projects focusing on safety and community well-being.',
                  ),
                ),
              ),

              SizedBox(height: 16),
              // Section: Contact Us
              _buildSectionCard(
                icon: Icons.contact_mail,
                title: 'Contact Us',
                content:
                    'We value your feedback and are here to assist you. Reach out to us at support@womensafetyapp.com or call us at +91 78793 90759.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required IconData icon,
    required String title,
    required String content,
    Widget? child,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.deepPurpleAccent),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            if (child != null) child else _buildSectionContent(content),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
    );
  }
}

