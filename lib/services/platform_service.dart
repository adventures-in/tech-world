import 'package:adventures_in_tech_world/utils/git_hub_redirect.dart'
    as git_hub_redirect;
import 'package:url_launcher/url_launcher.dart';

class PlatformService {
  PlatformService();

  Future<void> redirectWithState(String state) async {
    final url = git_hub_redirect.uriWith(state: state).toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
