import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:web_browser/widgets/control_panel.dart';
import 'package:web_browser/widgets/tab_strip.dart';

class Browser extends StatelessWidget {
  const Browser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            const TabStrip(),
            const ControlPanel(),
            Expanded(
              child: PageTransitionSwitcher(
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return SharedAxisTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.scaled,
                    fillColor: Colors.transparent,
                    child: child,
                  );
                },
                child: SizedBox.expand(
                  child: Center(
                    child: const Text(
                        "Flutter 3 Does not support Webview on Desktop"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
