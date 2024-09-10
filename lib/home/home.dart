// home.dart

// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/home/booking_controller.dart';
import 'package:nanny_vanny/home/controller.dart';
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
      body:
          // SafeArea(
          //   child: SingleChildScrollView(
          //     child: Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           searchBar(),
          //           gapH(20),
          //           carouselSlider(),
          //           gapH(20),
          //           categoryTabs(),
          //           gapH(20),
          //           favouriteItems(),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nanny and Babysitting Services Section
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
                        Text(
                          'Nanny And Babysitting Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Book Now'),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/images/lady.svg', // Placeholder image
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),

            // Your Current Booking Section
            Padding(
              padding: const EdgeInsets.all(16.0),
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

            // Packages Section
            Padding(
              padding: const EdgeInsets.all(16.0),
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

  Widget searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search your favourite items',
        hintStyle: const TextStyle(color: lightBlack, fontFamily: 'Sen'),
        prefixIcon: const Icon(Icons.search, color: boxColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: search,
      ),
    );
  }

  Widget categoryTabs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText("All Categories", black, 18.0, FontWeight.w500),
            Row(
              children: [
                customText("See All", black, 16.0, FontWeight.w500),
                gapW(5),
                const Icon(Icons.arrow_forward_ios_rounded,
                    size: 14, color: boxColor)
              ],
            )
          ],
        ),
        Obx(() {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 100,
              child: Row(
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    onTap: () => controller.selectCategory(index),
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(12, 12),
                            blurRadius: 40,
                            color: Color.fromARGB(15, 0, 0, 0),
                            spreadRadius: 0,
                          )
                        ],
                        color: controller.selectedCategory.value == index
                            ? lightOrange
                            : white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: boxColor,
                          ),
                          gapW(15),
                          customText(index == 0 ? 'All' : 'Cat $index', black,
                              14.0, FontWeight.w500),
                          gapW(5),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget favouriteItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Favourite Items", black, 20.0, FontWeight.w500),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xffD0D9E1),
                  child: IconButton(
                    icon: const Icon(Icons.favorite, color: orange),
                    onPressed: () {},
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText("Rose Garden Restaurant", black, 20.0, FontWeight.w500),
            customText("Kolkata, India", lightBlack, 14.0, FontWeight.w500),
            gapH(5),
            Row(
              children: [
                const Icon(Icons.star_border, color: Colors.orange, size: 16),
                const SizedBox(width: 5),
                customText("4.7", black, 13.0, FontWeight.w600),
                const SizedBox(width: 10),
                SizedBox(
                    height: 15,
                    width: 15,
                    child: SvgPicture.asset("assets/images/Clock.svg")),
                const SizedBox(width: 5),
                customText("Open", orange, 13.0, FontWeight.w500),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget carouselSlider() {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: controller.imageList
                  .map(
                    (item) => Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: item['color'],
                        borderRadius:
                            BorderRadius.circular(item['borderRadius']),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: controller.carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: false,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  controller.currentIndex.value = index;
                },
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>
                        controller.carouselController.animateToPage(entry.key),
                    child: Obx(
                      () => Container(
                        width:
                            controller.currentIndex.value == entry.key ? 20 : 9,
                        height: 9.0,
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: controller.currentIndex.value == entry.key
                              ? white
                              : lightBox,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  if (controller.currentIndex.value > 0) {
                    controller.carouselController.previousPage();
                  }
                },
                child: Container(
                  height: 25,
                  width: 62,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: customText(
                          "Prev", lightBlack, 13.0, FontWeight.w600)),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  if (controller.currentIndex.value <
                      controller.imageList.length - 1) {
                    controller.carouselController.nextPage();
                  }
                },
                child: Container(
                  height: 25,
                  width: 62,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: customText(
                          "Next", lightBlack, 13.0, FontWeight.w600)),
                ),
              ),
            ),
          ],
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

class CurrentBookingCard extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (bookingController.isLoading.value) {
        return Center(child: CircularProgressIndicator()); // Show loading indicator while fetching data
      }

      if (bookingController.bookingData.isEmpty) {
        return Center(child: Text("No bookings available")); // Show message if no data is available
      }

      var booking = bookingController.bookingData; // Access booking data

      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking['title'] ?? 'Package', // Display the package title
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'From\n${booking['from_date']}\n${booking['from_time']}', // Display from date and time
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'To\n${booking['to_date']}\n${booking['to_time']}', // Display to date and time
                  style: TextStyle(fontSize: 14),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your start button logic here
                  },
                  child: Text('Start'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your rate us button logic here
                  },
                  child: Text(
                    'Rate Us',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your geolocation button logic here
                  },
                  child: Text(
                    'Geolocation',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your surveillance button logic here
                  },
                  child: Text(
                    'Surveillance',
                    style: TextStyle(
                      fontSize: 12,
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
class PackageListView extends StatefulWidget {
  @override
  _PackageListViewState createState() => _PackageListViewState();
}

class _PackageListViewState extends State<PackageListView> {
  List<Map<String, String>> packages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    final response = await http.get(Uri.parse('YOUR_API_ENDPOINT_URL'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, String>> fetchedPackages = (data['response'] as List)
          .map((item) => {
                'title': item['title'],
                'price': '₹ ${item['price']}',
                'description': item['desc'],
              })
          .toList();

      setState(() {
        packages = fetchedPackages;
        isLoading = false;
      });
    } else {
      // Handle error
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load packages');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: packages.length,
      itemBuilder: (context, index) {
        return PackageCard(
          title: packages[index]['title']!,
          price: packages[index]['price']!,
          description: packages[index]['description']!,
        );
      },
    );
  }
}

class PackageCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;

  const PackageCard({
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Book Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}