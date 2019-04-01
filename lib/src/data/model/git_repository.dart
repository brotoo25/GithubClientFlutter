class GitRepository {

  final name;
  final description;
  final forks;
  final stars;
  final Owner owner;

  GitRepository(this.name, this.description, this.forks, this.stars, this.owner);

  GitRepository.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        description = parsedJson['description'] ?? "",
        forks = parsedJson['forks'],
        stars = parsedJson['stargazers_count'],
        owner = Owner.fromJson(parsedJson['owner']);
}

class Owner {

  final name;
  final avatar;

  Owner(this.name, this.avatar);

  Owner.fromJson(Map<String, dynamic> json)
      : name = json['login'],
        avatar = json['avatar_url'];
}