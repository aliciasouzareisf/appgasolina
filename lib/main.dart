//IMPORT - MATERIAL 
import 'package:flutter/material.dart';

//ETAPA 1 - Esqueleto da tela 
//Ojetivo: entender a estrutura de um app Flutter

void main() => runApp(MaterialApp(
  home: GasolinaApp(), 
)); //MaterialApp

class GasolinaApp extends StatelessWidget{

  String _resultado = "";
  void _calcular(){
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // LOCAL ONDE FICARÃO A MAIORIA DOS NOSSOS ELEMENTOS 

      //semelhante ao header 
      appBar: AppBar(
        title: Text("Calculadora de Combustível"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            //AQUI É ONDE ESTARÃO OS NOSSOS ELEMENTOS/WIDGETS
            Text(
              "Bem-vindo à Calculadora de Combustível!",
              style: TextStyle(fontSize: 18),

            ),
            SizedBox(height: 36),

             Text(
              "Informe o valor do combustível",
              style: TextStyle(fontSize: 18),

            ),
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                labelText: "Valor da gasolina:",
                border: OutlineInputBorder(),

              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            
            TextField(
              decoration: InputDecoration(
                labelText: "Valor do etanol:",
                border: OutlineInputBorder(),

              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: _calcular,
              child: Text("Calcular"),
            ),
            SizedBox(height: 36),
            Text(
              _resultado,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}