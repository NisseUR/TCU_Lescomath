
import 'package:helloworld/models/estudiante.dart';
import 'package:helloworld/screens/list_estudiante.dart';
import 'package:helloworld/services/services.dart';
import 'package:flutter/material.dart';

class Estupdate extends StatefulWidget {
  final int cod;
  Estupdate({required this.cod});

  @override
  State<Estupdate> createState() => _EstupdateState();
}


/*class _EstupdateState extends State<Estupdate> {
    bool get isEditing => widget.cod != null;
    Estudiante est;

  TextEditingController idController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController ape1Controller = TextEditingController();
  TextEditingController ape2Controller = TextEditingController();

   @override
  void initState() {
    _fetchModify();

    super.initState();
  }

  _fetchModify() async {
    // ignore: unused_local_variable
    var _isLoading = false;
    if (isEditing) {
      est = await Servicios().getEstById(widget.cod);

      if (est != null) {
        _isLoading = true;
        nomController.text = est.nombre;
        ape1Controller.text = est.ape1;
        ape2Controller.text = est.ape2;
      }
    }
  }
*/

class _EstupdateState extends State<Estupdate> {
  bool get isEditing => widget.cod != null;
  late Estudiante est;

  TextEditingController idController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController ape1Controller = TextEditingController();
  TextEditingController ape2Controller = TextEditingController();

  @override
  void initState() {
    _fetchModify();
    super.initState();
  }

  _fetchModify() async {
    var _isLoading = false;
    if (isEditing) {
      est = await Servicios().getEstById(widget.cod);

      if (est != null) {
        _isLoading = true;
        nomController.text = est.nombre ?? ''; // Providing default value if nombre is null
        ape1Controller.text = est.ape1 ?? ''; // Providing default value if ape1 is null
        ape2Controller.text = est.ape2 ?? ''; // Providing default value if ape2 is null
      }
    }
  }


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
                  controller: nomController,
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder()),
                ),

                 SizedBox(height: 20,),

                TextField(
                  controller: ape1Controller,
                  decoration: InputDecoration(
                    labelText: "Primer apellido",
                    border: OutlineInputBorder()),
                ),
                 SizedBox(height: 20,),

                TextField(
                  controller: ape2Controller,
                  decoration: InputDecoration(
                    labelText: "Segundo apellido",
                    border: OutlineInputBorder()),
                ),

          
                SizedBox(height: 20,),
             ElevatedButton(
               child: Text('Modificar', style: TextStyle(color: Colors.white)),
              onPressed: () async
              {
                if(nomController.text.isNotEmpty && ape1Controller.text.isNotEmpty && ape2Controller.text.isNotEmpty)
                {
                   
                    final est = Estudiante(
                idEstudiante: widget.cod,
                nombre: nomController.text,
                ape1: ape1Controller.text,
                ape2: ape2Controller.text
       
               );
                
                await Servicios().updateEst(widget.cod, est);
                  
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ListEst() ));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Modificacion exitoso"),));
          

                  }  
                  
                else 
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No debe dejar espacios en blanco"),));
              }
              }
             ),

            

              SizedBox(height: 20,),
             ElevatedButton(
               child: Text('Cancelar', style: TextStyle(color: Colors.white)),
              onPressed: ()
              {
                 Navigator.push(context
                 , MaterialPageRoute(builder: (context) => ListEst() ));
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