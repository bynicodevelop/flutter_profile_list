import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_profile_list/flutter_profile_list.dart';
import 'package:flutter_profile_list/models/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Faker _faker = Faker();
  List<ItemProfileModel> _profiles = List<ItemProfileModel>();

  @override
  void initState() {
    super.initState();

    // Creating a List of ItemProfileModel
    for (int i = 0; i < 30; i++) {
      int randInt = _faker.randomGenerator.integer(9);

      _profiles.add(
        ItemProfileModel(
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        // Call the Widget
        body: ProfileList(
          // Capture the on tap event to trigger an action such as a redirect
          onTap: (ItemProfileModel profile) => print(profile.toJson()),
          // Set the list of items (profiles)
          profiles: _profiles,
        ),
      ),
    );
  }
}
