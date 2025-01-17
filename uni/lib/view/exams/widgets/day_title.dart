import 'package:flutter/material.dart';

class DayTitle extends StatelessWidget {
  const DayTitle({
    required this.day,
    required this.weekDay,
    required this.month,
    super.key,
  });
  final String day;
  final String weekDay;
  final String month;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 3),
      alignment: Alignment.center,
      child: Text(
        '$weekDay, $day de $month',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
