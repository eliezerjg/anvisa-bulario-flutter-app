import 'package:flutter/material.dart';

class SimpleLoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  SimpleLoadingOverlay(
     this.isLoading,
     {required this.child}
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isLoading
            ? Container(
          color: Colors.black45,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        )
            : Container(),
      ],
    );
  }
}