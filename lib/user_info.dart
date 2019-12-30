import 'package:fluro/fluro.dart';

final router = Router();

double appVersion = 3.0;
int appBuild = 9;
String appStatus = "";
String appFull = "Version $appVersion";

int lastPage = 0;
bool offlineMode = false;
bool darkMode = true;

String baseURI = "https://pfadi-nuenenen.ch";

String biberID = "214";
String wolfID = "215";
String aetnaID = "203";
String saturnID = "213";

bool biberNotification = false;
bool wolfNotification = false;
bool aetnaNotification = false;
bool saturnNotification = false;