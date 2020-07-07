import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class PlatformService {
  PlatformService();

  Future<void> redirect(Uri authorizationUrl) async {
    var url = authorizationUrl.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<String> getStoredGitHubToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('githubAuthToken');
  }

  Future<bool> storeGitHubToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('githubAuthToken', token);
  }
}
