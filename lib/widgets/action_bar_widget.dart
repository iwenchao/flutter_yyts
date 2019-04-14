import 'package:flutter/material.dart';

class ActonBarView extends StatelessWidget {
  final String likes;
  final String comments;
  final Function onComment;
  final Function onLike;
  final bool liked;

  ActonBarView(
      {Key key,
      this.likes,
      this.comments,
      this.onComment,
      this.onLike,
      this.liked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: onComment,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.comment,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  comments,
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          ),
          Container(
            width: 1,
            height: 30,
            padding: EdgeInsets.symmetric(vertical: 4),
            color: Colors.grey[200],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                color: liked ? Colors.red : Colors.grey[400],
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                likes,
                style: TextStyle(color: Colors.grey[400]),
              )
            ],
          )
        ],
      ),
    );
  }
}
