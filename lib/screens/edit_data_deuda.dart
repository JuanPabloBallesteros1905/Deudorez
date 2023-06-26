import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deudoors/widgets/backg.dart';
import 'package:deudoors/widgets/custom_form.dart';
import 'package:deudoors/provider/database_provider.dart';

class EditDataDueda extends StatelessWidget {
  const EditDataDueda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [Background(), const BodyEdit()],
    ));
  }
}

class BodyEdit extends StatelessWidget {
  const BodyEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context);
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    final name = TextEditingController();
    name.text = arguments['name'];
    final phone = TextEditingController();
    phone.text = arguments['phone'];
    final price = TextEditingController();
    price.text = arguments['price'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
      child: Column(
        children: [
          CustomForm(label1: 'Nombre', textController: name),
          CustomForm(label1: 'Numero de telefono', textController: phone),
          CustomForm(label1: 'Cantidad', textController: price),
          OutlinedButton(
              onPressed: () {
                provider
                    .changeUserData(
                        arguments['id'], name.text, phone.text, price.text)
                    .then((value) => Navigator.pop(context));
              },
              child: const Text('Guardar'))
        ],
      ),
    );
  }
}
