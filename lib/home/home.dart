// ignore_for_file: deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/booking/bookings.dart';
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
        actions: [
          SvgPicture.asset(ImagePath.menu)
        ],
      ),
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
                controller.selectedCategory.value == 0 ? pink : lightBlack,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ImagePath.home,
            height: 24,
            width: 24,
            color:
                controller.selectedCategory.value == 1 ? pink : lightBlack,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ImagePath.package,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ImagePath.booking,
            height: 24,
            width: 24,
            color:
                controller.selectedCategory.value == 2 ? pink : lightBlack,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ImagePath.profile,
            height: 24,
            width: 24,
            color:
                controller.selectedCategory.value == 3 ? pink : lightBlack,
          ),
          label: '',
        ),
      ],
      selectedItemColor: pink,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
