// lib/features/profile/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/others/profile_picture.jpg'),
                  ),
                  SizedBox(height: 16),
                  Text('Layan Yashoda', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('layanyashoda@gmail.com', style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Iconsax.user, color: Colors.blue),
              title: Text('Edit Profile', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Navigate to Edit Profile screen
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Iconsax.setting, color: Colors.orange),
              title: Text('Settings', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Navigate to Settings screen
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Iconsax.info_circle, color: Colors.green),
              title: Text('Help', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Navigate to Help screen
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Iconsax.logout, color: Colors.red),
              title: Text('Logout', style: TextStyle(fontSize: 18)),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}