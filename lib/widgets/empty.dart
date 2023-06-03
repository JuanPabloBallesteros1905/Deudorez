import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay registros por el momento',style: TextStyle(color: Colors.amber),),
    );
  }
}
