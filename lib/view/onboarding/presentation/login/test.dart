import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/login_screen_cubit.dart';

class Testwidget extends StatefulWidget {
  final loginScreenCubit;

  const Testwidget({super.key, required this.loginScreenCubit});

  @override
  State<Testwidget> createState() => _TestwidgetState();
}

class _TestwidgetState extends State<Testwidget> {
  @override
  Widget build(BuildContext context) {
    return const Text("hello");
  }
}
