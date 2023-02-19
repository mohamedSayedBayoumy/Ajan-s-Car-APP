import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import '../../../shared/Bloc/Cubit/Bloc_Cubit.dart';
import '../../../shared/Bloc/Cubit/States.dart';
import '../../Pages/current_Item.dart';

class favourite extends StatefulWidget {


  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubitBottom(),
      child: BlocConsumer<cubitBottom,bottomNavgator>(
          listener: (context , state){},
          builder: (context , state){
            return
              Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false ,
        title: Text('Favourite'),
        backgroundColor: Colors.indigo.shade700 ,
      ),
      body : FutureBuilder(
        future: myfile.query('item'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData==false)
            return Text('No Data') ;
          else{
            return ListView.builder(
              itemCount: snapshot.data.length  ,
              itemBuilder: (context,index){
                return
                  GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>currentItem(
                      Brand: snapshot.data[index]['Brand'],
                      descraption: snapshot.data[index]['descraption'] ,
                      model: snapshot.data[index]['model'],
                      image:  snapshot.data[index]['photo'],
                      price: snapshot.data[index]['price'] ,
                    )));
                  },
                  child:
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Dismissible(
                            key: Key(UniqueKey().toString()),
                            onDismissed: (direction) {
                              setState(() {
                                cubitBottom.get(context).delete(Brand: snapshot.data[index]['Brand']);
                              });
                            },
                            child: Container(
                                width: 400, height: 164,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 100, height: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          image: DecorationImage(image: NetworkImage(snapshot.data[index]['image']))
                                        ),

                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(height: 39,) ,
                                        Row(
                                          children: [
                                            Container(child: Text(snapshot.data[index]["Brand"], style: TextStyle(fontWeight: FontWeight.bold),)),

                                          ],
                                        ),
                                        Container(
                                          // color: Colors.black,
                                            width: 230,
                                            child: Text(
                                              snapshot.data[index]["descraption"],
                                              maxLines: 5,
                                              overflow: TextOverflow
                                                  .fade,)),
                                      ],
                                    ),
                                  ],
                                )
                            ),
                          ),
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),

                ) ;
              },
            );
          }
        },
      ),
    );
        }
        ),
    );
  }
}

