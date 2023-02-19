import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled73/modules/bottom/bottom_pages/Favourite.dart';
import 'package:untitled73/modules/bottom/bottom_pages/account/account.dart';


import '../../shared/Bloc/Cubit/Bloc_Cubit.dart';
import '../../shared/Bloc/Cubit/States.dart';
import 'bottom_pages/homePage.dart';
import 'bottom_pages/vehicles/vehicles.dart';

class bottom extends StatefulWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<cubitBottom,bottomNavgator>(
            listener: (context , state){},
            builder: (context , state){
              return Scaffold(
                body:
                PageView(
                    controller: cubitBottom.get(context).y ,
                    physics : NeverScrollableScrollPhysics() ,
                    children: [
                      HomePage() ,
                      vehicles() ,
                      favourite() ,
                      account() ,
                    ]
                ),
                bottomNavigationBar:
                BottomNavigationBar(

                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  selectedLabelStyle : TextStyle(color:Colors.black) ,
                  unselectedLabelStyle : TextStyle(color: Colors.grey  ),


                  currentIndex:  cubitBottom.get(context).currentindex ,

                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  onTap: cubitBottom.get(context).ontap  ,
                  items: cubitBottom.get(context).Items,
                ),
              );
            }
        ) ;

  }
}
