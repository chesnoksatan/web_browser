import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_browser/backend/browser_tab.dart';
import 'package:web_browser/backend/tab_contoller.dart';

class TabStrip extends StatelessWidget {
  const TabStrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: BrowserTabController.of(context).tabs[index],
                child: Consumer<BrowserTab>(
                  builder: (_, tab, __) => _Tab(
                    selected:
                        BrowserTabController.of(context).currentIndex == index,
                    title: Text(tab.title),
                    canClose: BrowserTabController.of(context).tabs.length > 1,
                    onTap: () => BrowserTabController.of(context, listen: false)
                        .currentIndex = index,
                    onClose: () =>
                        BrowserTabController.of(context, listen: false)
                            .removeTab(tab),
                  ),
                ),
              ),
              itemCount: BrowserTabController.of(context).tabs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
            ),
          ),
          IconButton(
            onPressed: () {
              BrowserTabController.of(context, listen: false)
                  .addTab(BrowserTab());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final bool canClose;
  final bool selected;
  final Widget title;
  final Widget? leading;
  final void Function() onTap;
  final void Function() onClose;

  const _Tab({
    required this.selected,
    required this.title,
    this.leading,
    required this.canClose,
    required this.onTap,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromWidth(240),
      child: Material(
        color: selected
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                if (leading != null) leading!,
                const SizedBox(width: 8),
                Expanded(child: title),
                AnimatedOpacity(
                  opacity: canClose ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: IconButton(
                    onPressed: canClose ? onClose : null,
                    icon: const Icon(Icons.close),
                    iconSize: 16,
                    splashRadius: 16,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints.tight(const Size.square(16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
