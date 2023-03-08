import "package:flutter/material.dart";


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

   double precoAlcool =  double.parse(_controllerAlcool.text);
   double precoGasolina =  double.parse(_controllerGasolina.text);




   if((precoAlcool / precoGasolina) >= 0.7){

     setState(() {
       _textoResultado = "Melhor abastecer com gasolina";
     });



   }else{
     setState(() {
       _textoResultado = "Melhor abastecer com Alcool";
     });


   }
   limparCampos();
  }

  void limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/logo.png")
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool,, ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: _calcular,
                  child: Text("Calcular"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
                    foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                    shadowColor: MaterialStatePropertyAll<Color>(Colors.yellow),
                    surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.green),
                    overlayColor: MaterialStatePropertyAll<Color>(Colors.pink),
                    //teste de cores MaterialStatePropertyAll<Color>

                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
              )





              // ElevatedButton(
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              //           (Set<MaterialState> states) {
              //         if (states.contains(MaterialState.pressed)) {
              //           return Theme.of(context).colorScheme.primary.withOpacity(0.5);
              //         }
              //         return null; // Use the component's default.
              //       },
              //     ),
              //   ),
              //   child: const Text('Fly me to the moon'),
              //   onPressed: () {
              //     // ...
              //   },
              // ),

            ],
          ),
        )
      ),
    );
  }
}
