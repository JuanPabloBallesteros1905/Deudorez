import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deudoors/widgets/widgets.dart';
import 'package:deudoors/provider/database_provider.dart';

class GenteDebe extends StatelessWidget {
  const GenteDebe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final databaseProvider = Provider.of<DatabaseProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _DeuBody(
            data: databaseProvider.deuData,
          )
        ],
      ),
    );
  }
}

class _DeuBody extends StatelessWidget {
  const _DeuBody({super.key, required this.data});
  final List data;

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? const Empty()
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final data2 = data[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Card(
                    color: const Color.fromRGBO(231, 231, 224, 0.7),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            '${data2['name']}',
                          ),
                          subtitle: Text('${data2['phone']}'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Deuda'),
                              const SizedBox(height: 10),
                              Text('${data2['price']}'),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    'editPago',
                                    arguments: {
                                      "id": data2['id'],
                                      "name": data2['name'],
                                      "phone": data2['phone'],
                                      "price": data2['price']
                                    },
                                  );
                                },
                                child: const Icon(Icons.add)),
                            TextButton(
                                onPressed: () {},
                                child: const Icon(Icons.delete)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'editDataDeuda',
                                      arguments: {
                                        "id": data2['id'],
                                        "name": data2['name'],
                                        "phone": data2['phone'],
                                        "price": data2['price']
                                      });
                                },
                                child: const Icon(Icons.mode_edit))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
