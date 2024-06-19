import 'package:arms/Screens/welcome.dart';
import 'package:arms/controllers/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY PROFILE',
          style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(67, 104, 80, 1)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
            ),
            SizedBox(height: 16.h),
            Text('Onam Sarker',
                style: GoogleFonts.poppins(
                    fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.h),
            Text(
              '15-05954',
              style: GoogleFonts.poppins(fontSize: 16.sp),
            ),
            SizedBox(height: 32.h),
            _buildListTile(
              icon: Icons.person,
              title: 'My Account',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.help_center,
              title: 'Help Center',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.contact_support,
              title: 'Contact',
              onTap: () {},
            ),
            SizedBox(height: 250.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //Sign out
                  controller.signOut();

                  //Go to welcome page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Welcome();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 16.0,
                    ),
                    textStyle: GoogleFonts.poppins(fontSize: 18.sp)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.white),
                    SizedBox(width: 8.0),
                    Text('Sign Out',
                        style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(255, 255, 255, 1))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
