import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'jokes_work.dart';

Future<Jokes> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Jokes.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class JokesAPI extends StatefulWidget {
  const JokesAPI({super.key});

  @override
  State<JokesAPI> createState() => _JokesAPIState();
}

class _JokesAPIState extends State<JokesAPI> {
  late Future<Jokes> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example - Get method API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Jokes>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        snapshot.data!.type.toString(),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        snapshot.data!.setup.toString(),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        snapshot.data!.punchline.toString(),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        snapshot.data!.id.toString(),
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
