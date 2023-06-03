import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AddGente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Background(), _BodyForm()],
      ),
    );
  }
}

class _BodyForm extends StatelessWidget {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _deudaController = TextEditingController();

  String name = '';
  String phone = '';
  String deuda = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        CustomForm(
          label1: 'Nombre',
          textController: _nameController,
        ),
        CustomForm(
          label1: 'Numero de telefono',
          textController: _phoneController,
        ),
        CustomForm(
          label1: 'Deuda',
          textController: _deudaController,
        ),
        OutlinedButton(
            onPressed: () {
              name = _nameController.text;
              phone = _phoneController.text;
              deuda = _deudaController.text;
            },
            child: const Text('Guardar', style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
