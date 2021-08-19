import 'package:tech_world/services/git_hub_service.dart';

class Locator {
  static GitHubService getGitHubService() => _gitHubService ?? GitHubService();

  // Provide one or more
  static void provide({GitHubService? gitHubService}) {
    _gitHubService = gitHubService;
  }

  static void provideAll({required GitHubService gitHubService}) {
    _gitHubService = gitHubService;
  }

  static GitHubService? _gitHubService;
}
