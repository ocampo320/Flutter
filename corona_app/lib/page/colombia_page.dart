import 'dart:convert';

import 'package:coronaapp/domain/country_domain.dart';
import 'package:coronaapp/domain/summary_response.dart';
import 'package:coronaapp/widgets/data_item.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Colombia_Page extends StatefulWidget {
  @override
  _Colombia_PageState createState() => _Colombia_PageState();
}

class _Colombia_PageState extends State<Colombia_Page> {
  Future<SummaryResponse> summaryFuture;

  @override
  void initState() {
    super.initState();
    summaryFuture = getSummaryData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 8.0,
                    ),
                    child: Text(
                      'Covid-19 en Colombia',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      child: ClipOval(
                        child: Flag(
                          'CO',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: FutureBuilder<SummaryResponse>(
                          future: summaryFuture,
                          initialData: SummaryResponse(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: <Widget>[
                                  _itemCard(
                                      title:
                                          "Confirmados hoy: ${getDataColombia(snapshot?.data)?.newConfirmed?.toString() ?? " "}",
                                      iconData: Icons.sentiment_dissatisfied),
                                  _itemCard(
                                      title:
                                          "Fallecidos hoy: ${getDataColombia(snapshot?.data)?.totalDeaths?.toString() ?? " "}",
                                      iconData:
                                          Icons.sentiment_very_dissatisfied),
                                  _itemCard(
                                      title:
                                          "Recuperdos hot: ${getDataColombia(snapshot?.data)?.totalRecovered?.toString() ?? " "}",
                                      iconData: Icons.mood),
                                  _itemCard(
                                      title:
                                          "Total Confirmdos: ${getDataColombia(snapshot?.data)?.totalConfirmed?.toString() ?? " "}",
                                      iconData: Icons.sentiment_neutral),
                                  _itemCard(
                                      title:
                                          "Total Fallecidos: ${getDataColombia(snapshot?.data)?.newConfirmed?.toString() ?? " "}",
                                      iconData:
                                          Icons.sentiment_very_dissatisfied),
                                  _itemCard(
                                      title:
                                          "Total Recuperados: ${getDataColombia(snapshot?.data)?.totalDeaths?.toString() ?? " "}",
                                      iconData: Icons.sentiment_very_satisfied),
                                ],
                              );
                            }
                          }))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Country getDataColombia(SummaryResponse dataColombia) {
  return dataColombia?.countries
          ?.firstWhere((country) => country.slug == "colombia") ??
      Country();
}

Future<SummaryResponse> getSummaryData() async {
  final response = await http.get('https://api.covid19api.com/summary');
  if (response.statusCode == 200) {
    return SummaryResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class _itemCard extends StatelessWidget {
  final String title;
  final IconData iconData;

  _itemCard({this.title, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: ListTile(leading: Icon(iconData), title: Text(title)),
      ),
    );
  }
}
