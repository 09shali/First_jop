import 'package:flutter/material.dart';

class MisalPage extends StatefulWidget {
  const MisalPage({ Key key }) : super(key: key);

  @override
  _MisalPageState createState() => _MisalPageState();
}

class _MisalPageState extends State<MisalPage> {


    @override
    void initState() {
      super.initState();
      getName();
    }

  Future <void>getName() async{

    try {
      await Future.delayed(Duration(seconds: 5),(){
    _name = '2 sekundtan kiyin name keldi';
    });

    } catch (e) {
      throw Exception();
    }



    
    
setState(() {
  
});

  }
   
   String _name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_name ?? 'Name kele elek')),
      
    );
  }
}