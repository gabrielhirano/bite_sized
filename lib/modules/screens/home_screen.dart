

import 'package:bite_sized/constants/api_path.dart';
import 'package:bite_sized/persistents/LoggedUser.dart';
import 'package:flutter/material.dart';
import 'package:bite_sized/widgets/custom_sliver_app_bar.dart';

import '../../widgets/history_card.dart';
import '../models/History.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<History> historias = [];


  Future getHistorys() async{

    LoggedUser.setUser(currentUser);
    //var responseData = jsonDecode(ApiPath.historias);

    print('------------------================');
    var responseData = ApiPath.historias;

    print(responseData);

        
    responseData.forEach((historia) {
        History newHistoria = History.fromJson(historia);
        historias.add(newHistoria);
    });

    print('=======================');
    print(historias);
  }

  @override
  void initState() {
    
    getHistorys();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            print(index);
            if(index < historias.length) {
              final history = historias[index];
              return HistoryCard(historia: history);
            }
          }))
        ],
      ),
    );;
  }
}