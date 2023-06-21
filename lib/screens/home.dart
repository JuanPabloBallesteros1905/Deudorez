import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Background(), BodyApp()],
      ),
    );
  }
}

class BodyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: SafeArea(
        child: Table(
          children: const [
            TableRow(
              children: [
                _SingleTable(
                  text: 'Clientes',
                  route: 'deuda',
                  routeAdd: 'addDeuda',
                ),
              ],
            ),
            TableRow(children: [
              _SingleTable(
                text: 'Mercancia Disponible',
                route: 'mercanciaDisponible',
                routeAdd: 'addMercancia',
              ),
            ]),
            TableRow(children: [
              _SingleTable(
                text: 'Compra de mercancias',
                route: 'compraMercancia',
                routeAdd: 'addCompraMercancia',
              )
            ])
          ],
        ),
      ),
    );
  }
}

class _SingleTable extends StatelessWidget {
  final String text;
  final String route;
  final String routeAdd;

  const _SingleTable(
      {super.key,
      required this.text,
      required this.route,
      required this.routeAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(51, 51, 51, 0.5),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontFamily: 'popins'),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, route);
                },
                child: const Text('Ver Todo'),
              ),
              TextButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, routeAdd);
                },
                child: const Text('Agregar'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
