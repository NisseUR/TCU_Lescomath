// To parse this JSON data, do
//
//     final curso = cursoFromJson(jsonString);

import 'dart:convert';

Curso cursoFromJson(String str) => Curso.fromJson(json.decode(str));

String cursoToJson(Curso data) => json.encode(data.toJson());

class Curso {
    Curso({
        required this.idCurso,
        this.nombre,
        required this.idCarrera,
    });

    int idCurso;
    String? nombre;
    int idCarrera;

    factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        idCurso: json["IdCurso"],
        nombre: json["Nombre"],
        idCarrera: json["IdCarrera"],
    );

    Map<String, dynamic> toJson() => {
        "IdCurso": idCurso,
        "Nombre": nombre,
        "IdCarrera": idCarrera,
    };
}

