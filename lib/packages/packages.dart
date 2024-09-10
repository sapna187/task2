import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        return const Center(child: Text('No packages available'));
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
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
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
          ],
        ),
      ),
    );
  }
}
