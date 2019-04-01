import 'package:flutter/material.dart';

import 'widgets/card_pullrequest.dart';
import '../data/bloc/github_bloc.dart';
import '../data/model/git_pullrequest.dart';

class PullRequestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pull Requests'),
      ),
      body: StreamBuilder(
        stream: bloc.allPullRequests,
        builder: (context, AsyncSnapshot<List<GitPullRequest>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<GitPullRequest>> snapshot) {
    return Container(
      child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            var pullRequest = snapshot.data[index];

            return new InkWell(
              onTap: () {
                bloc.selectPullRequest(pullRequest);
              },
              child: cardPullRequest(pullRequest),
            );
          }),
    );
  }
}