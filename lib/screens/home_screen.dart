import 'package:flutter/material.dart';
import 'package:partial1_elephantapp/screens/elephants_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          leading: Image.network("https://www.besoftsocks.com/wp-content/uploads/2018/07/Elefante.png",
              color: Colors.white,
          ),
          title: Container(
            alignment: Alignment.center,
            child: Text("ElephantApp")
          ),          
          elevation: 20,
          shadowColor: Colors.purple[100],        
        ),
        body: _getBody(),
      );
  }

  Widget _getBody() {
    return Stack(
      children: <Widget> [
        SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SizedBox(height: 50,),
              _showImage(),
              SizedBox(height: 20,),
              Center(
                child: Container(
                  child: 
                    _showButton(), 
                ),
              ),
            ],        
          )
        ),
      ],
      
    );
  }

  Widget _showButton() {
    return Expanded(
      child: ElevatedButton(
        child: const Text('Ver Elefantes'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return Color(0xFFE1BEE7);
            }
          ),
        ),
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ElephantsScreen(),
            )
          );
        }
      ),
    );
  }  

  Widget _showImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(175),
      child: const FadeInImage(
        placeholder: AssetImage('assets/elefante.jpg'),
        image: NetworkImage("https://lh3.googleusercontent.com/proxy/UUFkIe3eGL64fBSBjRNlcmszXaaFMWWhxrhGI4DygugxobDZXS76pjhNQdLsD6MDQ6VhE0U8LRBtPSdsESXL5Luo6V0ZoGpeu2WPKuYph5BYZUQ2uZl4LK1SR3E-"),
        height: 350,
        fit: BoxFit.cover,
      ),
    );
  }

}