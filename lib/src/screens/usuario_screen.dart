// import 'package:flutter/material.dart';

// class SeguimientoScreen extends StatefulWidget {
//   const SeguimientoScreen({super.key});

//   @override
//   State<SeguimientoScreen> createState() => _SeguimientoScreenState();
// 

// class _SeguimientoScreenState extends State<SeguimientoScreen> {
//   final Usuario usuario;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Card(
//           child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(usuario.fotoUrl),
//             ),
//             SizedBox(height: 20),
//             ListTile(
//               title: Text('Username'),
//               subtitle: Text(usuario.username),
//             ),
//             ListTile(
//               title: Text('Cédula'),
//               subtitle: Text(usuario.cedula),
//             ),
//             ListTile(
//               title: Text('Nombre Completo'),
//               subtitle: Text(usuario.nombreCompleto),
//             ),
//             ListTile(
//               title: Text('Teléfono'),
//               subtitle: Text(usuario.telefono),
//             ),
//             ListTile(
//               title: Text('Dirección'),
//               subtitle: Text(usuario.direccion),
//             ),
//             ListTile(
//               title: Text('Email'),
//               subtitle: Text(usuario.email),
//             ),
//             ListTile(
//               title: Text('Estado'),
//               subtitle: Text(usuario.estado ? 'Activo' : 'Inactivo'),
//             ),
//             ListTile(
//               title: Text('Tipo de Usuario'),
//               subtitle: Text(usuario.tipoUsuario),
//             ),
//           ],
//                 ),
//         ),
//     );
//   }
// }
