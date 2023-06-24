import 'package:deudoors/provider/database_provider.dart';
 
 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
    
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'deuda': (_) => const GenteDebe(),
        'mercanciaDisponible': (_) => const Mercancia(),
        'compraMercancia': (_) => const CompraMercancia(),
        'addDeuda': (_) => AddGente(),
        'addMercancia': (_) => const AddMercancia(),
        'addCompraMercancia': (_) => const AddCompraMercancias(),
        'editPago': (context) => const AddPago(),
        'editDataDeuda':(context) => const EditDataDueda()
      },
    );
  }
}
