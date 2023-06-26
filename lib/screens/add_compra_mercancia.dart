import 'package:deudoors/provider/database_provider.dart';
import 'package:deudoors/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCompraMercancias extends StatelessWidget {
  const AddCompraMercancias({Key? key}) : super(key: key);

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
  final _placeController = TextEditingController();
  final _priceController = TextEditingController();
  final _priceSaleController = TextEditingController();

  String product = '';
  String cantidad = '';
  String place = '';
  String priceCompra = '';
  String priceVenta = '';

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
          label1: 'Lugar de compra',
          textController: _placeController,
        ),
        CustomForm(
          label1: 'Precio Compra',
          textController: _priceController,
        ),
        CustomForm(
          label1: 'Posible precio Venta',
          textController: _priceSaleController,
        ),
        OutlinedButton(
          onPressed: () {
            product = _productController.text;
            cantidad = _cantidadController.text;
            place = _placeController.text;
            priceCompra = _priceController.text;
            priceVenta = _priceSaleController.text;

            provider.addcm(product, cantidad, place, priceCompra, priceVenta).then((value) => Navigator.pop(context));


          },
          child: const Text(
            'Guardar',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
