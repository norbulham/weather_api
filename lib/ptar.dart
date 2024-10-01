import 'package:flutter/material.dart';
import 'package:weather_api/constants/contant.dart';

class Prat extends StatefulWidget {
  const Prat({super.key});

  @override
  State<Prat> createState() => _PratState();
}

class _PratState extends State<Prat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/sky2.png'),fit: BoxFit.none
        )),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text('Location', style: mystyles(20,Colors.white,FontWeight.bold)),
            SizedBox(height: 20,),
             Text('icon', style: mystyles(30,Colors.white,FontWeight.bold)),
            SizedBox(height: 20,),
            Text('20', style: mystyles(30,Colors.white,FontWeight.bold)),
            Text('expected', style: mystyles(15,Colors.white,FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            ),

          ],
        ),
      ),
    );
  }
}
