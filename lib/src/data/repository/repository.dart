import 'dart:async';
import 'network/github_api_provider.dart';
import '../model/git_repository.dart';
import '../model/git_pullrequest.dart';

class Repository {

  final apiProvider = GitHubApiProvider();

  Future<List<GitRepository>> fetchRepositoriesByPage(int page) =>
      apiProvider.fetchRepositories(page);

  Future<List<GitPullRequest>> fetchPullRequests(String user, String repo) =>
      apiProvider.fetchPullRequests(user, repo);
}