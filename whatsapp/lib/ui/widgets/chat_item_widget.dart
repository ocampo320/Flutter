import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat.dart';

class ChatItemWidget extends StatelessWidget {
  final Chat chat;

  ChatItemWidget({this.chat});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0)
                  .copyWith(top: 12.0),
              child: CircleAvatar(
                radius: 32.0,
                backgroundImage: NetworkImage(
                    'https://almomento.mx/wp-content/uploads/2020/03/Amazon-Prime-Video-Abril-2020-1.jpg'),
              ),
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
                          chat.name,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          'Yesterday',
                          style: TextStyle(
                            color: Color(0xFF757575),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              chat.mostRecentMessage,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Color(0xFF757575),
                              ),
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
