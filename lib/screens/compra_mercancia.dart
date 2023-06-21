import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deudoors/widgets/widgets.dart';
import 'package:deudoors/provider/database_provider.dart';

class CompraMercancia extends StatelessWidget {
  const CompraMercancia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _CompraBody(
            data: provider.cm,
          )
        ],
      ),
    );
  }
}

class _CompraBody extends StatelessWidget {
  final List data;

  const _CompraBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final data2 = data[index];
        return Card(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '${data2['product']}',
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Text('precio venta'),
                      Text('${data2['price']}'),
                      const SizedBox(height: 15),
                      const Text('Precio compra'),
                      Text('${data2['purchase price']}')
                    ]),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Cantidad disponible'),
                    Text('${data2['amount']}'),
                  ],
                ),
              ),
              TextButton(onPressed: () {}, child: Text('Editar producto'))
            ],
          ),
        );
      },
    );
  }
}
