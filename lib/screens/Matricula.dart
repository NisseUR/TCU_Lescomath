import 'package:helloworld/screens/index.dart';
import 'package:helloworld/screens/list_carreras.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Matricula extends StatefulWidget {

  @override
  State<Matricula> createState() => _MatriculaState();
}

class _MatriculaState extends State<Matricula> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          key: _formkey,
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [  
             
             TextFormField(
                controller: id,
                decoration: InputDecoration(
                  labelText: "Identificacion",
                  border: OutlineInputBorder() ),
                ),

             SizedBox(height: 20,),
             ElevatedButton(
               child: Text('Listo', style: TextStyle(color: Color.fromRGBO(34, 34, 34, 1))),
              onPressed: ()
              {
                // ignore: unrelated_type_equality_checks
                if(id.text.isEmpty)       
                {
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Debe ingresar una identificacion"),));


                }        
                else {
               inicio(int.parse(id.text));

                }
              }
             ),
             SizedBox(height: 20,),
             ElevatedButton(
               child: Text('Cancelar', style: TextStyle(color: Color.fromRGBO(34, 34, 34, 1))),
              onPressed: ()
              {
               Navigator.of(context)
               
                  .push(MaterialPageRoute(builder: (_) => Index()));
              }
             ),


            ],
            ))),
      )  );
  }


   Future<void> inicio(int id) async{ 
     var response = await http.post(Uri.parse("http://pruebaday.somee.com/api/CompararID?id=$id"));
     if(id != null )
     {
       if(response.statusCode == 200) 
     {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListCarreras(ide: id,) ));
     }else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Este usuario no se encuentra registrado"),));
     }

    }else{           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error"),));

    }


     }
}