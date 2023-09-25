import 'package:flutter/material.dart';

class PhoneNoSettingsScreen extends StatelessWidget {
  const PhoneNoSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number Settings'),
      ),
      body: Center(
        child: Text('Phone Number Settings Screen Content'),
      ),
    );
  }
}
