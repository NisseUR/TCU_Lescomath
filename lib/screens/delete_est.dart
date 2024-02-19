import 'package:flutter/material.dart';

class EstDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Advertencia'),
      content: Text('¿Está seguro que desea borrar este registro?'),
      actions: <Widget>[
        FloatingActionButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
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
}