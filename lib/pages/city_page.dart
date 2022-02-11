import 'dart:developer';

import 'package:flutter/material.dart';

class CityPage extends StatelessWidget {
 CityPage({ Key key }) : super(key: key);


  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context){

    final _size = MediaQuery.of(context).size;

    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.white,
  // primary: Colors.black87,
  // minimumSize: Size(88, 36),
  // padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
    );
// ).copyWith(
//   side: MaterialStateProperty.resolveWith<BorderSide>(
//     (Set<MaterialState> states) {
//       if (states.contains(MaterialState.pressed))
//         return BorderSide(
//           color: Theme.of(context).colorScheme.primary,
//           width: 1,
//         );
//       return null; // Defer to the widget's default.
//     },
//   ),
// );

    return Scaffold(
      extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Find by city'. toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 TextField(
                   controller: textController,
                  style: const TextStyle(
                    color: Colors.white, 
                  fontSize: 22.0,
                  ),
                  decoration: InputDecoration(
                  focusedBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius:BorderRadius.circular(12.0)
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius:BorderRadius.circular(12.0)
                  ),
                 hintText: 'Write your city',
                 hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7), 
                  fontSize: 20.0,
                  ),
                 
                ),
  // decoration: 
  // InputDecoration(fillColor: Colors.transparent,filled:true),
),
const SizedBox(height: 40,),
OutlinedButton(
  style: outlineButtonStyle,
  onPressed: (){
    FocusScope.of(context).unfocus();
    Navigator.pop(context, textController.text);
  }, 
//  style: outlineButtonStyle,
child: const Padding(
  padding:  
  EdgeInsets.symmetric(vertical: 8.0, horizontal: 30,),
  child: Text(
    'Show weather', 
    style:  TextStyle(
     color: Colors.black,
     fontSize: 35.0,
    ),
    ),
),
),
],
            ),
            ),
        ),
      ),
    );
  }
}