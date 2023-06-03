import 'package:deudoors/provider/database_provider.dart';
import 'package:deudoors/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mercancia extends StatelessWidget {
  const Mercancia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerDatabase = Provider.of<DatabaseProvider>(context);

    return Scaffold(
        body: Stack(
      children: [
        Background(),
        MercanciaBody(
          mD: providerDatabase.md,
        )
      ],
    ));
  }
}

class MercanciaBody extends StatelessWidget {
  final List mD;

  const MercanciaBody({super.key, required this.mD});

  @override
  Widget build(BuildContext context) {
    return mD.length == 0
        ? const Empty()
        : SafeArea(
            child: ListView.builder(
              itemCount: mD.length,
              itemBuilder: (BuildContext context, int index) {
                final mdd = mD[index];
                return Card(
                  child: ListTile(
                    title: Text('${mdd['product']}'),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Cantidad disponible:'),
                        Text('${mdd['amount']}'),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Valor venta'),
                        Text('${mdd['price']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
