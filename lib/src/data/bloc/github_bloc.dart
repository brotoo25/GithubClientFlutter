import 'package:rxdart/rxdart.dart';
import '../repository/repository.dart';
import '../model/git_repository.dart';
import '../model/git_pullrequest.dart';

import 'package:url_launcher/url_launcher.dart';

class GitHubBloc {

  final _repository = Repository();
  final _gitRepositoriesFetcher = BehaviorSubject<List<GitRepository>>();
  final _gitPullRequestsFetcher = PublishSubject<List<GitPullRequest>>();

  Observable<List<GitRepository>> get allRepositories => _gitRepositoriesFetcher.stream;
  Observable<List<GitPullRequest>> get allPullRequests => _gitPullRequestsFetcher.stream;

  fetchRepositories(int page) async {
    List<GitRepository> list = await _repository.fetchRepositoriesByPage(page);
    if (_gitRepositoriesFetcher.value != null) {
      _gitRepositoriesFetcher.value.addAll(list);
      _gitRepositoriesFetcher.sink.add(_gitRepositoriesFetcher.value);
    } else {
      _gitRepositoriesFetcher.sink.add(list);
    }
  }

  fetchPullRequests(GitRepository repository) async {
    List<GitPullRequest> list = await _repository.fetchPullRequests(repository.owner.name, repository.name);
    _gitPullRequestsFetcher.sink.add(list);
  }

  dispose() {
    _gitRepositoriesFetcher.close();
    _gitPullRequestsFetcher.close();
  }

  void selectPullRequest(GitPullRequest pullRequest) async {
    if (await canLaunch(pullRequest.url)) {
      await launch(pullRequest.url);
    } else {
      throw 'Could not launch $pullRequest.url';
    }
  }
}

final bloc = GitHubBloc();