import 'package:helloworld/models/curso.dart';
import 'package:helloworld/screens/list_grupo.dart';
import 'package:helloworld/services/services.dart';
import 'package:flutter/material.dart';

class ListCurso extends StatefulWidget {
  final int idc;
  final int ide;
  ListCurso({required this.idc, required this.ide});

  @override
  State<ListCurso> createState() => _ListCursoState();
}

class _ListCursoState extends State<ListCurso> {
  List<Curso> curso = [];
  @override
  void initState() {
    _fetchCarreas();
    super.initState();
  }

  _fetchCarreas() async {
    // ignore: unused_local_variable
    var _isLoading = false;
    curso = await Servicios().getCurso(widget.idc);
    if (curso != null) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lista de cursos")),
        body: ListView.separated(
            separatorBuilder: (_, __) =>
                Divider(height: 1, color: Colors.green),
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(curso[index].nombre.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {},
                child: ListTile(
                  title: Text(
                    'Curso: ${curso[index].nombre.toString()}',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text('Codigo: ${curso[index].idCurso}'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ListGrupo(
                              idn: curso[index].idCurso,
                              ide: widget.ide,
                              idc: widget.idc,
                            )));
                  },
                ),
              );
            },
            itemCount: curso.length));
  }
}
