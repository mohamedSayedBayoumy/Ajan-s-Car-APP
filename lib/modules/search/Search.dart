// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled73/shared/Bloc/Cubit/Bloc_Cubit.dart';
import '../../main.dart';
import '../Pages/current_Item.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  String name = "";

  @override
  Widget build(BuildContext context) {

    return   Builder(builder: (context1) {
      final bloc = BlocProvider.of<cubitBottom>(context);
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.indigo,
              bottom:
              PreferredSize(child: Container(), preferredSize: Size(0, 8)),
              title: Card(
                child: Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(primary: Colors.black)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search...'),
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                  ),
                ),
              )),
          body:
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('all').snapshots(),
              builder: (context, snapshots) {
                if (name.isEmpty) {
                  return Container(
                    width: 500,
                    height: 500,
                    child: FutureBuilder(
                      future: myfil.query('search'),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false)
                          return Text('No Data');
                        else {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => currentItem(
                                        Brand: snapshot.data[index]
                                        ['Brand'],
                                        descraption: snapshot.data[index]
                                        ['descraption'],
                                        model: snapshot.data[index]
                                        ['model'],
                                        image: snapshot.data[index]
                                        ['image'],
                                        price: snapshot.data[index]
                                        ['price'],
                                      )));
                                },
                                child: ListTile(
                                  title: Text(
                                    snapshot.data[index]['Brand'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    snapshot.data[index]['descraption'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: CircleAvatar(
                                    // backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        snapshot.data[index]['image']),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshots.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;
                        dynamic title = data['Brand'];
                        dynamic des = data['descraption'];
                        dynamic photo = data['photo'];
                        dynamic model = data['model'];
                        dynamic price = data['price'];
                        if (name.isEmpty) {
                          return Container();
                        }
                        print(title
                            .toString()
                            .toLowerCase()
                            .startsWith(name.toLowerCase()));
                        if (title
                            .toString()
                            .toLowerCase()
                            .startsWith(name.toLowerCase())) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                  builder: (context) => currentItem(
                                    Brand: title,
                                    descraption: des,
                                    model: model,
                                    image: data['photo'],
                                    price: price,
                                  )))
                                  .then((value) {
                                bloc.sqlite(
                                    image: data['photo'],
                                    Brand: data['Brand'],
                                    descraption: data['descraption'],
                                    model: data['model'],
                                    price: data['price']);
                              });
                            },
                            child: ListTile(
                              title: Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                des,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(photo),
                              ),
                            ),
                          );
                        }
                        return Container();
                      });
                }
              }));
    } );
  }
}
