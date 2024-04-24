import 'package:flutter/material.dart';

class NewEventModel{
  final String dateDay;
  final String monthDay;
  final IconData categoryIcon;
  final String imageEvent;
  final String textOfNewEvent;
  final String nameOfCategoryEvent;
  

 const NewEventModel( {required this.dateDay,required this.nameOfCategoryEvent , required this.monthDay, required this.categoryIcon, required this.imageEvent, required this.textOfNewEvent});

}