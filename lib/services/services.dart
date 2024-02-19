import 'dart:convert';

import 'package:helloworld/models/carrera.dart';
import 'package:helloworld/models/curso.dart';
import 'package:helloworld/models/estudiante.dart';
import 'package:helloworld/models/grupo.dart';
import 'package:helloworld/models/matricula.dart';
import 'package:http/http.dart' as http;

class Servicios
{
  final String apiurl = "http://pruebaday.somee.com/api/Estudiantes";

  Future<void> createUser(Matricula matricula) async {
    Map data = {

      'IdEstudiante': matricula.idEstudiante,
      'IdCarrera': matricula.idCarrera,
      'IdCurso': matricula.idCurso,
      'IdGrupo': matricula.idGrupo
 
    };

   final response =  await http.post(Uri.parse("http://pruebaday.somee.com/api/Matriculas"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
    print("Matricula realizada");

    } else {
    print('Failed to post matricula');
    }
  }


  // ignore: missing_return
  Future<List<Grupo>> getGrupo(int id) async {
  var res = await http.get(Uri.parse("http://pruebaday.somee.com/api/Grupo/Grupo_Curso?curso=$id"));

  if (res.statusCode == 200) {
    List<dynamic> body = json.decode(res.body);
    List<Grupo> grupo = body.map((dynamic item) => Grupo.fromJson(item)).toList();
    return grupo;
  } else {
    print("Error");
    return []; // Return an empty list if there's an error
    // or throw an exception: throw Exception('Failed to load grupo list');
  }
}

  // ignore: missing_return
  Future<List<Curso>> getCurso(int id) async {

     
    var res = await http.get(Uri.parse("http://pruebaday.somee.com/api/Curso/Curso_Carrera?id=$id"));

    if (res.statusCode == 200) {
      List<dynamic> body = json.decode(res.body);
      List<Curso> cur = body.map((dynamic item) => Curso.fromJson(item)).toList();
      return cur;
    } 
    
    else {
      
      print("Failed to load cases list");
      return [];
    }
  }


  // ignore: missing_return
  Future<List<Carrera>> getCarreras() async {

     
    var res = await http.get(Uri.parse("http://pruebaday.somee.com/api/Carreras/General"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Carrera> prod = body.map((dynamic item) => Carrera.fromJson(item)).toList();
      return prod;
    } else {
       print("Failed to load cases list");
       return [];
    }
  }

   


   // ignore: missing_return
   Future<List<Estudiante>> getEstudiantes() async {

     
    var res = await http.get(Uri.parse("http://pruebaday.somee.com/api/Estudiante/General"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Estudiante> est = body.map((dynamic item) => Estudiante.fromJson(item)).toList();
      return est;
    } else {
       print("Failed to load cases list");
       return [];
    }
  }

  Future<void> deleteEst(int id) async {
    final res = await http.delete(Uri.parse('http://pruebaday.somee.com/api/Estudiantes/$id'));

    if (res.statusCode == 200) {
      print(" Registro borrado");
    } else {
      print("Fallo al borrar el registro");
    }
  }

 // ignore: missing_return
 Future<void> updateEst(int id, Estudiante estudiante) async {
    Map data = {

      'IdEstudiante': estudiante.idEstudiante,
      'Nombre': estudiante.nombre,
      'Ape1': estudiante.ape1,
      'Ape2': estudiante.ape2
    };

     await http.put(Uri.parse('http://pruebaday.somee.com/api/Estudiantes/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
   
  }

  // ignore: missing_return
  Future<Estudiante> getEstById(int cod) async {
  var response = await http.get(Uri.parse('http://pruebaday.somee.com/api/Estudiantes/$cod'));

  if (response.statusCode == 200) {
    final jsonresponse = json.decode(response.body);
    return Estudiante.fromJson(jsonresponse);
  } else {
    print('Failed to load a case');
    throw Exception('Failed to load a case'); // Throw an exception to indicate failure
  }
}




  Future<Estudiante> createEst(Estudiante estudiante) async {
    Map data = {

      'IdEstudiante': estudiante.idEstudiante,
      'Nombre': estudiante.nombre,
      'Ape1': estudiante.ape1,
      'Ape2': estudiante.ape2
    };

    var response = await http.post(Uri.parse(apiurl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
       final jsonresponse = json.decode(response.body);
     

      return  Estudiante.fromJson(jsonresponse);


    } else {
      throw Exception('Failed to post estudiante');
    }
  }

  Future<String> inicio(int id) async
  {
    var response = await http.post(Uri.parse("http://pruebaday.somee.com/api/CompararID?id=$id"));
    if(response.statusCode == 200)
    {
      return "Yes";
   
    }
    else 
     return "No";
  }


}