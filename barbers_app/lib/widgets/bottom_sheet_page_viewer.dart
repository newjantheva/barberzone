import 'package:barbers_app/responsive/mobile_body.dart';
import 'package:barbers_app/widgets/barber_list_content.dart';
import 'package:barbers_app/widgets/booking_datetime_content.dart';
import 'package:barbers_app/widgets/product_service_list_content.dart';
import 'package:flutter/material.dart';

class BottomSheetPageViewer extends StatelessWidget {
  BottomSheetPageViewer({super.key});

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        // Page 1ss
        // BarberListContent(
        //   text: 'Page 1',
        //   nextPage: () {
        //     _pageController.nextPage(
        //         duration: const Duration(milliseconds: 300),
        //         curve: Curves.ease);
        //   },
        // ),

        // Page 2
        ProductServiceListContent(
          text: 'Page 2',
          previousPage: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
          nextPage: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
        ),

        // Page 3
        BookingDateTimeContent(
          text: 'Page 3',
          previousPage: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
        ),
      ],
    );
  }
}
