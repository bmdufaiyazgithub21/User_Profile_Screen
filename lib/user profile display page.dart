import 'dart:io';
import 'package:flutter/material.dart';
import 'package:user_profile_screen/user_profile_page.dart';

class UserDetailsPage extends StatelessWidget {
  final String name;
  final int? mob;
  final String email;
  final String gen;
  final String com;
  final String des;
  final String marital;
  final String state;
  final String city;
  final String pin;
  final File? image;

  const UserDetailsPage({
    required this.name,
    required this.mob,
    required this.email,
    required this.gen,
    required this.com,
    required this.des,
    required this.marital,
    required this.state,
    required this.city,
    required this.pin,
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
            SizedBox(height: 20),
            Text(
              'Mobile No: ${mob}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Gender: $gen',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Company Nmae: $com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Designation: $des',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'State: $state',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'City: $city',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Pincode: $pin',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Marital Status: $marital',
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
