import 'package:flutter/material.dart';

import 'pullrequest_screen.dart';
import 'widgets/card_repository.dart';
import '../data/bloc/github_bloc.dart';
import '../data/model/git_repository.dart';

class RepositoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RepositoryListState();
  }
}

class RepositoryListState extends State<RepositoryList> {

  int page = 1;
  bool isLoading = false;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        loadMore();
      }
    });

    bloc.fetchRepositories(page);
  }

  @override
  void dispose() {
    bloc.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dart Repositories'),
      ),
      body: StreamBuilder(
        stream: bloc.allRepositories,
        builder: (context, AsyncSnapshot<List<GitRepository>> snapshot) {
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

  Widget buildList(AsyncSnapshot<List<GitRepository>> snapshot) {
    return Container(
      child: ListView.builder(
          controller: _scrollController,
          itemCount: snapshot.data.length + 1,
          itemBuilder: (context, index) {
            if (index < snapshot.data.length) {
              var repository = snapshot.data[index];

              return new InkWell(
                onTap: () {
                  bloc.fetchPullRequests(repository);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => PullRequestList(),
                      ));
                },
                child: cardRepository(repository),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Opacity(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                  opacity: isLoading ? 1 : 0,
                ),
              ),
            );
          }),
    );
  }

  loadMore() async {
    if (!isLoading) {
      setState(() => isLoading = true);
    }

    await bloc.fetchRepositories(++page);
    isLoading = false;
    setState(() {});
  }
}
