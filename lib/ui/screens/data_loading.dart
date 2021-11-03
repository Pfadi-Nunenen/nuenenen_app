import 'package:nuenenen_app/providers/data_provider.dart';
import 'package:nuenenen_app/ui/screens/main.dart';
import 'package:nuenenen_app/ui/widgets/oops_box.dart';
import 'package:nuenenen_app/ui/widgets/spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataLoadingScreen extends StatefulWidget {
  static const routeName = '/loading';

  const DataLoadingScreen({Key? key}) : super(key: key);

  @override
  _DataLoadingScreen createState() => _DataLoadingScreen();
}

class _DataLoadingScreen extends State<DataLoadingScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MainScreen(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const ZoomPageTransitionsBuilder().buildTransitions(
              null,
              context,
              animation,
              secondaryAnimation,
              child
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ContainerWithSpinner(),
    );
  }
}
