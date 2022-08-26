// ignore_for_file: unnecessary_new, duplicate_ignore

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:revflutter/screens/painel.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late final Size? size;
bool savepass = false;
bool isSwitched = false;

String userName = "";
String passWord = "";

void main(List<String> args) {
  runApp(const HomeLoginScreen());
}

class HomeLoginScreen extends StatelessWidget {
  const HomeLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  showPasswordMethod() {
    setState(() {
      if (savepass == true) {
        savepass = false;
      } else {
        savepass = true;
      }
    });
  }

  late FlutterLocalNotificationsPlugin localNotification;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    var androidInicialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInicialize = const IOSInitializationSettings();
    var initialzationSettings =
        InitializationSettings(android: androidInicialize, iOS: iOSInicialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initialzationSettings);
  }

  Future _showNotification() async {
    var androidDetails = const AndroidNotificationDetails(
        "channelId", "channelName",
        channelDescription: "Description", importance: Importance.high);
    var iosDetails = const IOSNotificationDetails();
    // ignore: duplicate_ignore
    var generalNotificationDetaisl =
        // ignore: unnecessary_new
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotification.show(
        0, "Crystian", "testando notificação", generalNotificationDetaisl);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 7, 157, 117),
          title: const Text(
            'Login',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              letterSpacing: 3,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(121, 8, 8, 8),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 7, 157, 117),
                      Color.fromARGB(248, 23, 186, 104),
                      Color.fromARGB(213, 33, 246, 140),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 30),
                      ),

                      const Text(
                        "Dev Crystian",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(51, 8, 8, 8),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: const Form(
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.login_sharp),
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              hintText: 'Login',
                            ),
                          ),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 20,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password_sharp),
                            contentPadding:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintText: 'Senha',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Switch(
                        activeColor: const Color.fromARGB(255, 1, 19, 7),
                        onChanged: (bool value) {
                          showPasswordMethod();
                        },
                        value: savepass,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(
                              255, 29, 135, 65), // background
                          onPrimary: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          minimumSize: const Size(160, 60),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Painel()));
                        },
                        child: const Text('Inciar'),
                      ),
                      const SizedBox(height: 30),
                      FloatingActionButton(
                        backgroundColor: const Color.fromARGB(199, 30, 33, 31),
                        onPressed: _showNotification,
                        child: const Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 7, 255, 36),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      );
}
