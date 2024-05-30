import 'package:url_launcher/url_launcher.dart';

class TorrentHandler {
  final String torrentUrl;
  TorrentHandler({required this.torrentUrl});

  void openTorrent() async {
    final Uri? downloadUri = Uri.tryParse(torrentUrl);
    if(downloadUri == null) {
      throw Exception("Invalid url");
    }
    if (await canLaunchUrl(downloadUri)) {
      await launchUrl(downloadUri);
    } else {
      throw Exception("Could not launch");
    }
  }
}
