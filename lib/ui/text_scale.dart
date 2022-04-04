import 'package:flutter/cupertino.dart';

class TextScaleFactorClamper extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TextScaleFactorClamper({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final num constrainedTextScaleFactor =
        mediaQueryData.textScaleFactor.clamp(1.0, 1.3);

    return MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: constrainedTextScaleFactor as double?,
      ),
      child: child,
    );
  }
}