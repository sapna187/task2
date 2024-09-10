import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PackageController extends GetxController {
  var packages = <Map<String, String>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    try {
      final response = await http.get(
          Uri.parse('https://www.cgprojects.in/lens8/api/dummy/packages_list'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['response'] != null && data['response'] is List) {
          final List<Map<String, String>> fetchedPackages =
              (data['response'] as List)
                  .map((item) => {
                        'title': item['title'].toString(),
                        'price': '₹ ${item['price'].toString()}',
                        'description': item['desc'].toString(),
                      })
                  .toList();

          packages.value = fetchedPackages;
        } else {
          throw Exception('Unexpected data format');
        }
      } else {
        throw Exception('Failed to load packages');
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
