import 'package:flutter/material.dart';
import 'package:flutter_models/models/UserModel.dart';
import 'package:flutter_profile_list/widgets/ProfileItem.dart';

class ProfileList extends StatefulWidget {
  final Function(UserModel) onTap;
  final List<UserModel> profiles;

  const ProfileList({
    Key key,
    @required this.onTap,
    @required this.profiles,
  }) : super(key: key);

  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.profiles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? 10.0 : 0,
          ),
          child: ProfileItem(
            onTap: widget.onTap,
            profile: widget.profiles[index],
          ),
        );
      },
    );
  }
}
