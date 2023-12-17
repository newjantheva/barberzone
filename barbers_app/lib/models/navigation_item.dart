import 'package:barbers_app/models/barber_model.dart';
import 'package:flutter/material.dart';

class NavigationItem {
  String? label;
  Icon? icon;
  Widget? page;

  NavigationItem(
    this.label,
    this.icon,
    this.page,
  );
}
