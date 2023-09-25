import 'package:flutter/material.dart';

class PersonalInfoSettingsScreen extends StatelessWidget {
  const PersonalInfoSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info Settings'),
      ),
      body: Center(
        child: Text('Personal Info Settings Screen Content'),
      ),
    );
  }
}
