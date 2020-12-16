import 'package:flutter/material.dart';
import 'package:flutter_profile_avatar/flutter_profile_avatar.dart';
import 'package:flutter_models/models/UserModel.dart';

class ProfileItem extends StatelessWidget {
  final Function(UserModel) onTap;
  final UserModel profile;

  const ProfileItem({
    Key key,
    @required this.onTap,
    @required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(profile),
      title: Container(
        margin: EdgeInsets.only(
          bottom: 10.0,
        ),
        child: Row(
          children: [
            Hero(
              tag: profile.uid,
              child: ProfileAvatar(
                username: profile.username,
                avatarURL: profile.avatarURL,
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.username.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  profile.status,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
