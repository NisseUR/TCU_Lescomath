// ignore_for_file: camel_case_types

import 'package:helloworld/screens/Matricula.dart';
import 'package:flutter/material.dart';

import 'Registrase.dart';

class Index extends StatefulWidget {

  @override
  State<Index> createState() => _IndexState();
}


class _IndexState extends State<Index> {
   @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [  
             SizedBox(height: 20,),
             ElevatedButton(
               child: Text('Matricular', style: TextStyle(color: Color.fromRGBO(34, 34, 34, 1))),
              onPressed: ()
              {
                 Navigator.push(context , MaterialPageRoute(builder: (context) => Matricula() ));
              }
             ),

             SizedBox(height: 20,),
             ElevatedButton(
               child: Text('Registrarse', style: TextStyle(color: Color.fromRGBO(34, 34, 34, 1))),
              onPressed: ()
              {
                Navigator.push(context
                , MaterialPageRoute(builder: (context) => registro() ));
              }
             ),


            ],
            ))),
      )  );
  }
  }
