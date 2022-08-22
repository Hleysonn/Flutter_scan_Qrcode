import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

class AppDatabase {
  String nom = '';
  String prenom = '';
  String email = '';
  String mdp = '';

  PostgreSQLConnection? connexion;
  PostgreSQLResult? loginResult;

  static String? emailAdresse;
  PostgreSQLResult? _fetchUserDataResult;

  AppDatabase() {
    connexion = (connexion == null || connexion!.isClosed == true
        ? PostgreSQLConnection(
      'localhost',
      5432,
      'flutterdb',
      timeoutInSeconds: 30,
      queryTimeoutInSeconds: 30,
      timeZone: 'UTC',
      useSSL: false,
      isUnixSocket: false,
    )
        : connexion);
  }

  String userLoginFuture = '';
  Future<String> loginUser(String email, String password) async {
    try {
      await connexion!.open();
      await connexion!.transaction((loginConn) async {
        //Etape 1 : verification de l'email
        loginResult = await loginConn.query(
          'select emai,mdp from flutter.db.register where email = @emailValue order by id',
          substitutionValues: {'emailValue': email},
          allowReuse: true,
          timeoutInSeconds: 30,
        );
        if (loginResult!.affectedRowCount > 0) {

          email = loginResult!.first
              .elementAt(0);

          if (loginResult!.first.elementAt(1).contains(password) == true &&
              loginResult!.first.elementAt(2) == true) {
            userLoginFuture = 'sel';
          } else if (loginResult!.first.elementAt(1).contains(password) ==
              true &&
              loginResult!.first.elementAt(2) == false) {
            userLoginFuture = 'buy';
          } else if (loginResult!.first.elementAt(1).contains(password) ==
              false) {
            userLoginFuture = 'fai';
          } else {
            userLoginFuture = 'exc';
          }
        } else {
          userLoginFuture = 'not';
        }
      });
    } catch (exc) {
      userLoginFuture = 'exc';
      exc.toString();
    }
    return userLoginFuture;
  }

}