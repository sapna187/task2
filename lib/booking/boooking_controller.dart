import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingController extends GetxController {
  var isLoading = true.obs;
  var bookingData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }

  void fetchBookings() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          'https://www.cgprojects.in/lens8/api/dummy/current_booking_list'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData['status'] == 'success') {
          if (jsonData['response'] != null && jsonData['response'].isNotEmpty) {
            bookingData.value = jsonData['response'][0];
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching bookings: $e");
    } finally {
      isLoading(false);
    }
  }
}
