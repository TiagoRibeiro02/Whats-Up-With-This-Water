import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LatLng initialLocation = const LatLng(39.647078, -7.676211);

  List<List<dynamic>> _data = [];

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/data.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }

  BitmapDescriptor blueColor =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
  BitmapDescriptor greenColor =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
  BitmapDescriptor yellowColor =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
  BitmapDescriptor orangeColor =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
  BitmapDescriptor redColor =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);

  bool isExcelent1 = false;
  bool isGood1 = false;
  bool isMid1 = false;
  bool isBad1 = true;
  bool isVeryBad1 = false;

  bool isExcelent2 = false;
  bool isGood2 = true;
  bool isMid2 = false;
  bool isBad2 = false;
  bool isVeryBad2 = false;

  bool isExcelent3 = false;
  bool isGood3 = true;
  bool isMid3 = false;
  bool isBad3 = false;
  bool isVeryBad3 = false;

  bool isExcelent4 = false;
  bool isGood4 = true;
  bool isMid4 = false;
  bool isBad4 = false;
  bool isVeryBad4 = false;

  bool isExcelent5 = false;
  bool isGood5 = false;
  bool isMid5 = true;
  bool isBad5 = false;
  bool isVeryBad5 = false;

  bool isExcelent6 = false;
  bool isGood6 = false;
  bool isMid6 = false;
  bool isBad6 = true;
  bool isVeryBad6 = false;

  BitmapDescriptor colorIcon(BitmapDescriptor icon) {
    setState(() {
      icon:
      icon;
    });

    return icon;
  }

  //needs optimization
  // void changeColor() {
  //   switch (_getCategory(_data[0][8])) {
  //     case 1:
  //       setState(() {
  //         isVeryBad1 = !isVeryBad1;
  //       });
  //       break;
  //     case 2:
  //       setState(() {
  //         isBad1 = !isBad1;
  //       });
  //       break;
  //     case 3:
  //       setState(() {
  //         isMid1 = !isMid1;
  //       });
  //       break;
  //     case 4:
  //       setState(() {
  //         isGood1 = !isGood1;
  //       });
  //       break;
  //     case 5:
  //       setState(() {
  //         isExcelent1 = !isExcelent1;
  //       });
  //       break;
  //   }
  //
  //   switch (_getCategory(_data[0][17])) {
  //     case 1:
  //       setState(() {
  //         isVeryBad2 = !isVeryBad2;
  //       });
  //       break;
  //     case 2:
  //       setState(() {
  //         isBad2 = !isBad2;
  //       });
  //       break;
  //     case 3:
  //       setState(() {
  //         isMid2 = !isMid2;
  //       });
  //       break;
  //     case 4:
  //       setState(() {
  //         isGood2 = !isGood2;
  //       });
  //       break;
  //     case 5:
  //       setState(() {
  //         isExcelent2 = !isExcelent2;
  //       });
  //       break;
  //   }
  //
  //   switch (_getCategory(_data[0][26])) {
  //     case 1:
  //       setState(() {
  //         isVeryBad3 = !isVeryBad3;
  //       });
  //       break;
  //     case 2:
  //       setState(() {
  //         isBad3 = !isBad3;
  //       });
  //       break;
  //     case 3:
  //       setState(() {
  //         isMid3 = !isMid3;
  //       });
  //       break;
  //     case 4:
  //       setState(() {
  //         isGood3 = !isGood3;
  //       });
  //       break;
  //     case 5:
  //       setState(() {
  //         isExcelent3 = !isExcelent3;
  //       });
  //       break;
  //   }
  //
  //   switch (_getCategory(_data[0][35])) {
  //     case 1:
  //       setState(() {
  //         isVeryBad4 = !isVeryBad4;
  //       });
  //       break;
  //     case 2:
  //       setState(() {
  //         isBad4 = !isBad4;
  //       });
  //       break;
  //     case 3:
  //       setState(() {
  //         isMid4 = !isMid4;
  //       });
  //       break;
  //     case 4:
  //       setState(() {
  //         isGood4 = !isGood4;
  //       });
  //       break;
  //     case 5:
  //       setState(() {
  //         isExcelent4 = !isExcelent4;
  //       });
  //       break;
  //   }
  //
  //   switch (_getCategory(_data[0][44])) {
  //     case 1:
  //       setState(() {
  //         isVeryBad5 = !isVeryBad5;
  //       });
  //       break;
  //     case 2:
  //       setState(() {
  //         isBad5 = !isBad5;
  //       });
  //       break;
  //     case 3:
  //       setState(() {
  //         isMid5 = !isMid5;
  //       });
  //       break;
  //     case 4:
  //       setState(() {
  //         isGood5 = !isGood5;
  //       });
  //       break;
  //     case 5:
  //       setState(() {
  //         isExcelent5 = !isExcelent5;
  //       });
  //       break;
  //   }
  //
  //   switch (_getCategory(_data[0][53])) {
  //     case 1:
  //       setState(() {
  //         isVeryBad6 = !isVeryBad6;
  //       });
  //       break;
  //     case 2:
  //       setState(() {
  //         isBad6 = !isBad6;
  //       });
  //       break;
  //     case 3:
  //       setState(() {
  //         isMid6 = !isMid6;
  //       });
  //       break;
  //     case 4:
  //       setState(() {
  //         isGood6 = !isGood6;
  //       });
  //       break;
  //     case 5:
  //       setState(() {
  //         isExcelent6 = !isExcelent6;
  //       });
  //       break;
  //   }
  // }
  //
  // int _getCategory(double value) {
  //   if (value <= 25.0) {
  //     return 1;
  //   } else if (value <= 50.0) {
  //     return 2;
  //   } else if (value <= 70.0) {
  //     return 3;
  //   } else if (value <= 90.0) {
  //     return 4;
  //   } else {
  //     return 5;
  //   }
  // }

  final List<Item> item = <Item>[
    Item(
        headerValue: 'PH',
        expandedValue:
            'PH é uma medida que serve para medir grau de acidez o alcalinidade numa escala que varia de 0 a 14.\n\nO 7 é neutro, por tanto sim o grau é menor consideramos-la acida e si é maior alcalina. Tem que ter em conta que valores extremos em ambos lados são nocivos para os organismos',
        id: 0),
    Item(
        headerValue: 'Coliformes Termotolerantes ',
        expandedValue:
            'Tambem conoci a presença do oxigeno que permite a supervivencia dos animais e disminuçao do material órganico.\n\nUma presença baixa dos niveis indica um aumento das bacterias que degrada a qualidade e resulta em um olor ruim.',
        id: 1),
    Item(
        headerValue: 'Demanda bioquímica do oxigeno - DBO',
        expandedValue:
            'DBO é a quantidade de oxigênio consumida por microorganismos presentes, issto ajuda na mediaço do nivel de poluçao das aguas.\n\n Um nivel alto do DBO significa um maior grau de poliçao e portanto também de oxigênio presente',
        id: 2),
    Item(
        headerValue: 'Turbidez',
        expandedValue:
            'Podemos entender a turbidez como a presença de particulas em suspensâo ou coloidais\n\nA mediçao é expressada em NTU e o valor máximo permitido para a agua tratada es 1 NTU, acima do qual pode ser considerada turva',
        id: 3),
    Item(
        headerValue: 'Solidos Suspendidos totais - TSS',
        expandedValue:
            'TSS é a quantidade de material suspenso na água, podem resumir-se como às partículas que permanecem na água\n\nEsta medida ajuda tambén a medir o nivel de turbidez e é importante medirla porque uma alta precença de solidos é nocivo para a biodiversidade',
        id: 4)
  ];

  List<IconData> icons = [
    Icons.wash,
    Icons.workspaces_outline,
    Icons.wind_power,
    Icons.water_drop_outlined,
    Icons.webhook
  ];

  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.all(10),
      children: item.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isxExpanded) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  item.isExpanded = item.isExpanded;
                });
              },
              child: ListTile(
                title: Text(
                  item.headerValue,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: Icon(icons[item.id]),
              ),
            );
          },
          body: ListTile(
              title: Center(
            child: Text(item.expandedValue),
          )),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Glossário"),
          content: SingleChildScrollView(child: _buildPanel()),
          actions: <Widget>[
            TextButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _loadCSV();
    //changeColor();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.grey[400],
        elevation: 0,
        onPressed: () {
          _showDialog();
        },
        child: Icon(Icons.question_mark),
      ),
      appBar: AppBar(
        title: Text("Nasa Space Apps"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: initialLocation,
            zoom: 14,
          ),
          markers: {
            Marker(
                markerId: const MarkerId("V.V.Rodão"),
                position: const LatLng(39.647078, -7.676211),
                icon: colorIcon(isExcelent1
                    ? blueColor
                    : isGood1
                        ? greenColor
                        : isMid1
                            ? yellowColor
                            : isBad1
                                ? orangeColor
                                : redColor),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Dados"),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text("O2 Dissolvido: ${_data[0][4].toString()}"),
                              Text("Coliforms: ${_data[0][1].toString()}"),
                              Text("Ph: ${_data[0][7].toString()}"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Fechar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            Marker(
                markerId: const MarkerId("Cais do Arneiro"),
                position: const LatLng(39.610895, -7.712968),
                icon: colorIcon(isExcelent2
                    ? blueColor
                    : isGood2
                        ? greenColor
                        : isMid2
                            ? yellowColor
                            : isBad2
                                ? orangeColor
                                : redColor),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Dados"),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text("O2 Dissolvido: ${_data[0][13].toString()}"),
                              Text("Coliforms: ${_data[0][10].toString()}"),
                              Text("Ph: ${_data[0][16].toString()}"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Fechar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            Marker(
                markerId: const MarkerId("Barragem do Fratel"),
                position: const LatLng(39.543207, -7.799899),
                icon: colorIcon(isExcelent3
                    ? blueColor
                    : isGood3
                        ? greenColor
                        : isMid3
                            ? yellowColor
                            : isBad3
                                ? orangeColor
                                : redColor),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Dados"),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text("O2 Dissolvido: ${_data[0][22].toString()}"),
                              Text("Coliforms: ${_data[0][19].toString()}"),
                              Text("Ph: ${_data[0][25].toString()}"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Fechar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            Marker(
                markerId: const MarkerId("Belver"),
                position: const LatLng(39.479917, -7.997408),
                icon: colorIcon(isExcelent4
                    ? blueColor
                    : isGood4
                        ? greenColor
                        : isMid4
                            ? yellowColor
                            : isBad4
                                ? orangeColor
                                : redColor),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Dados"),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text("O2 Dissolvido: ${_data[0][30].toString()}"),
                              Text("Coliforms: ${_data[0][28].toString()}"),
                              Text("Ph: ${_data[0][34].toString()}"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Fechar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            Marker(
                markerId: const MarkerId("Jusante"),
                position: const LatLng(39.451021, -8.206096),
                icon: colorIcon(isExcelent5
                    ? blueColor
                    : isGood5
                        ? greenColor
                        : isMid5
                            ? yellowColor
                            : isBad5
                                ? orangeColor
                                : redColor),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Dados"),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text("O2 Dissolvido: ${_data[0][39].toString()}"),
                              Text("Coliforms: ${_data[0][37].toString()}"),
                              Text("Ph: ${_data[0][43].toString()}"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Fechar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            Marker(
                markerId: const MarkerId("Constancia"),
                position: const LatLng(39.468369, -8.339157),
                icon: colorIcon(isExcelent6
                    ? blueColor
                    : isGood6
                        ? greenColor
                        : isMid6
                            ? yellowColor
                            : isBad6
                                ? orangeColor
                                : redColor),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Dados"),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text("O2 Dissolvido: ${_data[0][48].toString()}"),
                              Text("Coliforms: ${_data[0][46].toString()}"),
                              Text("Ph: ${_data[0][52].toString()}"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Fechar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
          },
        ),
      ),
    );
  }
}
