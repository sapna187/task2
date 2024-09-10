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
        actions: [SvgPicture.asset(ImagePath.menu)],
      ),
      endDrawer: const Drawer(),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/home.svg',
            height: 24,
            width: 24,
            color: controller.selectedCategory.value == 0 ? pink : lightBlack,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ImagePath.home,
            height: 24,
            width: 24,
            color: controller.selectedCategory.value == 1 ? pink : lightBlack,
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
            color: controller.selectedCategory.value == 2 ? pink : lightBlack,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            ImagePath.profile,
            height: 24,
            width: 24,
            color: controller.selectedCategory.value == 3 ? pink : lightBlack,
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
