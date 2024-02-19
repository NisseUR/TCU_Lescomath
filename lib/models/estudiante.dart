// To parse this JSON data, do
//
//     final estudiante = estudianteFromJson(jsonString);

import 'dart:convert';

Estudiante estudianteFromJson(String str) => Estudiante.fromJson(json.decode(str));

String estudianteToJson(Estudiante data) => json.encode(data.toJson());

class Estudiante {
    /*Estudiante({
        required this.idEstudiante,
        this.nombre,
        this.ape1,
        this.ape2,
    });
*/
    int? idEstudiante;
    String? nombre;
    String? ape1;
    String? ape2;
    Estudiante({this.idEstudiante, this.nombre, this.ape1, this.ape2});

    factory Estudiante.fromJson(Map<String, dynamic> json) => Estudiante(
        idEstudiante: json["IdEstudiante"],
        nombre: json["Nombre"],
        ape1: json["Ape1"],
        ape2: json["Ape2"],
    );

    Map<String, dynamic> toJson() => {
        "IdEstudiante": idEstudiante,
        "Nombre": nombre,
        "Ape1": ape1,
        "Ape2": ape2,
    };
}
