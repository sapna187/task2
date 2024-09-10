import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingController extends GetxController {
  var isLoading = true.obs; // Observable to handle loading state
  var bookingData = {}.obs; // Observable to hold booking data

  @override
  void onInit() {
    super.onInit();
    fetchBookings(); // Fetch bookings when the controller is initialized
  }

  // Method to fetch booking data from the API
  void fetchBookings() async {
    try {
      isLoading(true); // Set loading to true
      var response = await http.get(Uri.parse(
          'https://www.cgprojects.in/lens8/api/dummy/current_booking_list')); // Replace with your API endpoint
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body); // Decode JSON response
        if (jsonData['status'] == 'success') {
          // Check if the response status is success
          if (jsonData['response'] != null && jsonData['response'].isNotEmpty) {
            bookingData.value = jsonData['response']
                [0]; // Update booking data with the first response item
          }
        }
      }
    } catch (e) {
      print("Error fetching bookings: $e"); // Print any errors
    } finally {
      isLoading(false); // Set loading to false after the request is complete
    }
  }
}
