import 'package:flutter/material.dart';

class ItemProfileModel {
  static final String UID = 'uid';
  static final String AVATAR_URL = 'avatarURL';
  static final String USERNAME = 'username';
  static final String STATUS = 'status';

  final String uid;
  final String username;
  final String status;
  final String avatarURL;

  ItemProfileModel({
    @required this.uid,
    @required this.username,
    this.status,
    this.avatarURL,
  });

  Map<String, dynamic> toJson() => _$ItemProfileModelToJson(this);
}

Map<String, dynamic> _$ItemProfileModelToJson(ItemProfileModel instance) =>
    <String, dynamic>{
      ItemProfileModel.UID: instance.uid,
      ItemProfileModel.AVATAR_URL: instance.avatarURL,
      ItemProfileModel.USERNAME: instance.username,
      ItemProfileModel.STATUS: instance.status,
    };
