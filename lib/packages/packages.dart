import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/components/images.dart';
import 'package:nanny_vanny/components/utils.dart';
import 'package:nanny_vanny/packages/package_controller.dart';

class PackageListView extends StatelessWidget {
  final PackageController packageController = Get.put(PackageController());

  PackageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (packageController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (packageController.packages.isEmpty) {
        return Center(
            child: customText(
                "No Packages available", lightBlack, 16.0, FontWeight.w600));
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: packageController.packages.length,
        itemBuilder: (context, index) {
          return PackageCard(
            title: packageController.packages[index]['title']!,
            price: packageController.packages[index]['price']!,
            description: packageController.packages[index]['description']!,
          );
        },
      );
    });
  }
}

class PackageCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;

  const PackageCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: price == '₹ 7497' ? lightBlue : lightPink,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(title == 'Three Day Package'
                    ? ImagePath.threeDays
                    : title == 'Five Day Package'
                        ? ImagePath.fiveDays
                        : title == 'Weekend Day Package'
                            ? ImagePath.weekend
                            : ImagePath.cal2),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: price == '₹ 7497' ? dirtyBlue : pinkText),
                  child: Center(
                    child: customText("Book Now", white, 16.0, FontWeight.w500),
                  ),
                )
              ],
            ),
            gapH(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(title, blue, 18.0, FontWeight.bold),
                customText(price, blue, 18.0, FontWeight.bold),
              ],
            ),
            const SizedBox(height: 8),
            customText(
                description,
                title == 'Weekend Day Package' ? white : lightBlack,
                14.0,
                FontWeight.w500),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
