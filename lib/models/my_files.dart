import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Visits",
    numOfFiles: 20,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "12/07/2024",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Booked",
    numOfFiles: 15,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "12/07/24",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Pending bookings",
    numOfFiles: 5,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "12/07/24",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Closed bookings",
    numOfFiles: 10,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "12/07/24",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
