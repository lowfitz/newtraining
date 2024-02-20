import 'package:flutter/material.dart';

class LoadinAndError extends StatelessWidget {
  const LoadinAndError(
      {super.key,
      required this.child,
      required this.isError,
      required this.isLoading,
      this.loadingWidget});
  final Widget child;
  final bool isError;
  final bool isLoading;
  final Widget? loadingWidget;
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget ??
          const Center(
            child: CircularProgressIndicator(),
          );
    } else if (isError) {
      return const Center(
        child: Text("noData"),
      );
    } else {
      return child;
    }
  }
}
