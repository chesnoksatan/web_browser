import 'package:flutter/material.dart';

class BrowserTab extends ChangeNotifier {
  String title;
  String url;

  BrowserTab({this.title = "New Tab", this.url = ""});
}
