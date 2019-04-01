import 'package:flutter/material.dart';
import '../../data/model/git_repository.dart';

Widget cardRepository(GitRepository repository) {
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
                    repository.name,
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
                    repository.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.share,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                        right: 16,
                      ),
                      child: Text(
                        repository.forks.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        repository.stars.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                    NetworkImage(repository.owner.avatar),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: <Widget>[
                        Text(repository.owner.name),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}