import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';

extension StringExtention on String {
  String validateTweetLink() {
    return this;
  }

  String extractTweetId() {
    final url = Uri.parse(this.removeQueryParams());
    return url.pathSegments[2];
  }

  String removeQueryParams() {
    if (this.contains("?")) {
      return this.substring(0, this.indexOf('?'));
    }
    return this;
  }

  bool validateTweet() {
    final regex = new RegExp(
      "http(?:s)?:\/\/(?:www\.)?twitter\.com\/([a-zA-Z0-9_]+)\/status\/([0-9]+)",
    );
    return regex.hasMatch(this);
  }

  String utf8convert() {
    List<int> byetes = this.toString().codeUnits;
    return utf8.decode(byetes);
  }

  String convertToData() {
    String dateval = DateFormat("hh:mm aa dd MMM yyyy").format(
      DateTime.parse(this),
    );
    return dateval;
  }

  String truncateText() {
    return "${this.substring(0, min(this.length, 10))}${this.length > 9 ? '....' : ''}";
  }
}
