// import 'package:flutter/material.dart';

// class MaquinaScreens extends StatefulWidget {
//   const MaquinaScreens({super.key});

//   @override
//   State<MaquinaScreens> createState() => _MaquinaScreensState();
// }

// class _MaquinaScreensState extends State<MaquinaScreens> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Card(
//          child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: [
//             ListTile(
//               title: Text('Id'),
//               subtitle: Text(maquina.id),
//             ),
//             ListTile(
//               title: Text('Nombre'),
//               subtitle: Text(maquina.nombre),
//             ),
//             ListTile(
//               title: Text('Estado'),
//               subtitle: Text(maquina.estado ? 'Activo' : 'Inactivo'),
//             )
//           ],
//         )
//       ),
//     );
//   }
// }