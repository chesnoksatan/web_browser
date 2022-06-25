/*
Copyright 2019 The dahliaOS Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_browser/backend/tab_contoller.dart';
import 'package:web_browser/browser.dart';

void main() => runApp(BrowserApp());

class BrowserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Browser',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepOrange,
          primaryVariant: Colors.deepOrange,
          secondary: Colors.deepOrange,
          secondaryVariant: Colors.deepOrange,
          background: Color(0xFF161616),
          surface: Color(0xFF212121),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: Colors.white,
          onSurface: Colors.white,
          onError: Colors.white,
        ),
        scrollbarTheme: ScrollbarThemeData(
          isAlwaysShown: true,
          showTrackOnHover: true,
          trackBorderColor: MaterialStateProperty.all(Colors.transparent),
          crossAxisMargin: 0,
          mainAxisMargin: 0,
          radius: Radius.zero,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => BrowserTabController(),
        builder: (context, child) => const Browser(),
      ),
    );
  }
}
