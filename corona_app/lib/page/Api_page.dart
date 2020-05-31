import 'package:coronaapp/domain/country_domain.dart';
import 'package:coronaapp/domain/global_domain.dart';
import 'package:coronaapp/domain/summary_response.dart';
import 'package:coronaapp/widgets/data_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiPage extends StatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  Future<SummaryResponse> summaryFuture;
  Future<List<Country>> countriesList;

  @override
  void initState() {
    super.initState();
    summaryFuture = getSumaryData();
    countriesList = summaryFuture.then((value) => value.countries);
    print(countriesList);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Informacion Global",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.network(
                      "https://images.vexels.com/media/users/3/158107/isolated/preview/47f959b44e275b27409731f29c37db02-icono-del-planeta-tierra-by-vexels.png",
                      height: 100,
                      width: 100,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: DataItem(
                                      title: 'Confirmados en el Mundo',
                                      number: getGlobalData(snapshot.data)
                                              .totalConfirmed
                                              .toString() ??
                                          '',
                                      colorNumber: Colors.red,
                                    ),
                                  ),
                                  Expanded(
                                    child: DataItem(
                                      title: 'Muertos en el Mundo',
                                      number: getGlobalData(snapshot.data)
                                              .totalDeaths
                                              .toString() ??
                                          '',
                                      colorNumber: Colors.red,
                                    ),
                                  ),
                                  Expanded(
                                    child: DataItem(
                                      title: 'Recuperados en el Mundo',
                                      number: getGlobalData(snapshot.data)
                                              .newRecovered
                                              .toString() ??
                                          '',
                                      colorNumber: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                summaryFuture = getSumaryData();
                              });
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Paises con Covid-19",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            countriesList = countriesList.then((value) =>
                                Future.value(value.reversed.toList()));
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.sort_by_alpha),
                            Text("Ordenar")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        FutureBuilder<List<Country>>(
            future: countriesList,
            initialData: [],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SliverList(
                  delegate: SliverChildListDelegate(snapshot.data
                      .map(
                        (e) => _CountryItem(
                          country: e,
                        ),
                      )
                      .toList()),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        summaryFuture = getSumaryData();
                        countriesList =
                            summaryFuture.then((value) => value.countries);
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.refresh, color: Colors.white),
                        Text(
                          "Reintentar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              }
            })
      ],
    ));
  }

  Future<SummaryResponse> getSumaryData() async {
    final response = await http.get("https://api.covid19api.com/summary");
    if (response.statusCode == 200) {
      var summaryResponse =
          SummaryResponse.fromJson(json.decode(response.body));
      print(summaryResponse?.global?.totalDeaths ?? 0);
      return summaryResponse;
    } else {
      throw Exception('fallo la data');
    }
  }

  Global getGlobalData(SummaryResponse summary) {
    return summary.global;
  }

  Country getColombiaData(SummaryResponse summary) {
    return summary?.countries
            ?.firstWhere((country) => country.slug == 'colombia') ??
        Country();
  }
}

class _CountryItem extends StatelessWidget {
  final Country country;

  _CountryItem({this.country});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    country?.country ?? '',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
              _CountryIconsItems(
                  icon: Icons.check_circle,
                  data: country?.totalConfirmed?.toString() ?? '',
                  color: Colors.red),
              _CountryIconsItems(
                icon: Icons.sentiment_very_dissatisfied,
                data: country?.totalDeaths?.toString() ?? '',
                color: Colors.black,
              ),
              _CountryIconsItems(
                icon: Icons.favorite_border,
                data: country?.totalRecovered?.toString() ?? '',
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}

/**
 *
 */
class _CountryIconsItems extends StatelessWidget {
  final String data;
  final IconData icon;
  final Color color;

  _CountryIconsItems({this.data, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              icon,
              color: color,
              size: 15.0,
            ),
          ),
          Text(
            data,
            style: TextStyle(color: color, fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
