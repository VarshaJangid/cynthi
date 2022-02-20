import 'package:flutter/material.dart';
import '/utils/app_route.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => AppRoutes.dismiss(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
    );
  }
}
