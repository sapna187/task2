import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/booking/boooking_controller.dart';
import 'package:nanny_vanny/components/images.dart';
import 'package:nanny_vanny/components/utils.dart';

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
        return Center(
            child: customText(
                "No bookings available", lightBlack, 16.0, FontWeight.w600));
      }

      var booking = bookingController.bookingData;

      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(booking['title'] ?? 'Package', pinkText, 17.0,
                    FontWeight.w500),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: pinkText),
                  child: Center(
                    child: customText("Start", white, 16.0, FontWeight.w500),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText("From", lightBlack, 14.0, FontWeight.w500),
                    Row(
                      children: [
                        SvgPicture.asset(ImagePath.cal1),
                        gapW(5),
                        customText(booking['from_date'], lightBlack, 16.0,
                            FontWeight.w600),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(ImagePath.clock),
                        gapW(5),
                        customText(booking['from_time'], lightBlack, 16.0,
                            FontWeight.w600),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText("To", lightBlack, 16.0, FontWeight.w500),
                    Row(
                      children: [
                        SvgPicture.asset(ImagePath.cal1),
                        gapW(5),
                        customText(booking['to_date'], lightBlack, 16.0,
                            FontWeight.w600),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(ImagePath.clock),
                        gapW(5),
                        customText(booking['to_time'], lightBlack, 14.0,
                            FontWeight.w600),
                      ],
                    ),
                  ],
                ),
                gapW(5)
              ],
            ),
            gapH(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 25,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), color: blue),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImagePath.star),
                        gapW(4),
                        customText("Rate Us", white, 15.0, FontWeight.w500),
                      ],
                    ),
                  ),
                ),
                
                Container(
                  height: 25,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), color: blue),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImagePath.pin),
                        gapW(4),
                        customText("Geolocation", white, 15.0, FontWeight.w500),
                      ],
                    ),
                  ),
                ),
                
                Container(
                  height: 25,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), color: blue),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImagePath.radio),
                        gapW(4),
                        customText("Surveillance", white, 15.0, FontWeight.w500),
                      ],
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
