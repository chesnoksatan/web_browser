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

class SearchField extends StatelessWidget {
  final TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox.expand(
        child: Material(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(const Radius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
              maxLines: 1,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
                icon: Icon(
                  Icons.search,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
                hintText: 'Search DuckDuckGo or type a URL',
                border: InputBorder.none,
              ),
              onSubmitted: null,
              controller: editingController,
            ),
          ),
        ),
      ),
    );
  }
}
