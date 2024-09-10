// ignore_for_file: deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/booking/bookings.dart';
import 'package:nanny_vanny/components/drawer.dart';
import 'package:nanny_vanny/components/images.dart';
import 'package:nanny_vanny/home/home_controller.dart';
import 'package:nanny_vanny/packages/packages.dart';
import 'package:nanny_vanny/components/utils.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(18.0), // Add 20 pixel top padding
          child: Column(
            children: [
              gapH(20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(ImagePath.dp),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText('Welcome', lightBlack, 20.0, FontWeight.bold),
                      customText(
                        'Emily Cyrus',
                        const Color.fromARGB(255, 234, 111, 164),
                        20.0,
                        FontWeight.bold,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 18, 0),
            child: Column(
              children: [
                IconButton(
                  icon: SvgPicture.asset(ImagePath.menu),
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                ),
                gapH(10),
              ],
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Stack(

                    children: [
                      Column(
                        children: [
                          gapH(40),
                          Container(
                            height: 160,
                            width: MediaQuery.of(context).size.width / 1.2,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: lightPink,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(
                                        "Nanny And\nBabysitting Services",
                                        blue,
                                        20.0,
                                        FontWeight.w600),
                                    gapH(10),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: blue),
                                      child: Center(
                                        child: customText("Book Now", white,
                                            16.0, FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Image.asset(ImagePath.nanny),
                        ],
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: customText('Your Current Booking', blue, 20.0, FontWeight.bold)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CurrentBookingCard(),
              ),
              gapH(26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: customText("Packages", blue, 20.0, FontWeight.bold)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PackageListView(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Blue line at the top
        // Padding(
        //   padding: const EdgeInsets.all(18.0),
        //   child: Container(
        //     height: 2, // Adjust the height as needed
        //     color: Colors.blue, // Blue color for the line
        //   ),
        // ),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: controller.selectedCategory.value,
          onTap: (index) {
            controller.selectedCategory.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                height: 24,
                width: 24,
                color: controller.selectedCategory.value == 0
                    ? Color.fromARGB(255, 237, 76, 145) // pink for selected
                    : Colors.black54, // grey for unselected
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImagePath.package,
                height: 24,
                width: 24,
                color: controller.selectedCategory.value == 1
                    ? Color.fromARGB(255, 237, 76, 145)
                    : Colors.black54,
              ),
              label: 'Packages',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImagePath.booking,
                height: 24,
                width: 24,
                color: controller.selectedCategory.value == 2
                    ? Color.fromARGB(255, 237, 76, 145)
                    : Colors.black54,
              ),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImagePath.profile,
                height: 24,
                width: 24,
                color: controller.selectedCategory.value == 3
                    ? Color.fromARGB(255, 237, 76, 145)
                    : Colors.black54,
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor:
              Color.fromARGB(255, 237, 76, 145), // pink for selected
          unselectedItemColor: Colors.black54, // grey for unselected
          showSelectedLabels: true, // Show selected labels
          showUnselectedLabels: true, // Show unselected labels
        ),
      ],
    );
  }
}
