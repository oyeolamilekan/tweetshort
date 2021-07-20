import 'package:flutter/material.dart';
import '../const/appstate.dart';

class STEMSuspense extends StatelessWidget {
  final AppState? appState;
  final bool optionalCondtion;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Function(BuildContext widget) successWidget;

  const STEMSuspense({
    Key? key,
    this.appState,
    this.errorWidget,
    required this.successWidget,
    this.optionalCondtion = false,
    this.loadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (appState == AppState.none || optionalCondtion) {
      return successWidget(context);
    } else if (appState == AppState.loading) {
      return loadingWidget!;
    } else {
      return errorWidget ?? Container();
    }
  }
}
