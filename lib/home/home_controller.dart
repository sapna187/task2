// controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nanny_vanny/utils.dart';

class HomeController extends GetxController {
  var selectedCategory = 0.obs;
  var favoriteItems = [].obs;

  void selectCategory(int index) {
    selectedCategory.value = index;
  }

  var selectedImage = Rx<XFile?>(null);
  final ImagePicker picker = ImagePicker();

  void openDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image;
    }
  }

  var selectedCity = 'Kolkata, India'.obs;
  var cities = [
    'Kolkata, India',
    'Punjab, India',
    'Patna, India',
    'Mumbai, India',
    'Delhi, India',
  ].obs;

  void updateCity(String city) {
    selectedCity.value = city;
  }
}
