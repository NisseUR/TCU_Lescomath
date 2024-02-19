import 'dart:convert';

Carrera carreraFromJson(String str) => Carrera.fromJson(json.decode(str));

String carreraToJson(Carrera data) => json.encode(data.toJson());

/*class Carrera {
    Carrera({
        this.idCarrera,
        this.nombre,
    });

    int idCarrera;
    String nombre;

    factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
        idCarrera: json["IdCarrera"],
        nombre: json["Nombre"],
    );

    Map<String, dynamic> toJson() => {
        "IdCarrera": idCarrera,
        "Nombre": nombre,
    };
}
*/
class Carrera {
    Carrera({
        required this.idCarrera,
        this.nombre,
    });

    int idCarrera;
    String? nombre;

    factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
        idCarrera: json["IdCarrera"],
        nombre: json["Nombre"],
    );

    Map<String, dynamic> toJson() => {
        "IdCarrera": idCarrera,
        "Nombre": nombre,
    };
}