//import material
import 'package:flutter/material.dart';

//etapa 1- esqueleto da tela
//objetivo: entender a estrutura de um app flutter

void main() => runApp(MaterialApp(
  home: GasolinaApp(),
));

class GasolinaApp extends StatefulWidget{
  @override
  _GasolinaAppState createState() => _GasolinaAppState();
}
 
class _GasolinaAppState extends State<GasolinaApp>{
  TextEditingController _EtanolController = TextEditingController();
  TextEditingController _GasolinaController = TextEditingController();
 
  String _resultado = "";
 
  // PALETA DE CORES (agora em azul suave)
static const Color corFundo = Color.fromARGB(255, 220, 235, 250); 
static const Color corCard = Color.fromARGB(255, 235, 245, 255); 
static const Color corPrimaria = Color.fromARGB(255, 120, 170, 220); 
static const Color corSecundaria = Color.fromARGB(255, 40, 70, 100); 
static const Color corTexto = Color.fromARGB(255, 30, 60, 90); 
static const Color corTextoCinza = Color.fromARGB(255, 90, 120, 150); 
static const Color corBorda = Color.fromARGB(255, 180, 210, 235); 
 
 void _calcular(){

  final double etanol = double.tryParse(_EtanolController.text) ?? 0.0;
  final double gasolina = double.tryParse(_GasolinaController.text) ?? 0.0;
  final double coef = etanol/gasolina; 

  final String coefString = coef <= 0.7 ? 'Etanol' : 'Gasolina';
  final String coefStringDecimal = coef.toStringAsFixed(2);

    if (gasolina < 0 || etanol < 0) {
      setState(() {
        _resultado = "Informe ao menos um valor";
      });
    return;
    }
    
    setState(() {
      _resultado = 'O coeficiente é $coefStringDecimal \n'
                  'Abasteça com $coefString ⛽';
    });
    
    return;
 }
 
  @override
  Widget build(BuildContext context){
    return Scaffold( 
       backgroundColor: corFundo,
      appBar: AppBar(
        backgroundColor: corCard,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Calculadora de gasolina⛽",
          style: TextStyle(
            color: corSecundaria,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             SizedBox(height: 16),
            
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: corCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: corBorda, width: 1),
              ),
              child:  Text(
              "Informe o valor:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: corSecundaria,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 28),
          _buildCampo(
            controller: _EtanolController, 
            label: "Valor do Etanol", 
            icone: Icons.person,
            ),            
            
          SizedBox(height: 16),
          _buildCampo(
            controller: _GasolinaController, 
            label: "Valor da Gasolina", 
            icone: Icons.person_outline,
            ),    
            SizedBox(height: 16),

            ElevatedButton( 
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrimaria,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 6,
                shadowColor: corPrimaria.withOpacity (0.5),
              ),
              child: Text(
              "Calcular",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              ),
            ),
            
            ),
            
            SizedBox(height: 30),

            if (_resultado.isNotEmpty)
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: corPrimaria,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                 color: corPrimaria,
                 width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                     color: corPrimaria.withOpacity(0.2),
                     blurRadius: 12,
                     offset: Offset(0, 4),
                  ),
                ]
              ),
              child: Column(children: [
                Text(
                  'O mais vantajoso é :',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: corCard,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 2.0,
                    color: Colors.white,
                  ),
                )
              ],),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildCampo({
  required TextEditingController controller,
  required String label,
  required IconData icone,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    style: TextStyle(color: corTexto, fontSize: 16),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: corTextoCinza),
      prefixIcon: Icon(icone, color: corPrimaria),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color:corBorda, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: corPrimaria, width: 2),
      ),
      filled: true,
      fillColor: corCard,
    ),
  );
}
}
