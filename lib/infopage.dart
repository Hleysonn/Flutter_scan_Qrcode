
import 'package:flutter/material.dart';
import 'DelayedAnim.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';


class InfoPage extends StatelessWidget {
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
              delay: 2000,
              child: Container(
                height: 80,
                child: Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: Column(
                    children: [
                      Text(
                        "NOVI-AR",
                        style: GoogleFonts.poppins(
                          color: d_blue.withOpacity(0.8),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            DelayedAnim(
              delay: 3500,
              child: Container(
                /*height: 400,*/
                  margin:
                  EdgeInsets.only(top: 30, bottom: 20, left: 40, right: 40),
                  child: Text(
                    " Lorem ipsum dolor sit amet. Ut delectus eius qui sint "
                        "explicabo et omnis nostrum a Quis necessitatibus qui "
                        "temporibus illum. Qui culpa blanditiis qui voluptas q"
                        "uia ex enim sint ea corporis reprehenderit nam sequi f"
                        "ugiat non ratione repellat. In aperiam repellendus et "
                        "consequatur doloribus vel ratione soluta sit "
                        "exercitationem molestias hic galisum dolorem "
                        "quia beatae ea autem quia. Nam animi eligendi sed "
                        "necessitatibus commodi quo voluptatibus galisum id "
                        "eaque quos quo praesentium earum ut soluta voluptatem "
                        "qui exercitationem maxime.Ut saepe blanditiis qui iste "
                        "consectetur sit fugiat enim. Id Quis incidunt est "
                        "minima tempora et quisquam voluptatum vel quia "
                        "maxime 33 velit optio. Non natus et corporis autem aut"
                        " commodi fuga et molestias suscipit. Aut dolore "
                        "molestias et dolores quaerat et totam architecto ea "
                        "galisum dolor sed sunt ipsa hic alias beatae sed "
                        "incidunt nostrum.",
                    textAlign: TextAlign.justify,
                    style:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
