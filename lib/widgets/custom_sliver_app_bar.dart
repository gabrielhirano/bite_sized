import 'package:bite_sized/persistents/LoggedUser.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      floating: true,
      leadingWidth: 80.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 0, top: 8, bottom: 8),
        child: Image.asset('assets/images/icon.png'),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(6),
          child: Row(children: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: CircleAvatar(
                  backgroundImage:
                      NetworkImage(LoggedUser.user.profileImageUrl)),
              onPressed: () {},
            ),
          ]),
        ),
      ],
    );
  }
}
