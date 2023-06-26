import 'package:deudoors/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class AddGente extends StatelessWidget {
  const AddGente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [const Background(), _BodyFormClientes()],
      ),
    );
  }
}



// ignore: must_be_immutable
class _BodyFormClientes extends StatelessWidget {

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _deudaController = TextEditingController();

  String name = '';
  String phone = '';
  String deuda = '';

  @override
  Widget build(BuildContext context) {
    final dbp = Provider.of<DatabaseProvider>(context);

    return SingleChildScrollView(
      child: Column(
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
              onPressed: () async{
                name = _nameController.text;
                phone = _phoneController.text;
                deuda = _deudaController.text;
    
                await dbp
                    .addClients(name, phone, deuda)
                    .then((value) => Navigator.pop(context));
              },
              child: const Text('Guardar', style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
