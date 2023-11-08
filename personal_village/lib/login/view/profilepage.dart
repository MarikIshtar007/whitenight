import 'package:flutter/material.dart';
import 'package:personal_village/utility/get_it_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:personal_village/login/bloc/login_bloc.dart';

import 'package:personal_village/values/constants.dart';
import 'package:personal_village/values/routes.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  // Simulated user data (replace with actual data source)
  String username = 'John Doe';
  String email = 'johndoe@example.com';
  String newPassword = '';

  void changePassword() {
    // Add logic to change the user's password here
    setState(() {
      newPassword = ''; // Reset the new password field
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),

            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            CircleAvatar(
              child: Image.asset(
                Avatarlogo, // Change this to the path of your image asset

              ),
              radius: 50.0,
              backgroundImage: AssetImage('path_to_avatar_image.png'),

            ),
            SizedBox(height: 25.0),
            Text('Username:'),
            isEditing
                ? TextField(
              decoration: InputDecoration(hintText: username),
            )
                : Text(username),
            SizedBox(height: 17.0),
            Text('Email:'),
            isEditing
                ? TextField(
              decoration: InputDecoration(hintText: email),
            )
                : Text(email),
            SizedBox(height: 17.0),
            if (isEditing)
              Column(
                children: [
                  Text('New Password:'),
                  TextField(
                    onChanged: (value) {
                      newPassword = value;
                    },
                    decoration: InputDecoration(hintText: 'Enter new password'),
                  ),
                ],
              ),
          ],
        ),
      ),
      ),
    );
  }
}
