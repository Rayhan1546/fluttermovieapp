import 'package:flutter/material.dart';

class SettingsPageUi extends StatelessWidget {
  const SettingsPageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'General',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                generalSettingUi(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget generalSettingUi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text('Name',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800)),
          subtitle: Text(
            'Rayhan',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          trailing: Icon(
            Icons.navigate_next_outlined,
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text('Language',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800)),
          subtitle: Text(
            'English',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          trailing: Icon(
            Icons.navigate_next_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
