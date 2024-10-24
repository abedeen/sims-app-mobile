import 'package:admin/screens/dashboard/components/bookings.dart';
import 'package:admin/screens/dashboard/components/processed_bookings.dart';
import 'package:admin/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: Bookings(),
              ),
              Divider(),
              Expanded(
                child: ProcessedBookings(),
              )
            ],
          ),
        ),

        Expanded(child: StorageDetails())
      ],
    );
  }
}
