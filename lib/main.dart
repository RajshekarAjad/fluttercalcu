import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int firstnum;
  int secondnum;

  String texttodisplay="";
  String res;
  String operatorperform;

  void btnclicked(String btnvl){
    if(btnvl=="C"){
      texttodisplay="";
      firstnum=0;
      secondnum=0;
      
      res="";

    }
    else if(btnvl=="+" || btnvl=="-" || btnvl=="x" || btnvl=="/" ){
      firstnum=int.parse(texttodisplay);
      res="";
      operatorperform=btnvl;
    }
    else if(btnvl=="=") {
      secondnum = int.parse(texttodisplay);
      if(operatorperform=="+"){
        res=(firstnum+secondnum).toString();
      }
      if(operatorperform=="-"){
        res=(firstnum-secondnum).toString();
      }
      if(operatorperform=="x"){
        res=(firstnum*secondnum).toString();
      }
      if(operatorperform=="/"){
        res=(firstnum/secondnum).toString();
      }

    }


    else{
      res=int.parse(texttodisplay+btnvl).toString();
     }
    setState(() {
      texttodisplay=res;
    });
  }


  Widget custombtn(String btnvl){
    return Expanded(child: OutlineButton(color: Colors.yellowAccent,splashColor: Colors.redAccent,
      onPressed: ()=>btnclicked(btnvl),padding: EdgeInsets.all(30.0),
      child: Text(btnvl,style: TextStyle(fontSize: 20.0),),));
  }




  @override
  Widget build(BuildContext context) {

    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(backgroundColor: Colors.redAccent,title: Text("Calculator",style: TextStyle(fontSize: 20.0),),),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[Container
                (padding: EdgeInsets.only(bottom:20.0,right: 10.0),child: Text("$texttodisplay",style: TextStyle(fontSize: 40.0),),)],),
              Row(children: <Widget>[
                custombtn("2nd"),
                custombtn("C"),
                custombtn("%"),
                custombtn("/"),

              ],),

              Row(children: <Widget>[
                custombtn("9"),
                custombtn("8"),
                custombtn("7"),
                custombtn("x"),

              ],),
              Row(children: <Widget>[
                custombtn("6"),
                custombtn("5"),
                custombtn("4"),
                custombtn("-"),

              ],),

              Row(children: <Widget>[
                custombtn("3"),
                custombtn("2"),
                custombtn("1"),
                custombtn("+"),

              ],),
              Row(children: <Widget>[
                custombtn("+/-"),
                custombtn("0"),
                custombtn("."),
                custombtn("="),

              ],)
            ],
          ),
        ),

      ),
    );
  }
}
