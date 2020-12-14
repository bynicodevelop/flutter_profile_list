import 'package:flutter/material.dart';
import 'package:flutter_profile_list/models/Profile.dart';

class ProfileItem extends StatelessWidget {
  final Function(ItemProfileModel) onTap;
  final ItemProfileModel profile;

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
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                backgroundImage: NetworkImage(profile.avatarURL),
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
