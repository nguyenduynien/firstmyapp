import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  operation(String btntext){
    if( btntext == "C"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else if(btntext == "+" || btntext == "-" || btntext == "x" || btntext == "/"){
      num1 = double.parse(output);
      operand = btntext;
      _output = "0";
    }
    else if(btntext == "="){
      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "x"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else {
      _output = _output + btntext;
    }
    
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button(String btntext)=> Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.black12, width: 2),
        padding: EdgeInsets.all(20),
        child: Text(
          "$btntext",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        onPressed: (){
          operation(btntext);
        },
      ),
    );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Caculator",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 3),
                  ),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(8),
                  child: Text(
                      "$output",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  button("C"),
                  button("("),
                  button(")"),
                  button("Del"),
                ],
              ),
              Row(
                children: [
                  button("7"),
                  button("8"),
                  button("9"),
                  button("x"),
                ],
              ),
              Row(
                children: [
                  button("4"),
                  button("5"),
                  button("6"),
                  button("-"),
                ],
              ),
              Row(
                children: [
                  button("1"),
                  button("2"),
                  button("3"),
                  button("+"),
                ],
              ),
              Row(
                children: [
                  button("."),
                  button("0"),
                  button("/"),
                  button("="),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
