import 'package:helloworld/models/carrera.dart';
import 'package:helloworld/screens/list_cursos.dart';
import 'package:helloworld/services/services.dart';
import 'package:flutter/material.dart';

class ListCarreras extends StatefulWidget {
 final int ide;

 ListCarreras({required this.ide});
  @override
  State<ListCarreras> createState() => _ListCarrerasState();
}

class _ListCarrerasState extends State<ListCarreras> {
  List<Carrera> carre = [];

  @override
  void initState(){
    _fetchCarreas();
    super.initState();
  }

  _fetchCarreas() async
  {
    // ignore: unused_local_variable
    var _isLoading = false;
    carre = await Servicios().getCarreras();
    if(carre != null)
    {
      setState(() {
        _isLoading = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text("Lista de Carreras")),
      body: ListView.separated(
        separatorBuilder: (_, __)  => Divider(height: 1, color: Colors.green),
        itemBuilder: (context, index) {
         return Dismissible(
          key: ValueKey(carre[index].nombre),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            
          },
           child: ListTile(
              title: Text(
                 carre[index].nombre.toString(),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                 ),
            subtitle: Text('Codigo: ${carre[index].idCarrera}'),
            onTap: () {
                Navigator.of(context)
               .push(MaterialPageRoute(builder: (_) => ListCurso
               (idc: carre[index].idCarrera, ide: widget.ide,)));
            },
                 ),
         );
      
        },
        itemCount: carre.length
      )

        
      );
  }
}