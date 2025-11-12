import 'package:flutter/material.dart';
import 'package:food_delivery_application/login_page.dart';


class app_01_page extends StatefulWidget {
  const app_01_page({super.key});

  @override
  State<app_01_page> createState() => _app_01_pageState();
}

class _app_01_pageState extends State<app_01_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCC33),
     body: Center(child:
     Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Container(
           child:
           CircleAvatar(
             radius: 100,
               backgroundColor: Colors.lightGreen,
             child:
             ClipOval(child: Image.asset("assets/logo1.png",
               height: 200, fit: BoxFit.cover,))
         
         )
         ),
         SizedBox(
           height: 30,
         ),
         Container(child: Text("SIMMER",
           style: TextStyle(fontSize: 20,
           fontWeight: FontWeight.w800)

         ),
         ),

         SizedBox(
           height: 2,
         ),
        Container(child: Text("Food Delivery App",
          style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w600)

        )
        ),
         SizedBox(
           height: 20,
         ),
         Container(
           child: ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => login(),
             ),
             );
           }
               , child: Text("Login")),
         ),
       ],
     )
     )
    );
  }
}
