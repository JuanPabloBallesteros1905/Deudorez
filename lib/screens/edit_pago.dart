import 'package:deudoors/provider/database_provider.dart';
import 'package:deudoors/widgets/backg.dart';
import 'package:deudoors/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPago extends StatelessWidget {
  const EditPago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Background(), _Body()],
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

    text.text = arguments['price'];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: CustomForm(label1: 'Pago/Abono', textController: text),
        ),
        OutlinedButton(
          onPressed: () async {
            await provider
                .updatepago(arguments['id'], arguments['phone'], arguments['name'], text.text)
                .then((value) => Navigator.pop(context));
          },
          child: const Text('Guardar'),
        )
      ],
    );
  }
}
