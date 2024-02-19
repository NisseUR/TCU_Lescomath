// To parse this JSON data, do
//
//     final matricula = matriculaFromJson(jsonString);

import 'dart:convert';

Matricula matriculaFromJson(String str) => Matricula.fromJson(json.decode(str));

String matriculaToJson(Matricula data) => json.encode(data.toJson());

class Matricula {
    Matricula({
        required this.idEstudiante,
        required this.idCarrera,
        required this.idCurso,
        required this.idGrupo,
    });

    int idEstudiante;
    int idCarrera;
    int idCurso;
    int idGrupo;

    factory Matricula.fromJson(Map<String, dynamic> json) => Matricula(
        idEstudiante: json["IdEstudiante"],
        idCarrera: json["IdCarrera"],
        idCurso: json["IdCurso"],
        idGrupo: json["IdGrupo"],
    );

    Map<String, dynamic> toJson() => {
        "IdEstudiante": idEstudiante,
        "IdCarrera": idCarrera,
        "IdCurso": idCurso,
        "IdGrupo": idGrupo,
    };
}
