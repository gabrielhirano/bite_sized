import 'package:bite_sized/modules/models/History.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../modules/screens/history_screen.dart';

class HistoryCard extends StatelessWidget {
  final History historia;
  static Icon selected = Icon(Icons.star_border, size: 40);

  const HistoryCard({
    Key? key,
    required this.historia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: GestureDetector(
        onTap: () {
          final history = historia;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryPage(historiaSelect: history),
              ));
        },
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  historia.thumbUrl,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => print("Navigate to profile"),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 2),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: CircleAvatar(
                          foregroundImage:
                              NetworkImage(historia.author.profileImageUrl),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              child: Text(
                            historia.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 15, fontFamily: 'monospace'),
                          )),
                          Flexible(
                              child: Text(
                            '${historia.author.userName} - ${historia.like} like - ${timeago.format(historia.dateStamp)}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 13,
                                    fontFamily: 'roboto',
                                    color: Colors.grey),
                          ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selected = Icon(Icons.star, size: 20);
                        print("selected");
                        print("123");
                      },
                      child: selected,
                    )
                    // Column(
                    //   children: [
                    //     Text(historia.title),
                    //     Text(
                    //         '${historia.author.userName} - ${historia.like} Likes -'
                    //     )
                    //   ],
                    // )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
