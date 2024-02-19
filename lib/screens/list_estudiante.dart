import 'package:helloworld/models/estudiante.dart';
// ignore: unused_import
import 'package:helloworld/screens/est_modify.dart';
import 'package:helloworld/screens/index.dart';
import 'package:helloworld/services/services.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import 'delete_est.dart';

class ListEst extends StatefulWidget {
  @override
  State<ListEst> createState() => _ListEstState();
}

class _ListEstState extends State<ListEst> {
  List<Estudiante> est = [];

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    // ignore: unused_local_variable
    var _isLoading = false;
    est = await Servicios().getEstudiantes();
    if (est != null) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lista de Registros")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Para decirle que me lleve a alguna pagina
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Index()));
          },
          child: Icon(Icons.cancel),
        ),
        body: ListView.separated(
            separatorBuilder: (_, __) =>
                Divider(height: 1, color: Colors.green),
            itemBuilder: (context, index) {
              return Dismissible(
                  key: ValueKey(est[index].idEstudiante),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {},

                  //Jonathan
                  //______________________________________________________________________________________________________________

            

          /*confirmDismiss: (direction) async {
            final result =  await showDialog(
              context: context,
              builder: (_) => EstDelete(),
             );

             if (result)
             {
             Servicios()..deleteEst(est[index].idEstudiante);
             } 
              print(result);
             return result;
          },*/
          confirmDismiss: (direction) async {
    final result = await showDialog(
    context: context,
    builder: (_) => EstDelete(),
  );

  if (result != null && result) { // Check if result is not null before using it
    Servicios().deleteEst(est[index].idEstudiante!); // Use the non-nullable version of idEstudiante
  }
  print(result);
  return result ?? false; // Return false if result is null
},
          background: Container(
            color: Colors.red,
            padding: EdgeInsets.only(left: 16),
            child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft,),
         
            


          ),
             
        
            
                  //_____________________________________________________________________________________________________

                  child: ListTile(
                    title: Text(
                      est[index].idEstudiante.toString(),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text('Nombre: ${est[index].nombre}'),
                    onTap: () {
                      //_______________________________________________________________________________________________________________
/*
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              Estupdate(cod: est[index].idEstudiante)));

                              
*/
                      //_________________________________________________________________________________________________________
                    },
                  ));
            },
            itemCount: est.length));
  }
}
