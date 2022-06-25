import 'package:flutter/material.dart';
import 'package:web_browser/widgets/search_field.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
                splashRadius: 16,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {},
                splashRadius: 16,
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {},
                splashRadius: 16,
              ),
              SearchField(),
              IconButton(
                icon: const Icon(Icons.star_border),
                onPressed: () {},
                splashRadius: 16,
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                splashRadius: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
