import 'package:flutter/material.dart';

class NewEventModel {
  //!left
  final String dateDay;
  final String monthDay;
  final IconData categoryIcon;
  final String imageEvent;
  final String textOfNewEvent;
  final String nameOfCategoryEvent;
  //!right
  final String nameOfEvent;
  final String titleDateOfTicket;
  final String subTitleDateOfTicket;
  final String titleLocationOfEvent;
  final String subTitleLocationOfEvent;
  final String titlePriceOfEvent;
  final String subTitlePriceOfEvent;
  const NewEventModel(
      {required this.nameOfEvent,
      required this.titleDateOfTicket,
      required this.subTitleDateOfTicket,
      required this.titleLocationOfEvent,
      required this.subTitleLocationOfEvent,
      required this.titlePriceOfEvent,
      required this.subTitlePriceOfEvent,
      required this.dateDay,
      required this.nameOfCategoryEvent,
      required this.monthDay,
      required this.categoryIcon,
      required this.imageEvent,
      required this.textOfNewEvent});
}
