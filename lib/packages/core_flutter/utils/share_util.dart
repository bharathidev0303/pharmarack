import 'package:share_plus/share_plus.dart';

void shareLink(String urlLink) {
  Share.shareUri(Uri.parse(urlLink));
}
