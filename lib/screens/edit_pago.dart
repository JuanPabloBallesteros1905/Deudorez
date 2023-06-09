import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deudoors/widgets/backg.dart';
import 'package:deudoors/widgets/custom_form.dart';
import 'package:deudoors/provider/database_provider.dart';

class AddPago extends StatelessWidget {
  const AddPago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [const Background(), _Body()],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context);
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    final text = TextEditingController();

 
    String pago() {
      final deuda = double.parse(arguments['price']);
      final pago = double.parse(text.text);

      final result = deuda - pago;

      final data = result.toStringAsFixed(3); 
   
      return data;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: CustomForm(label1: 'Pago/Abono', textController: text),
        ),
        OutlinedButton(
          onPressed: () {
            provider
                .updatepago(arguments['id'], arguments['name'],
                    arguments['phone'], pago())
                .then(
                  (value) => Navigator.pop(context),
                );
          },
          child: const Text('Guardar'),
        ),
        TextButton(
            onPressed: () {
              pago();
            },
            child: const Text('Pruebas'))
      ],
    );
  }
}
