import 'dart:io';
import 'package:flutter/material.dart';
import 'package:user_profile_screen/user_profile_page.dart';

class UserDetailsPage extends StatelessWidget {
  final String name;
  final String email;
  final int? age;
  final int? aadharno;
  final File? image;

  const UserDetailsPage({
    required this.name,
    required this.email,
    required this.age,
    required this.aadharno,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(image!),
              ),
            SizedBox(height: 20),
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Age: ${age ?? 'Not specified'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Aadhar No: ${aadharno ?? 'Not specified'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserProfilePage(),), (route) => false);
              },
              child: Text('Go to User Profile Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
