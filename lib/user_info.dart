import 'package:fluro/fluro.dart';

final router = FluroRouter();

double appVersion = 3.1;
int appBuild = 12;
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

bool biberNotification = false;
bool wolfNotification = false;
bool aetnaNotification = false;
bool saturnNotification = false;
