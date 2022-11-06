import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Category { functions, educations, sports, recreation }

class Event {
  late String title;
  late String address;
  late String description;
  late Category category;
  late int max_capacity;
  late DateTime date;

  Event(String title, String address, String description, Category category, int max_capacity, DateTime date) {
    this.title = title;
    this.address = address;
    this.description = description;
    this.category = category;
    this.max_capacity = max_capacity;
    this.date = date;
  }
}
