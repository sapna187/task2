import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/booking/boooking_controller.dart';

class CurrentBookingCard extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());

  CurrentBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (bookingController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (bookingController.bookingData.isEmpty) {
        return const Center(child: Text("No bookings available"));
      }

      var booking = bookingController.bookingData;

      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking['title'] ?? 'Package',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'From\n${booking['from_date']}\n${booking['from_time']}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'To\n${booking['to_date']}\n${booking['to_time']}',
                  style: const TextStyle(fontSize: 14),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Start'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Rate Us',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Geolocation',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Surveillance',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
