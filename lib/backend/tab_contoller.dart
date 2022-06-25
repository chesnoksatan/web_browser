import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_browser/backend/browser_tab.dart';

class BrowserTabController extends ChangeNotifier {
  final List<BrowserTab> tabs = List<BrowserTab>.empty(growable: true);

  int get currentIndex => _index;
  int _index;
  set currentIndex(int value) {
    _changeIndex(value);
  }

  void _changeIndex(int value) {
    print(value);
    if (value == _index || value > tabs.length || value < 0) {
      return;
    }
    print(value);

    _index = value;
    notifyListeners();
  }

  BrowserTabController() : _index = 0 {
    addTab(BrowserTab());
  }

  void addTab(BrowserTab tab) {
    tabs.add(tab);
    notifyListeners();
  }

  void removeTab(BrowserTab tab) {
    final removedTabIndex = tabs.indexOf(tab);
    tabs.remove(tab);
    notifyListeners();

    if (_index >= removedTabIndex) {
      _changeIndex(_index - 1);
    }
  }

  void removeTabByIndex(int index) {
    removeTab(tabs[index]);
  }

  static BrowserTabController of(BuildContext context, {bool listen = true}) {
    return Provider.of<BrowserTabController>(context, listen: listen);
  }
}
