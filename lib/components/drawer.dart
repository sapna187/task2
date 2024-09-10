import 'package:flutter/material.dart';
import 'package:nanny_vanny/components/images.dart';
import 'package:nanny_vanny/components/utils.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: white,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  gapH(0),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(ImagePath.dp),
                  ),
                  const SizedBox(height: 10),
                  customText(
                      'Emily Cyrus',
                      const Color.fromARGB(255, 234, 111, 164),
                      20.0,
                      FontWeight.bold)
                ],
              ),
            ),
            gapH(20),
            _buildDrawerItem(context, 'Home'),
            _buildDivider(),
            _buildDrawerItem(context, 'Book A Nanny'),
            _buildDivider(),
            _buildDrawerItem(context, 'How It Works'),
            _buildDivider(),
            _buildDrawerItem(context, 'Why Nanny Vanny'),
            _buildDivider(),
            _buildDrawerItem(context, 'My Bookings'),
            _buildDivider(),
            _buildDrawerItem(context, 'My Profile'),
            _buildDivider(),
            _buildDrawerItem(context, 'Support'),
          ],
        ),
      ),
    );
  }

  // Method to build each drawer item
  Widget _buildDrawerItem(BuildContext context, String title) {
    return ListTile(
      title: customText(title, blue, 20.0, FontWeight.bold),
      onTap: () {},
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Color.fromARGB(255, 214, 213, 213),
    );
  }
}
