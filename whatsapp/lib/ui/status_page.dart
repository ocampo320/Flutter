import 'package:flutter/material.dart';
import 'package:whatsapp/models/status.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            _StatusItem(
              isMyStatus: true,
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent updates',
              style: Theme.of(context).textTheme.subhead.copyWith(
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _StatusItem(),
            _StatusItem(),
            _StatusItem(),
            _StatusItem(),
          ]),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Viewed updates',
              style: Theme.of(context).textTheme.subhead.copyWith(
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _StatusItem(),
            _StatusItem(),
          ]),
        ),
      ],
    );
  }
}

class _StatusItem extends StatelessWidget {
  final Status status;
  final bool isMyStatus;

  _StatusItem({
    this.status,
    this.isMyStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0)
                      .copyWith(top: 12.0),
                  child: CircleAvatar(
                    radius: isMyStatus ? 30.0 : 32.0,
                    backgroundImage: NetworkImage(
                        'https://cdn.tn.com.ar/sites/default/files/styles/1366x765/public/2018/08/21/homeroportada2.jpg'),
                  ),
                ),
                isMyStatus
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipOval(
                          child: Material(
                            color: Theme.of(context)
                                .floatingActionButtonTheme
                                .backgroundColor, // button color
                            child: InkWell(
                              child: SizedBox(
                                width: 24.0,
                                height: 24.0,
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Camilo Cubillos',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '40 minutes ago',
                            style: TextStyle(
                              color: Color(0xFF757575),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 88.0,
            top: 8.0,
            right: 16.0,
          ),
          child: Divider(
            height: 0.0,
          ),
        ),
      ],
    );
  }
}
