import 'dart:core';
import 'common.dart';
import 'load_url.dart';


class MyEmail {
  final String path;
  final String subject;
  final String message;

  MyEmail(this.path, this.subject, this.message);

  void send() {

      String body = 'To $appTitle:'
          '%0D%0A'
          '%0D%0A'
          'Description: $message';


      String mail = 'mailto:$path?subject=${emailText(subject)}&body=${emailText(body)}';
      LaunchFile.launchUrl(mail);
    }


}

String emailText(String string) {
  return string;
}
