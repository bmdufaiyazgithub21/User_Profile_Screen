import 'package:flutter/material.dart';
import 'package:user_profile_screen/user_profile_page.dart';

import 'FeedbackAndComplaintPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FeedbackAndComplaintPage()
    );
  }
}
