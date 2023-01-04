import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget divider() {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }
  bool _notificationEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your Profile"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        color: Color(0xFFD6D6D6),
        child: ListView(
          children: [
            colorTiles(),

          ],
        ),
      ),
      bottomNavigationBar: logoutButton(),
    );
  }

  Widget colorTiles() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                child: Icon(Icons.person_outline, color: Colors.deepPurple),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              title: Text("Personal Data",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: Colors.deepOrange, size: 20),
              onTap: () {},
            ),
            divider(),
            ListTile(
              leading: Container(
                child: Icon(Icons.email_outlined, color: Colors.blue),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              title: Text("Change your email",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              trailing: Icon(Icons.arrow_forward_ios,
                  color: Colors.deepOrange, size: 20),
              onTap: () {},
            ),
            divider(),

          ],
        ),
      ),
    );
  }


  Widget logoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            // Add your code for logging out here
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            "Log out",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
