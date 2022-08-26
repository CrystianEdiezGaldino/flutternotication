import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Painel extends StatefulWidget {
  const Painel({Key? key}) : super(key: key);

  @override
  State<Painel> createState() => _PainelState();
}

class _PainelState extends State<Painel> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PainelScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

getPokemons() async {
  var url = Uri.https("pokeapi.co", "/api/v2/pokemon?limit=10");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    // ignore: avoid_print
    print('Number of books about http???: $itemCount.');
  } else {
    debugPrint('Request failed with status???: ${response.statusCode}.');
    debugPrint(url.toString());
  }
}

class PainelScreen extends StatefulWidget {
  const PainelScreen({Key? key}) : super(key: key);

  @override
  State<PainelScreen> createState() => _PainelScreenState();
}

class _PainelScreenState extends State<PainelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 157, 117),
        title: const Text(
          'Painel',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 88, 248, 133),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
          future: getPokemons(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
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
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 1, 255, 73),
                  ),
                ),
              );
            } else {
              return Container(
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
                child: Column(),
              );
            }
          }),
    );
  }
}
