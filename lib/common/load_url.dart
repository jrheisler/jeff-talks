import 'package:universal_html/html.dart' as html;

class UrlUtils {
  UrlUtils._();

  static void open(String url, {required String name}) {
    html.window.open(url, name);
  }
}

class LaunchFile {
  static void launchVault(String title, String pdfPath, String pdfUrl) async {
    UrlUtils.open(pdfUrl, name: pdfPath);
  }

  static void launchUrl(String url) async {
    UrlUtils.open(url, name: '');
  }

}