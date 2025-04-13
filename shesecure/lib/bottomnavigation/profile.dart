import 'package:flutter/material.dart';
import 'package:shesecure/AboutUs.dart';


// Uncomment if using Firebase Authentication
// import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://csrbox.org/company/proj_img/1598254332women%20safety.png'),
                  backgroundColor: Colors.grey[300],
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Rohit Bamne',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Bamne420@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),
            _buildTextField(label: 'Full Name', icon: Icons.person),
            _buildTextField(label: 'E-mail Address', icon: Icons.email),
            Row(
              children: [
                Expanded(
                    child: _buildTextField(
                        label: 'Gender', icon: Icons.person_outline)),
                SizedBox(width: 10),
                Expanded(
                    child: _buildTextField(
                        label: 'Age', icon: Icons.calendar_today)),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: _buildTextField(
                        label: 'Health-update', icon: Icons.health_and_safety)),
                SizedBox(width: 10),
                Expanded(
                    child: _buildTextField(
                        label: 'Status', icon: Icons.verified_user)),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child:
                        _buildTextField(label: 'Country', icon: Icons.public)),
                SizedBox(width: 10),
                Expanded(
                    child: _buildTextField(
                        label: 'State', icon: Icons.location_on)),
                SizedBox(width: 10),
                Expanded(
                    child: _buildTextField(
                        label: 'City', icon: Icons.location_city)),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Save Profile',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            SizedBox(height: 30),
            Text('Health-Detail',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter health details here...',
                prefixIcon: Icon(Icons.note),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required IconData icon}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(icon, color: Colors.green),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );
  }
}

// Dummy Login Screen (Replace with your actual implementation)
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(child: Text('Login Page (To be implemented)')),
    );
  }
}

