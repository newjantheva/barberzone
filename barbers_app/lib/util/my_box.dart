import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  const MyBox({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[400],
        ),
        child: Text(title ?? ''),
      ),
    );
  }
}
