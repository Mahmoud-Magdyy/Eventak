import 'package:flutter/material.dart';

class TrendingEeventModel {
  final ImageProvider<Object> image;
  final String day;
  final String month;
  final String nameOfEvent;
  final String location;

  const TrendingEeventModel({
    required this.image,
    required this.day,
    required this.month,
    required this.nameOfEvent,
    required this.location,
  });
}