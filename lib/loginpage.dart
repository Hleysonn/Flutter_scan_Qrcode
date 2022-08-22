
import 'package:flutter/material.dart';
import 'DelayedAnim.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'cam.dart';
import 'camerqrcode.dart';
import 'scanpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.4),
        leading: IconButton(
          icon: Icon(
            Icons.close,
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
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnim(
                    delay: 1500,
                    child: Text(
                      "   AUTHENTIFICATION",
                      textAlign:TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: d_blue,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  DelayedAnim(
                    delay: 2500,
                    child: Text(
                      "Il est recommandé de se connecter avec son adresse mail et son mot de passe valide pour pouvoir avoir accès aux machines.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            LoginForm(),
            SizedBox(height: 100),
            DelayedAnim(
              delay: 5500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: d_blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'CONFIRMER',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.push(                                                                                                                                 
                    context,
                    MaterialPageRoute(
                      builder: (context) =>ScanQr(title: 'Qrcode'),
                    ),
                  );
                },
              ),
            ),
            /* SizedBox(height: 90),
           Align(
             alignment: Alignment.centerRight,
             child: Padding(
               padding: EdgeInsets.only(right: 35),
               child: TextButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 child: DelayedAnim(
                   delay: 6500,
                   child: Text(
                     "SKIP",
                     style: GoogleFonts.poppins(
                       color: Colors.black,
                       fontSize: 18,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
               ),
             ),
           ),*/
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnim(
            delay: 3500,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Votre Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          DelayedAnim(
            delay: 4500,
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
