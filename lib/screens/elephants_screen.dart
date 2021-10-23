import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:partial1_elephantapp/components/loader_component.dart';
import 'package:partial1_elephantapp/helpers/api_helper.dart';
import 'package:partial1_elephantapp/models/elephant.dart';
import 'package:partial1_elephantapp/models/response.dart';
import 'package:partial1_elephantapp/screens/elephant_info_screen.dart';

class ElephantsScreen extends StatefulWidget {
  const ElephantsScreen({ Key? key }) : super(key: key);

  @override
  _ElephantsScreenState createState() => _ElephantsScreenState();
}

class _ElephantsScreenState extends State<ElephantsScreen> {
  bool _showLoader = false;
  List<Elephant> _elephants = [];

  @override
  void initState() {
    super.initState();
    _getElephants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text('Lista de Elefantes'),
      ),
      body: Center(
        child: _showLoader ? const LoaderComponent(text: 'Por favor espere') : _getContent(),
      )
    );
  }

  _getContent() {
    return _elephants.isEmpty ? _noContent() : _getListView();
  }

  Widget _noContent() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: const Text('No se puede mostrar la lista de elefantes',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
      ),

    );
  }

  _getListView() {
    return RefreshIndicator(
      onRefresh: _getElephants,
      child: ListView(
        children: _elephants.map((e) {
          return Card(          
            child: InkWell(
              onTap: () => _goInfoElephant(e),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/elefante.jpg'), 
                        image: NetworkImage(e.image),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    e.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF9575CD)
                                      //0xFFE1BEE7
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    e.species,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFE1BEE7)
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    e.sex,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFE1BEE7)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xFFE1BEE7),
                    ),
                  ],
                ),
              )
            ),
          );
        }).toList(),
      ),
    );
  }

  void _goInfoElephant(Elephant elephant) async {  
    String? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ElephantInfoScreen(
          elephant: elephant,
        ) 
      )
    );

    if(result == 'yes'){
      _getElephants();
    }
  }

  Future<Null> _getElephants() async {
    setState(() {
      _showLoader = true;
    });

    var connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.none){
      setState(() {
      _showLoader = false;
    });

      await showAlertDialog(
        context: context,
        title: 'Error',
        message: 'Verifica que estés conectado a internet',
        actions: <AlertDialogAction>[
          const AlertDialogAction(
            key: null,
            label: 'Aceptar'
          ),
        ]
      );
      return;
    }

    Response response = await ApiHelper.getElephants();

    setState(() {
      _showLoader = false;
    });

    if(!response.isSucces){
      await showAlertDialog(
        context: context,
        title: 'Error',
        message: response.message,
        actions: <AlertDialogAction>[
          const AlertDialogAction(
            key: null,
            label: 'Aceptar'
          ),
        ]
      );
      return;
    }

    setState(() {
     _elephants = response.result;
    });
  }
}