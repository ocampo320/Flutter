import 'package:coronaapp/page/colombia_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Api_page.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: (TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.public)),
                  Tab(icon: Icon(Icons.favorite)),
                ],
              )),
              title: Text(
                'Informacion Covid-19',
                textAlign: TextAlign.center,
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                new Colombia_Page(),
                new ApiPage(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: <Widget>[
                      Image.network(
                          "https://osfe.org.ar/wp-content/uploads/2018/05/Redes-Lavado-de-Manos-01-962x1024.jpg"),
                      Image.network(
                          "https://pbs.twimg.com/media/Cmj01ZUXYAAm1NY.jpg"),
                      Image.network(
                          "https://pbs.twimg.com/media/ETyuokyWsAErlmV.jpg"),
                      Image.network(
                          "https://lh3.googleusercontent.com/proxy/50yOTNh0Lm_oMz4uufEiQXKCwQMwniEbLpciMe7YM0LdL8CDizPxavaWkCetXkF33sBb50NA5yrZIvNehrgBhJh9lPQP8vTsjLXEfWJZxZ09xnKfFIt00EXpHhSB5IYugS_RcpocogGwEOeitjlkpg0NxCkf0yMlgdO3Xhqd31_Wi1IAfDDQxIP3Z0iQV60iIq0"),
                      Image.network(
                          "https://lh3.googleusercontent.com/proxy/XFs31vzvSs42CrCtz02RfG7Zw2O4r-WYucrX-HffwQPbF3J-67V2vJcPNAZfr9OEs-PQlP_hzUQ5CyDrFReJCogJIl0szXmst5JBSRLbCY-8EzZ_VnC_cRcBfz5hV4EX72RHJPCD2uRSfKdQhRIfJghR0h1x2Qjqn2YjWWjB4EWDC8u7Soox5Dnpq65xSL4"),
                    ],
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.lightBlueAccent),
      ),
    );
  }
}
