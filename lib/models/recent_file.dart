import 'package:flutter/material.dart';

class RecentFile {
  final String? title, date, size;
  final IconData? icon;

  RecentFile({this.icon, this.title, this.date, this.size});
}

List demoRecentFiles = [
  RecentFile(
    title: "Brian Molwantwa",
    date: "brian@gmail.com",
    size: "plaiting",
  ),
  RecentFile(
    title: "Fitzgerald Kebadire",
    date: "fitzkebadire@tuta.io",
    size: "plaiting",
  ),
  RecentFile(
    title: "Tombo Fisiwe",
    date: "tombofisiwe@yahoo.com",
    size: "hair cut",
  ),
  RecentFile(
    title: "Huma Babylon",
    date: "humababylon@gmail.com",
    size: "plaitinghair",
  ),
  RecentFile(
    title: "Benoni Ishmael",
    date: "benoniishmail@borankana.com",
    size: "haircut",
  ),
  RecentFile(
    title: "Peter Piano",
    date: "peterpian@killmonger.com",
    size: "dreadlocks",
  ),
  RecentFile(
    
    title: "Simon Bro",
    date: "simonbro@yahoo.com",
    size: "haircut",
  ),
];
