import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prova/view/cadastro_view.dart';
import 'package:flutter_prova/view/criarCompras_view.dart';
import 'package:flutter_prova/view/login_view.dart';
import 'package:flutter_prova/view/principal_view.dart';
import 'package:flutter_prova/view/sobre.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inicio',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginView(),
        'principal': (context) => PrincipalView(),
        'cadastro': (context) => CadastroView(),
        'sobre': (context) => Sobre(),
        'criarLista': (context) => CriarComprasView(addCompras: (String ) {  },),
      },
    );
  }
}

