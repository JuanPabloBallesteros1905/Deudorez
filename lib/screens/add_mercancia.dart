import 'package:deudoors/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class AddMercancia extends StatelessWidget {
  const AddMercancia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [const Background(), _BodyForm()],
    ));
  }
}

// ignore: must_be_immutable
class _BodyForm extends StatelessWidget {
  final _productController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _priceController = TextEditingController();

  String product = '';
  String cantidad = '';
  String price = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context);

    return Column(
      children: [
        const SizedBox(height: 70),
        CustomForm(
          label1: 'Producto',
          textController: _productController,
        ),
        CustomForm(
          label1: 'Cantidad',
          textController: _cantidadController,
        ),
        CustomForm(
          label1: 'Precio',
          textController: _priceController,
        ),
        OutlinedButton(
            onPressed: () {
              product = _productController.text;
              cantidad = _cantidadController.text;
              price = _priceController.text;

              provider
                  .addItems(product, cantidad, price)
                  .then((value) => Navigator.pop(context));
            },
            child: const Text('Guardar', style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
