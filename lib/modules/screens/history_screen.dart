import 'package:bite_sized/modules/models/History.dart';
import 'package:bite_sized/widgets/coment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/src/observer.dart';

class HistoryPage extends StatelessWidget {
  final History historiaSelect;

  const HistoryPage({
    Key? key,
    required this.historiaSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      //scrollDirection: Axis.horizontal, for row
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            _buildHeader(context),
            _buildComents(),
          ],
        ),
      ),
    ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          transform: Matrix4.translationValues(0, 25, 0.0),
          child: Image.network(
            historiaSelect.thumbUrl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          transform: Matrix4.translationValues(
              10, -MediaQuery.of(context).size.height * 0.25, 2),
          child: GestureDetector(
            onTap: () {
              print('return');
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.white))),
          // color: Colors.green,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                transform: Matrix4.translationValues(10, -15.0, 0.0),
                child: Row(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(left: 5, bottom: 10),
                      child: GestureDetector(
                        onTap: () => print('profile'),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: CircleAvatar(
                              foregroundImage: NetworkImage(
                                  historiaSelect.author.profileImageUrl)),
                        ),
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(5, 10, 0.0),
                      //margin: EdgeInsets.only(top: 15, left: 5),
                      child: Text(
                        '${historiaSelect.author.userName} - ${historiaSelect.author.subscribers}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 13,
                            fontFamily: 'roboto, arial, sans-serife',
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    transform: Matrix4.translationValues(55, -10.0, 0.0),
                    margin: EdgeInsets.only(bottom: 0),
                    child: Text(
                      historiaSelect.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComents() {
    return Column(
      children: List.generate(
          historiaSelect.coments!.length,
          (index) =>
              ComentCard(selectedComent: historiaSelect.coments![index])),
    );
  }
}
