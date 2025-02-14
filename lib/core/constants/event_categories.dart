import 'package:evently_app/models/event_category.dart';
import 'package:flutter/material.dart';

abstract class EventCategories{

  static List<EventCategory> eventCategories = [
    EventCategory(
      eventCategoryName: "Book Club",
      eventCategoryIcon: Icons.menu_book_outlined,
      eventCategoryImg: "assets/images/event_images/book_club.png",
    ),
    EventCategory(
        eventCategoryName: "Sport",
        eventCategoryIcon: Icons.directions_bike,
        eventCategoryImg: "assets/images/event_images/sport.png"),
    EventCategory(
        eventCategoryName: "BirthDay",
        eventCategoryIcon: Icons.cake_outlined,
        eventCategoryImg: "assets/images/event_images/birthday.png"),
    EventCategory(
        eventCategoryName: "Meeting",
        eventCategoryIcon: Icons.meeting_room_outlined,
        eventCategoryImg: "assets/images/event_images/meeting.png"),
    EventCategory(
        eventCategoryName: "Holiday",
        eventCategoryIcon: Icons.holiday_village_outlined,
        eventCategoryImg: "assets/images/event_images/holiday.png"),
    EventCategory(
        eventCategoryName: "Eating",
        eventCategoryIcon: Icons.fastfood,
        eventCategoryImg: "assets/images/event_images/eating.png"),
    EventCategory(
        eventCategoryName: "Gaming",
        eventCategoryIcon: Icons.games_rounded,
        eventCategoryImg: "assets/images/event_images/gaming.png"),
    EventCategory(
        eventCategoryName: "Work shop",
        eventCategoryIcon: Icons.work,
        eventCategoryImg: "assets/images/event_images/work_shop.png"),
  ];
}