import 'package:bite_sized/modules/models/Coment.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:timeago/timeago.dart' as timeago;

class ComentCard extends StatelessWidget {
  final Coment selectedComent;
  const ComentCard({super.key, required this.selectedComent});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.white,
            ),
          ),
        ),
        //color: Colors.red,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 5, top: 0),
                    padding: EdgeInsets.all(0),
                    child: Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => print("Navigate to profile"),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    width: 1),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: CircleAvatar(
                                  foregroundImage: NetworkImage(selectedComent.author.profileImageUrl)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                                '${selectedComent.author.userName}'),
                          )
                        ],
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                      '${timeago.format(selectedComent.dateStamp)}'),
                )
              ],
            ),
            Wrap(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 40),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border(
                          right: BorderSide(width: 1, color: Colors.white))),
                  padding: EdgeInsets.only(left: 30, right: 5),
                  // margin: EdgeInsets.only(left: 30),
                  child: Text(
                    '${selectedComent.coment}',
                    // maxLines: 10,
                    // softWrap: false,
                    // overflow: TextOverflow.fade,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
