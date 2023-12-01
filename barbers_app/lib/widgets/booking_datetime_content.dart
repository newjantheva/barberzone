import 'package:flutter/material.dart';

class BookingDateTimeContent extends StatelessWidget {
  final String text;
  final VoidCallback? previousPage;
  final VoidCallback? nextPage;

  const BookingDateTimeContent({
    super.key,
    required this.text,
    this.previousPage,
    this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (previousPage != null)
          ElevatedButton(
            onPressed: previousPage,
            child: Text('Previous Page'),
          ),
        if (nextPage != null)
          ElevatedButton(
            onPressed: nextPage,
            child: Text('Next Page'),
          ),
      ],
    );
  }
}
