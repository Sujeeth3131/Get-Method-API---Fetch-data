import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ipinfo_work.dart';

Future<IPinfo> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://ipinfo.io/161.185.160.93/geo'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return IPinfo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class IponfiAPI extends StatefulWidget {
  const IponfiAPI({super.key});

  @override
  State<IponfiAPI> createState() => _IponfiAPIState();
}

class _IponfiAPIState extends State<IponfiAPI> {
  late Future<IPinfo> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: const Text('Fetch Data - Get Method API ',style: TextStyle(color: Colors.blue,fontSize: 24,fontWeight: FontWeight.bold),)),
        ),
        body: Center(
          child: FutureBuilder<IPinfo>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 200,),
                    Text(
                        style: TextStyle(
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        snapshot.data!.ip.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    Text(style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        snapshot.data!.city.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    Text(style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        snapshot.data!.region.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    Text(style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        snapshot.data!.country.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    Text(style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        snapshot.data!.loc.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    Text(style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        snapshot.data!.org.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    Text(style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        snapshot.data!.postal.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    Text(style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        snapshot.data!.timezone.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    Text(style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        snapshot.data!.readme.toString()),
                    SizedBox(
                      height: 15,
                    ),
                  ],
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
