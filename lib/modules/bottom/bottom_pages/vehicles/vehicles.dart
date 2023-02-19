import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled73/modules/bottom/bottom_pages/vehicles/tabbar_pages/BMW.dart';
import 'package:untitled73/modules/bottom/bottom_pages/vehicles/tabbar_pages/Jeep.dart';
import 'package:untitled73/modules/bottom/bottom_pages/vehicles/tabbar_pages/MG.dart';
import 'package:untitled73/modules/bottom/bottom_pages/vehicles/tabbar_pages/Mercedes.dart';


import '../../../../shared/Bloc/Cubit/Bloc_Cubit.dart';

class vehicles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
    List<Widget> ListOfTabBar = [
      Container(
          height: MediaQuery.of(context).size.height * .04,
          alignment: Alignment.center,
          child: Text(
            'Mercedes',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: 'Poppins'),
          )),
      Container(
          height: MediaQuery.of(context).size.height * .04,
          alignment: Alignment.center,
          child: Text(
            'BMW',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: 'Poppins'),
          )),
      Container(
          height: MediaQuery.of(context).size.height * .04,
          alignment: Alignment.center,
          child: Text(
            'MG',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: 'Poppins'),
          )),
      Container(
          height: MediaQuery.of(context).size.height * .04,
          alignment: Alignment.center,
          child: Text(
            'Jeep',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: 'Poppins'),
          )),
      Container(
          height: MediaQuery.of(context).size.height * .04,
          alignment: Alignment.center,
          child: Text(
            'Rang Rover',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: 'Poppins'),
          )),
    ];
    final bloc = BlocProvider.of<cubitBottom>(context);

    return DefaultTabController(
        length: ListOfTabBar.length,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Vehicles',
                style: TextStyle(fontFamily: 'poppins', color: Colors.white),
              ),
              backgroundColor: Colors.indigo.shade800,
            ),
            body: Column(children: [
              Container(
                child: TabBar(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .006),
                  indicatorWeight: 1,
                  indicatorColor: Colors.indigo.shade700,
                  isScrollable: true,
                  tabs: ListOfTabBar,
                ),
              ),
              Expanded(
                  flex: 1,
                  child:
                      TabBarView(physics: BouncingScrollPhysics(), children: [
                    Mercedes(),
                    BMW(),
                    MG(),
                    Jeep(),
                    MG(),
                  ]))
            ])));
  }
}
