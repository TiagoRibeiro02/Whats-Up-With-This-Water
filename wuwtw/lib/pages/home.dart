import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<List<dynamic>> _data = [];

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/DataStream-b9cd632.csv");
    List<List<dynamic>> _listData =
    const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadCSV();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Column(
                children: [
                  //search location
                  SearchAnchor(
                      builder: (context, SearchController controller) {
                        return SearchBar(
                          controller: controller,
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0)),
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (_) {
                            controller.openView();
                          },
                          leading: const Icon(Icons.search),
                        );
                      }, suggestionsBuilder: (BuildContext context, SearchController controller) {
                            return List<ListTile>.generate(20, (int index) {
                              final String item = '${2000+index}';
                                return ListTile(
                                  title: Text(item),
                                    onTap: () {
                                    setState(() {
                                      controller.closeView(item);
                                });
                              },
                        );
                      });
                    },
                  ),

                  SizedBox(height: 20.0,),

                  //Information display
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    height: 300,
                    width: MediaQuery. of(context). size. width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Ph: ${_data[0][24+(40*2)].toString()}"),
                            Text("Electrical conductance: ${_data[0][24+40].toString()}"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Temperature: ${_data[0][24+(40*3)].toString()}"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //species display

                  //year display

                ],
              ),
            ),
          )
      ),
    );
  }
}
