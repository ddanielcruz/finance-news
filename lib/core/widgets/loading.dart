import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static List<Widget> withOpacity() {
    return [
      ModalBarrier(
        color: Colors.black.withOpacity(.25),
        dismissible: false,
      ),
      const Loading(),
    ];
  }
}
