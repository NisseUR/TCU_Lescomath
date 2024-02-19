import 'package:helloworld/models/grupo.dart';
import 'package:helloworld/screens/index.dart';
import 'package:helloworld/services/services.dart';
import 'package:flutter/material.dart';

import '../models/matricula.dart';

class ListGrupo extends StatefulWidget {
  final int idc;
 final int ide;

 final int idn;

  ListGrupo({required this.idc, required this.ide,  required this.idn});

  @override
  State<ListGrupo> createState() => _ListGrupoState();
}

class _ListGrupoState extends State<ListGrupo> {
    List<Grupo> grupo = [];
     @override
  void initState(){
    _fetchCarreas();
    super.initState();
  }

  _fetchCarreas() async
  {
    // ignore: unused_local_variable
    var _isLoading = false;
    grupo = await Servicios().getGrupo(widget.idn);
    if(grupo != null)
    {
      setState(() {
        _isLoading = true;
      });
    }
  
  }



  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Lista de grupos")),
      body: ListView.separated(
        separatorBuilder: (_, __)  => Divider(height: 1, color: Color.fromARGB(255, 175, 76, 76)),
        itemBuilder: (context, index) {
         return Dismissible(
          key: ValueKey(grupo[index].idGrupo.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            
          },
           child: ListTile(
              title: Text('Numero de Grupo: ${grupo[index].idGrupo.toString()}'
                ,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                 ),
            subtitle: Text('Nombre: ${grupo[index].nombre.toString()}'),
            onTap: () async {

                return showDialog(
                   context: context,
        barrierDismissible: false,
        builder: (builder) {
          return AlertDialog(
      title: Text('Advertencia'),
      content: Text('¿Está seguro que desea matricular en este grupo?'),
      actions: <Widget>[
        FloatingActionButton(
          child: Text('Yes'),
          onPressed: () async {
            final matricula = Matricula(
            idEstudiante: widget.ide,
            idCarrera: widget.idc,
            idCurso:  widget.idn,
            idGrupo: grupo[index].idGrupo
            

            );
             await Servicios().createUser(matricula);

                  
                      Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Index()));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Matricula Exitosa"),));


            
          },
        ),
        FloatingActionButton(
          child: Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
                }
                );


                 },
                 ),
         );
      
        },
        itemCount: grupo.length
      )

        
      );
  }
}