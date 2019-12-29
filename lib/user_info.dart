import 'package:fluro/fluro.dart';

final router = Router();

double appVersion = 2.0;
int appBuild = 4;
String appStatus = "";
String appFull = "Version $appVersion";

int lastPage = 0;
bool offlineMode = false;
bool darkMode = false;

String baseURI = "https://pfadi-nuenenen.ch";

String biberID = "214";
String wolfID = "215";
String aetnaID = "203";
String saturnID = "213";