
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
