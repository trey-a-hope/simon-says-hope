import 'package:flutter/material.dart';

enum CalendarMarkerStatus {
  incomplete(title: 'Incomplete'),
  almost(title: 'Almost'),
  complete(title: 'Complete');

  final String title;

  const CalendarMarkerStatus({
    required this.title,
  });
}
