import 'dart:io';

import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final String name;
  final String email;
  final int? age;
  final File? image;

  const UserDetailsPage({
    required this.name,
    required this.email,
    required this.age,
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   '/',
                //       (route) => false,
                // );
              },
              child: Text('Go to User Profile Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
