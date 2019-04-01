class GitPullRequest {

  final title;
  final body;
  final url;
  final User user;

  GitPullRequest(this.title, this.body, this.url, this.user);

  GitPullRequest.fromJson(Map<String, dynamic> parsedJson)
      : title = parsedJson['title'],
        body = parsedJson['body'],
        url = parsedJson['url'],
        user = User.fromJson(parsedJson["user"]);
}

class User {
  
  final name;
  final avatar;
  
  User(this.name, this.avatar);

  User.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['login'],
        avatar = parsedJson['avatar_url'];
}