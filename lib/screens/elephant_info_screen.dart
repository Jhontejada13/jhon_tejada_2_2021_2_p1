import 'package:flutter/material.dart';
import 'package:partial1_elephantapp/components/loader_component.dart';
import 'package:partial1_elephantapp/models/elephant.dart';


class ElephantInfoScreen extends StatefulWidget {
  final Elephant elephant;

  ElephantInfoScreen({required this.elephant});

  @override
  _ElephantInfoScreenState createState() => _ElephantInfoScreenState();
}

class _ElephantInfoScreenState extends State<ElephantInfoScreen> {
  bool _showLoader = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text(widget.elephant.name),
      ),
      body: Stack(
        children: <Widget> [
          Column(
            children: <Widget> [
              _showElephantInfo(),
            ],
          ),
          _showLoader ? const LoaderComponent(text: 'Por favor espere ...') : Container(),          
        ],

      )
    );
  }

  Widget _showElephantInfo() {
    return Stack(
      children: <Widget> [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              const SizedBox(height: 20,),
              _showImage(),
              const SizedBox(height: 10,),
              Center(
                child: Container(
                  child: _showInfoElephant(),
                ),
              )
            ]
          ),
        )
      ],
    );
  }

  Widget _showImage() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: FadeInImage(
          placeholder: const AssetImage('assets/elefante.jpg'), 
          image: widget.elephant.image.contains('missing.jpg') 
            ? const NetworkImage("https://lh3.googleusercontent.com/proxy/UUFkIe3eGL64fBSBjRNlcmszXaaFMWWhxrhGI4DygugxobDZXS76pjhNQdLsD6MDQ6VhE0U8LRBtPSdsESXL5Luo6V0ZoGpeu2WPKuYph5BYZUQ2uZl4LK1SR3E-")
            : NetworkImage(widget.elephant.image),
          width: 300,
          height: 300,
          fit: BoxFit.cover
        ),
      ),
    );
  }

  Widget _showInfoElephant() {
    return Stack(
      children: <Widget> [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: <Widget> [                        
                              Row(
                                children: <Widget> [
                                  const Text('Nombre: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.elephant.name,
                                      style: const TextStyle(
                                        fontSize: 15
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: <Widget> [
                                  const Text('Index: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.elephant.index.toString(),
                                      style: const TextStyle(
                                        fontSize: 15
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: <Widget> [
                                  const Text('Afiliación: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.elephant.affiliation,
                                      style: const TextStyle(
                                        fontSize: 15
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: <Widget> [
                                  const Text('Especie: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.elephant.species,
                                      style: const TextStyle(
                                        fontSize: 15
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: <Widget> [
                                  const Text('Sexo: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  Text(
                                    widget.elephant.sex,
                                    style: const TextStyle(
                                      fontSize: 15
                                    ),
                                  ),
                                ],
                              ),                                                
                              const SizedBox(height: 3),
                              Row(
                                children: <Widget> [
                                  const Text('Link: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.elephant.wikilink,
                                      style: const TextStyle(
                                        fontSize: 15
                                      ),
                                    ),
                                  ),
                                ],
                              ),                                                
                              const SizedBox(height: 3),
                              // Row(
                              //   children: <Widget> [
                              //     const Text('Notas: ',
                              //       style: TextStyle(
                              //         fontWeight: FontWeight.bold
                              //       )
                              //     ),
                              //     Expanded(
                              //       child: Text(
                              //         widget.elephant.note,
                              //         style: const TextStyle(
                              //           fontSize: 15
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),                                                
                              const SizedBox(height: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),
        )
      ],
      
    );
  }
}