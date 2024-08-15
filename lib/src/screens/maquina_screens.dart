import 'package:app_movil_coffe/src/controllers/maquinas_controller.dart';
import 'package:app_movil_coffe/src/models/maquina_model.dart';
import 'package:flutter/material.dart';


class MaquinaScreen extends StatefulWidget {
  @override
  _MaquinaScreenState createState() => _MaquinaScreenState();
}

class _MaquinaScreenState extends State<MaquinaScreen> {
  List<Maquina> maquinas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMaquinas();
  }

  Future<void> _fetchMaquinas() async {
    try {
      MaquinaService maquinaService = MaquinaService();
      List<Maquina> fetchedMaquinas = await maquinaService.getAllMaquinas();
      setState(() {
        maquinas = fetchedMaquinas;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Manejar el error mostrando un mensaje o algo similar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Máquinas'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: maquinas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(maquinas[index].nombre),
                  subtitle: Text(maquinas[index].estado),
                );
              },
            ),
    );
  }
}
