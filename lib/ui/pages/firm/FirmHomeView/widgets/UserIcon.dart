import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';

class UserIcon extends StatelessWidget {
   UserIcon(this.avatarUrl);
   String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.network(
        avatarUrl,
        height: 57.px,
        width: 57.px,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }
}