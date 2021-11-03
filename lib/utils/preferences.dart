import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage storage = GetStorage();

void _set(String key, dynamic value) => storage.write(key, value);

T? _get<T>(String key) => storage.read(key);

void _delete(String key) => storage.remove(key);

set hostUrl(String? url) => _set('hostUrl', url);

set apiToken(String? token) =>
    token == null ? _delete('apiToken') : _set('apiToken', token);

String? get apiToken => _get<String>('apiToken');

set userEmail(String? email) => _set('email', email);

String? get userEmail => _get<String>('email');

set loopMode(LoopMode mode) => _set(
      'loopMode',
      EnumToString.convertToString(mode),
    );

LoopMode get loopMode {
  String? loopModeAsString = _get('loopMode');

  return EnumToString.fromString(LoopMode.values, loopModeAsString ?? '') ??
      LoopMode.none;
}

set volume(double volume) => _set('volume', volume);

double get volume => _get<double>('volume') ?? 0.7;

String get hostUrl => 'https://pfadi-nuenenen.ch';

String get defaultImageUrl => '$hostUrl/images/unknown-album.png';

String get apiBaseUrl => '$hostUrl/node';

String get apiUrlBiber => '$apiBaseUrl/214/json';
String get apiUrlWolf => '$apiBaseUrl/215/json';
String get apiUrlAetna => '$apiBaseUrl/203/json';
String get apiUrlSaturn => '$apiBaseUrl/213/json';
