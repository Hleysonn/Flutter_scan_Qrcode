//Page d'accueil
import 'main.dart';
import 'package:flutter/material.dart';
import 'DelayedAnim.dart';
import 'selectpage.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_unity_widget/flutter_unity_widget.dart';


class WelcomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 130,
              horizontal: 30,
            ),
            child: Column(
              children: [
                DelayedAnim(
                  delay: 1500,
                  child: Container(
                    height: 100,
                    child: Column(
                      children: [
                        Text(
                            "NOVI AIR",

                            style: GoogleFonts.poppins(
                              /* color: Colors.red.withOpacity(0.8),*/
                              color: d_blue.withOpacity(0.8),
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            )

                        )
                      ],

                    ),
                    //child: Image.asset('assets/logo.png'),
                  ),
                ),
                SizedBox(height: 30),
                DelayedAnim(
                  delay: 2500,
                  child: Container(
                      height: 200,
                      margin: EdgeInsets.only(top: 1, bottom: 20),
                      child: Image.asset(
                        'assets/Logo.png',
                      )),
                ),

                SizedBox(height: 30),
                DelayedAnim(
                  delay: 3500,
                  child: Container(
                    /*height: 400,*/
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 20,
                      ),
                      child: Text(
                        "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.",
                        textAlign: TextAlign.center,
                        style:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
                      )),
                ),
                DelayedAnim(
                  delay: 4500,
                  child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: d_blue,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.all(13)),
                        child: Text('START'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectPage(),
                              )
                          );
                        },
                      )),
                )
              ],
            ),
          )),
    );
  }
}

