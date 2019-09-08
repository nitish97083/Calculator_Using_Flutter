import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
      String output = '0';
      String _output = '0';
      double num1 = 0.0;
      double num2 = 0.0;
      String oprand = '';
            buttonpressed(String buttonText)
      {
        if(buttonText=='Clear'){
            output = '0';
       _output = '0';
       num1 = 0.0;
       num2 = 0.0;
        oprand = '';
        }
        else if(buttonText=='+' || buttonText =='-' || buttonText == 'x' || buttonText == '/'){

          num1 = double.parse(output);
          oprand = buttonText;
          _output = '0';
        }
        else if(buttonText == "."){
          if(_output.contains('.')){
            print("Already contains the Decimal");
            return;
          }else{
            _output = _output + buttonText;
          }
        }else if(buttonText =='='){
           num2 = double.parse(output);
           if(oprand == '+'){
             _output =(num1 + num2).toString();
           }
           if(oprand == '-'){
             _output =(num1 - num2).toString();
           }
           if(oprand == 'x'){
             _output =(num1 * num2).toString();
           }
           if(oprand == '/'){
             _output =(num1 / num2).toString();
           }
           num1 = 0.0;
           num2 = 0.0;
           oprand ='0';

        }
        else{
          _output = _output + buttonText;
        }
        print(_output);
        setState(() {
          output = double.parse(_output).toStringAsFixed(2);
        });
      }
  Widget buildButton(String textButton){
    return Expanded(
    
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        child: Text(textButton,
        style: TextStyle(
          fontSize:20.0,
          fontWeight: FontWeight.bold,
        ),
        ),
        onPressed: (){
       buttonpressed(textButton);

        },
       // color: Colors.black,
        //textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       title: Text(widget.title
      ),
      ),
      body: Container(
       padding: EdgeInsets.all(5.0),
        child: Column(
          
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
            child: Text(output,
            style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 48.0),
            )
            ),
           Expanded(
             child: Divider(),
           ),
           
            
              Column(children:[
                Row(children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/')
                  ],),
                Row(children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('x')
                  ],),
                Row(children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('+')
                  ],),
                Row(children: [
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('-')
                 ],),
                Row(children: [
                    buildButton('Clear'),
                   // buildButton('Back'),
                    buildButton('%'),
                    buildButton('=')
                 ],),
                 
                // Row(
                //    children:[
                //     buildButton(),
                //     buildButton(),
                //     buildButton(),
                //     buildButton(),
                //  ],
                 
                //  ),

                ],
              ),
          
          ],
        ),
      ),
    );
  }
}
