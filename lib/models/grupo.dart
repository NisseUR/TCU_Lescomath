// To parse this JSON data, do
//
//     final grupo = grupoFromJson(jsonString);

import 'dart:convert';

Grupo grupoFromJson(String str) => Grupo.fromJson(json.decode(str));

String grupoToJson(Grupo data) => json.encode(data.toJson());

class Grupo {
    Grupo({
        required this.idGrupo,
        this.nombre,
        required this.idCurso,
    });

    int idGrupo;
    String? nombre;
    int idCurso;

    factory Grupo.fromJson(Map<String, dynamic> json) => Grupo(
        idGrupo: json["IdGrupo"],
        nombre: json["Nombre"],
        idCurso: json["IdCurso"],
    );

    Map<String, dynamic> toJson() => {
        "IdGrupo": idGrupo,
        "Nombre": nombre,
        "IdCurso": idCurso,
    };
}
