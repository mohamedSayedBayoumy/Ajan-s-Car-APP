import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'MyApp.dart';

late Database myfile ;
late Database myfil ;

late SharedPreferences zz;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  myfile = await openDatabase(
      'myfile.file' ,
      version: 1 ,
      onCreate: (file , version ){
        return file.execute('CREATE TABLE item (id INTEGER PRIMARY KEY , image VARCHAR(100) , Brand VARCHAR(50) , descraption VARCHAR(100) , model VARCHAR(15) , price VARCHAR(15));');
      }
  ) ;
  myfil = await openDatabase(
      'myfil.file' ,
      version: 1 ,
      onCreate: (file , version ){
        return file.execute(
            'CREATE TABLE search (id INTEGER PRIMARY KEY , image VARCHAR(100) , Brand VARCHAR(50) , descraption VARCHAR(100) , model VARCHAR(15) , price VARCHAR(15));');
      }
  ) ;
  runApp(MyApp()) ;
  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp() ;
}