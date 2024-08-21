
import 'package:app_movil_coffe/src/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsuarioScreen extends StatefulWidget {

  
  
  const UsuarioScreen({super.key});

  @override
  State<UsuarioScreen> createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  

  @override
  Widget build(BuildContext context) {

    final usuario = Provider.of<UserProvider>(context).user;

    return Scaffold(
        body: Card(
          child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const CircleAvatar(
              radius: 50,
              // backgroundImage: NetworkImage(usuario.foto.url),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Username'),
              subtitle: Text(usuario!.username),
            ),
            ListTile(
              title: const Text('Cédula'),
              subtitle: Text(usuario.cedula),
            ),
            ListTile(
              title: const Text('Nombre Completo'),
              subtitle: Text(usuario.nombreCompleto),
            ),
            ListTile(
              title: const Text('Teléfono'),
              subtitle: Text(usuario.telefono),
            ),
            ListTile(
              title: const Text('Dirección'),
              subtitle: Text(usuario.direccion),
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(usuario.email),
            ),
            ListTile(
              title: const Text('Estado'),
              subtitle: Text(usuario.estado ? 'Activo' : 'Inactivo'),
            ),
            ListTile(
              title: const Text('Tipo de Usuario'),
              subtitle: Text(usuario.tipoUsuario),
            ),
          ],
                ),
        ),
    );
  }
}
