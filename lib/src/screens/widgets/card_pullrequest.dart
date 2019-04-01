import 'package:flutter/material.dart';
import '../../data/model/git_pullrequest.dart';

Widget cardPullRequest(GitPullRequest pullRequest) {
  return Card(
    elevation: 5,
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    pullRequest.title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    pullRequest.body,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                      NetworkImage(pullRequest.user.avatar),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        children: <Widget>[
                          Text(pullRequest.user.name),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}