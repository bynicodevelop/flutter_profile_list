import 'package:flutter/material.dart';
import 'package:flutter_models/models/UserModel.dart';
import 'package:flutter_item_list/widgets/Item.dart';

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
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      itemCount: widget.profiles.length,
      itemBuilder: (context, index) {
        return Item(
          onTap: (uid) => widget.onTap(widget.profiles[index]),
          uid: widget.profiles[index].uid,
          label: widget.profiles[index].username,
          subLabel: widget.profiles[index].status,
          avatarURL: widget.profiles[index].avatarURL,
        );
      },
    );
  }
}
