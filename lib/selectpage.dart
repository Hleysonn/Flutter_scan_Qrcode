import 'package:flutter/material.dart';
import 'DelayedAnim.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'loginpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'infopage.dart';

class SelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.4),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: d_blue,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
          child: Column(
            children: [
              DelayedAnim(
                delay: 1000,
                child: Container(
                  height: 230,
                  child: Image.asset('assets/Logo.png'),
                ),
              ),
              SizedBox(height: 50),
              DelayedAnim(
                delay: 2000,
                child: Container(
                  height: 150,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 30),
                    child: Column(
                      children: [
                        Text(
                          "NOVI-AR",
                          style: GoogleFonts.poppins(
                            /* color: Colors.red.withOpacity(0.8),*/
                            color: d_blue.withOpacity(0.8),
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          "NOVI-AR entéprise d'entrétien au sol des avions",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              DelayedAnim(
                delay: 3000,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  InfoPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: d_blue,
                          padding: EdgeInsets.all(13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.inbox),
                            SizedBox(width: 20),
                            Text(
                              'INFORMATION',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  LoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: d_blue,
                          padding: EdgeInsets.all(13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.user),
                            SizedBox(width: 20),
                            Text(
                              'CONNEXION',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}