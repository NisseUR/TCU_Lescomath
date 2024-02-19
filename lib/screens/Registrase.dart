// ignore_for_file: unused_local_variable, camel_case_types

import 'package:helloworld/models/estudiante.dart';
import 'package:helloworld/screens/index.dart';
// ignore: unused_import
import 'package:helloworld/screens/list_estudiante.dart';
import 'package:helloworld/services/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class registro extends StatefulWidget {

  @override
  State<registro> createState() => _registroState();
}


class _registroState extends State<registro> {

  TextEditingController idController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController ape1Controller = TextEditingController();
  TextEditingController ape2Controller = TextEditingController();


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
                TextField(
                  controller: idController,
                  decoration: const InputDecoration( // Add 'const' here
                    labelText: "Identificación",
                    border: OutlineInputBorder()),
                ),
                SizedBox(height: 20,),

                TextField(
                  controller: nomController,
                  decoration: const InputDecoration( // Add 'const' here
                    labelText: "Nombre",
                    border: OutlineInputBorder()),
                ),

                 SizedBox(height: 20,),

                TextField(
                  controller: ape1Controller,
                  decoration: const InputDecoration( // Add 'const' here
                    labelText: "Primer apellido",
                    border: OutlineInputBorder()),
                ),
                 SizedBox(height: 20,),

                TextField(
                  controller: ape2Controller,
                  decoration: const InputDecoration( // Add 'const' here
                    labelText: "Segundo apellido",
                    border: OutlineInputBorder()),
                ),


                SizedBox(height: 20,),
             ElevatedButton(
               child: Text('Registrarse', style: TextStyle(color: Color.fromRGBO(34, 34, 34, 1))),
              onPressed: () async
              {
                if(idController.text.isNotEmpty && nomController.text.isNotEmpty && ape1Controller.text.isNotEmpty && ape2Controller.text.isNotEmpty)
                {
                   final int id = int.parse(idController.text);

                  var res = await http.post(Uri.parse("http://pruebaday.somee.com/api/CompararID?id=$id"));
                  if(res.statusCode == 200)
                  {

                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Este registro ya existe"),));

                  }else 
                  {
                    final est = Estudiante(
                idEstudiante: int.parse(idController.text),
                nombre: nomController.text,
                ape1: ape1Controller.text,
                ape2: ape2Controller.text,
       
               );
                
                await Servicios().createEst(est);
                  
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Index() ));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registro exitoso"),));
          

                  }


                
                }
                
                  
                else 
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No debe dejar espacios en blanco"),));
              }
              }
             ),


               //Kendall 
            //_________________________________________________________________________________________________

            
            
             SizedBox(height: 20,),
             ElevatedButton(
               child: Text('Modificar', style: TextStyle(color: Color.fromRGBO(34, 34, 34, 1))),
              onPressed: ()
              {
               Navigator.of(context)
               
                  .push(MaterialPageRoute(builder: (_) => ListEst()));
              }
             ),

             

             //___________________________________________________________________________________________________

            
             

              SizedBox(height: 20,),
             ElevatedButton(
               child: Text('Cancelar', style: TextStyle(color: Color.fromRGBO(34, 34, 34, 1))),
              onPressed: ()
              {
                 Navigator.push(context
                 , MaterialPageRoute(builder: (context) => Index() ));
              }
             ),




              ],
            ),
          ),
        ),
       ),
    );
  }
}