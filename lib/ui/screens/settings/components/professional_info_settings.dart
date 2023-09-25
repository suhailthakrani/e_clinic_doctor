import 'package:flutter/material.dart';

class ProfessionalInfoSettingsScreen extends StatelessWidget {
  const ProfessionalInfoSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfessionalInfoSettingsScreen'),
      ),
      body: Center(
        child: Text('Password Settings Screen Content'),
      ),
    );
  }
}
