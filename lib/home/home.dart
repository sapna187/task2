// ignore_for_file: deprecated_member_use, avoid_print
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/booking/bookings.dart';
import 'package:nanny_vanny/home/home_controller.dart';
import 'package:nanny_vanny/packages/packages.dart';
import 'package:nanny_vanny/utils.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      key: scaffoldKey,
      appBar: customAppBar(scaffoldKey),
      endDrawer: const Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nanny And Babysitting Services',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Book Now'),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/images/lady.svg',
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Current Booking',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CurrentBookingCard(),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Packages',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PackageListView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  PreferredSizeWidget customAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
    final HomeController controller = Get.put(HomeController());

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => GestureDetector(
              onTap: () => controller.pickImage(),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: boxColor,
                    backgroundImage: controller.selectedImage.value != null
                        ? FileImage(File(controller.selectedImage.value!.path))
                        : null,
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: orange,
                      child: Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              gapW(20),
              customText('CUSTOMER NAME', orange, 16.0, FontWeight.w600),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.location_on, color: boxColor, size: 16),
              gapW(5),
              SizedBox(
                height: 20,
                child: Obx(() => Container(
                      constraints: const BoxConstraints(maxWidth: 118),
                      child: DropdownButton<String>(
                        value: controller.selectedCity.value,
                        underline: const SizedBox(),
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.black),
                        items: controller.cities
                            .map((city) => DropdownMenuItem<String>(
                                value: city,
                                child: customText(
                                    city, black, 13.0, FontWeight.w600)))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.updateCity(value);
                          }
                        },
                      ),
                    )),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/images/Menu.svg"),
          onPressed: () => controller.openDrawer(scaffoldKey),
        ),
      ],
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/home.svg',
            height: 24,
            width: 24,
            color:
                controller.selectedCategory.value == 0 ? orange : Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/menu2.svg',
            height: 24,
            width: 24,
            color:
                controller.selectedCategory.value == 1 ? orange : Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/add.svg',
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/notifi.svg',
            height: 24,
            width: 24,
            color:
                controller.selectedCategory.value == 2 ? orange : Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/profle.svg',
            height: 24,
            width: 24,
            color:
                controller.selectedCategory.value == 3 ? orange : Colors.grey,
          ),
          label: '',
        ),
      ],
      selectedItemColor: orange,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
