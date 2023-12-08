import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    //`selectedDate` the new date selected.
                  },
                  activeColor: Colors.white,
                  // headerProps: const EasyHeaderProps(
                  //   monthPickerType: MonthPickerType.switcher,
                  //   selectedDateFormat: SelectedDateFormat.fullDateDayAsStrMY,
                  // ),
                  // dayProps: const EasyDayProps(
                  //   activeDayStyle: DayStyle(
                  //     borderRadius: 20.0,
                  //   ),
                  //   inactiveDayStyle: DayStyle(
                  //     borderRadius: 20.0,
                  //   ),
                  // ),
                  // timeLineProps: const EasyTimeLineProps(
                  //   hPadding: 16.0, // padding from left and right
                  //   separatorPadding: 16.0, // padding between days
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
