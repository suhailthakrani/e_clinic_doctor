import 'package:flutter/material.dart';

class EmailSettingsScreen extends StatelessWidget {
  const EmailSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Settings'),
      ),
      body: Center(
        child: Text('Email Settings Screen Content'),
      ),
    );
  }
}



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


class PasswordSettingsScreen extends StatelessWidget {
  const PasswordSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Settings'),
      ),
      body: Center(
        child: Text('Password Settings Screen Content'),
      ),
    );
  }
}



