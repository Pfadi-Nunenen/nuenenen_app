import 'package:nuenenen_app/ui/screens/main.dart';
import 'package:nuenenen_app/ui/widgets/spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  static const routeName = '/';

  const InitialScreen({Key? key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _redirectToHome();
  }

  Future<void> _redirectToHome() async {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MainScreen(),
        transitionDuration: Duration.zero,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return const ContainerWithSpinner();
  }
}
