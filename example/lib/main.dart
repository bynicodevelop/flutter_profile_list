import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_profile_list/flutter_profile_list.dart';
import 'package:flutter_models/models/UserModel.dart';
import 'package:flutter_mobile_camera/CameraBuilder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Faker _faker = Faker();
  List<UserModel> _profiles = List<UserModel>();

  @override
  void initState() {
    super.initState();

    // Creating a List of UserModel
    for (int i = 0; i < 30; i++) {
      int randInt = _faker.randomGenerator.integer(9);

      _profiles.add(
        UserModel(
          uid: _faker.randomGenerator.string(10),
          username: _faker.person.name(),
          status: randInt % 3 != 0 ? _faker.lorem.sentences(2).join(' ') : '',
          avatarURL: randInt % 3 != 0
              ? _faker.image.image(width: 200, height: 200, keywords: [
                  'person',
                  DateTime.now().toString(),
                ])
              : null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CameraBuilder(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          // Call the Widget
          body: ProfileList(
            // Capture the on tap event to trigger an action such as a redirect
            onTap: (UserModel profile) => print(profile.toJson()),
            // Set the list of items (profiles)
            profiles: _profiles,
          ),
        ),
      ),
    );
  }
}
