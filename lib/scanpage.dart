import'package:flutter/material.dart';
import 'main.dart';
import 'DelayedAnim.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class Scan_Page extends StatefulWidget {
  const Scan_Page({Key? key}) : super(key: key);

  @override
  State<Scan_Page> createState() => _Scan_Page();
}

class _Scan_Page extends State<Scan_Page> {
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
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnim(
                    delay: 1000,
                    child: Text(
                      "    MACHINE NAME",
                      textAlign:TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: d_blue,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height:480),

                  DelayedAnim(
                    delay: 2000,
                    child:
                    MaterialButton(
                      onPressed: () {},
                      color: d_Red,
                      textColor: Colors.white,
                      child: Icon(
                        Icons.text_format,
                        size: 24,
                      ),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

