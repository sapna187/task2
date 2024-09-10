// controller.dart

import 'package:carousel_slider/carousel_slider.dart';
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

  List<Map<String, dynamic>> imageList = [
    {
      "id": 1,
      "color": boxColor,
      "borderRadius": 20.0,
    },
    {
      "id": 2,
      "color": boxColor,
      "borderRadius": 20.0,
    },
    {
      "id": 3,
      "color": boxColor,
      "borderRadius": 20.0,
    },
    {
      "id": 4,
      "color": boxColor,
      "borderRadius": 20.0,
    },
    {
      "id": 5,
      "color": boxColor,
      "borderRadius": 20.0,
    },
  ];

  final CarouselSliderController carouselController =
      CarouselSliderController();
  var currentIndex = 0.obs;

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