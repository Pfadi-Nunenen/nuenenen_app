import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:nuenenen/providers/album_provider.dart';
import 'package:nuenenen/providers/artist_provider.dart';
import 'package:nuenenen/providers/audio_provider.dart';
import 'package:nuenenen/providers/auth_provider.dart';
import 'package:nuenenen/providers/cache_provider.dart';
import 'package:nuenenen/providers/data_provider.dart';
import 'package:nuenenen/providers/interaction_provider.dart';
import 'package:nuenenen/providers/media_info_provider.dart';
import 'package:nuenenen/providers/playlist_provider.dart';
import 'package:nuenenen/providers/search_provider.dart';
import 'package:nuenenen/providers/song_provider.dart';
import 'package:nuenenen/ui/app.dart';

List<SingleChildWidget> _providers = [
  Provider(create: (_) => AuthProvider()),
  ChangeNotifierProvider(create: (_) => ArtistProvider()),
  Provider(create: (_) => MediaInfoProvider()),
  ChangeNotifierProvider(create: (_) => CacheProvider()),
  ChangeNotifierProvider(
    create: (context) => AlbumProvider(
      artistProvider: context.read<ArtistProvider>(),
    ),
  ),
  Provider(
    create: (context) => SongProvider(
      artistProvider: context.read<ArtistProvider>(),
      albumProvider: context.read<AlbumProvider>(),
      cacheProvider: context.read<CacheProvider>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => InteractionProvider(
      songProvider: context.read<SongProvider>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => PlaylistProvider(
      songProvider: context.read<SongProvider>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => AudioProvider(
      songProvider: context.read<SongProvider>(),
      interactionProvider: context.read<InteractionProvider>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => SearchProvider(
      songProvider: context.read<SongProvider>(),
      artistProvider: context.read<ArtistProvider>(),
      albumProvider: context.read<AlbumProvider>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => DataProvider(
      songProvider: context.read<SongProvider>(),
      artistProvider: context.read<ArtistProvider>(),
      albumProvider: context.read<AlbumProvider>(),
      playlistProvider: context.read<PlaylistProvider>(),
    ),
  ),
];

Future<void> main() async {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });

  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: _providers,
      child: App(),
    ),
  );
}
