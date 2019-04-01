import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/git_repository.dart';
import '../../model/git_pullrequest.dart';

class GitHubApiProvider {

  static const _baseUrl = 'https://api.github.com';

  Future<List<GitRepository>> fetchRepositories(int page) async {
    final url = '$_baseUrl/search/repositories?q=language:Dart&sort=stars&page=$page';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      final repositories = parsedJson["items"].map<GitRepository>((item) => GitRepository.fromJson(item)).toList();

      return repositories;
    } else {
      throw Exception('Failed to load Repositories List.');
    }
  }

  Future<List<GitPullRequest>> fetchPullRequests(String user, String repo) async {
    final url = '$_baseUrl/repos/$user/$repo/pulls';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      final pullrequests = parsedJson.map<GitPullRequest>((item) => GitPullRequest.fromJson(item)).toList();

      return pullrequests;
    } else {
      throw Exception('Failed to load Repositories List.');
    }
  }
}
