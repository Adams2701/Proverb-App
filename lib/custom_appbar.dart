import 'package:flutter/material.dart';
import 'package:nda_proverb_project/context_extension.dart';
import 'dual_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final VoidCallback? backButtonCallback;
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final bool showDivider;

  /// replaces the content of the appBar
  final Widget? bodyOverride;

  const CustomAppBar({
    Key? key,
    this.showBackButton = false,
    this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.backButtonCallback,
    this.showDivider = true,
    this.bodyOverride,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? context.themeData.scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(top: context.screenPadding.top),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: context.themeData.dividerColor),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: context.cardColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: bodyOverride ??
                  Row(
                    children: [
                      DualWidget.nullable(
                        value: showBackButton,
                        trueWidget: InkWell(
                          onTap: backButtonCallback ??
                                  () => Navigator.pop(context),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.arrow_back_ios, size: 20),
                          ),
                        ),
                      ),
                      if (leading != null) leading!,
                      Expanded(
                        child: DualWidget.nullable(
                          value: title != null,
                          trueWidget: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "$title",
                              style: context.textTheme.displayLarge,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      if (actions != null) ...actions ?? [],
                    ],
                  ),
            ),
            if (showDivider) const Divider(height: 0),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(92);
}

// class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final bool showBackButton;
//   final VoidCallback? backButtonCallback;
//   final String? title;
//   final Widget? leading;
//   final Color? backgroundColor;
//   final bool? showDivider;
//   final TextEditingController? controller;
//   final String? searchHintText;
//   final bool searchOnChange;
//   final List<Widget> moreActions;
//
//   /// exposes the search field text and searchNotifier
//   ///
//   /// ```dart
//   /// onSearch: (query, notifier){
//   ///     log(query);
//   ///     notifier.value = false;
//   ///   }
//   /// ```
//   final Function(String query, ValueNotifier<bool>)? onSearch;
//   final VoidCallback? onClearSearch;
//   const SearchAppBar({
//     Key? key,
//     required this.showBackButton,
//     this.backButtonCallback,
//     this.title,
//     this.leading,
//     this.backgroundColor,
//     this.showDivider,
//     this.controller,
//     this.searchHintText,
//     this.onSearch,
//     this.onClearSearch,
//     this.searchOnChange = false,
//     this.moreActions = const [],
//   }) : super(key: key);
//   @override
//   State<SearchAppBar> createState() => _SearchAppBarState();
//   @override
//   Size get preferredSize => Size.fromHeight(92);
// }

// class _SearchAppBarState extends State<SearchAppBar> {
//   final searchNotifier = ValueNotifier<bool>(false);
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//       valueListenable: searchNotifier,
//       builder: (BuildContext context, bool isSearch, Widget? child) {
//         if (isSearch) {
//           return CustomAppBar(
//             showBackButton: true,
//             bodyOverride: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 DualWidget.nullable(
//                   value: widget.showBackButton,
//                   trueWidget: InkWell(
//                     onTap: widget.backButtonCallback ??
//                             () => Navigator.pop(context),
//                     child: Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Icon(Icons.arrow_back_ios, size: 20),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextFormField(
//                     autofocus: true,
//                     onFieldSubmitted: (value) {
//                       widget.onSearch?.call(value, searchNotifier);
//                     },
//                     onChanged: (value) {
//                       if (widget.searchOnChange) {
//                         widget.onSearch?.call(value, searchNotifier);
//                       }
//                     },
//                     controller: widget.controller,
//                     textInputAction: TextInputAction.search,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.only(left: 16, top: 1),
//                       border: InputBorder.none,
//                       enabledBorder: InputBorder.none,
//                       hintText: widget.searchHintText ?? "Search...",
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     searchNotifier.value = false;
//                     widget.onClearSearch?.call();
//                   },
//                   child: Icon(Icons.close),
//                 ),
//               ],
//             ),
//           );
//         }
//
//         return CustomAppBar(
//           showBackButton: widget.showBackButton,
//           title: widget.title,
//           backgroundColor: widget.backgroundColor,
//           showDivider: widget.showDivider ?? true,
//           leading: widget.leading,
//           backButtonCallback: widget.backButtonCallback,
//           actions: [
//             InkWell(
//               onTap: () => searchNotifier.value = true,
//               child: SvgRenderWidget(svgPath: SvgPath.searchRed),
//             ),
//             ...widget.moreActions,
//           ],
//         );
//       },
//     );
//   }
// }
