import 'dart:io';

import 'package:nuenenen/models/song.dart';
import 'package:nuenenen/providers/audio_provider.dart';
import 'package:nuenenen/providers/cache_provider.dart';
import 'package:nuenenen/ui/widgets/simple_song_list.dart';
import 'package:nuenenen/ui/widgets/song_row.dart';
import 'package:nuenenen/ui/widgets/typography.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../extensions/widget_tester_extension.dart';
import '../../utils.dart';
import 'simple_song_list_test.mocks.dart';

@GenerateMocks([AudioProvider])
void main() {
  late MockAudioProvider audioMock;

  setUpAll(() async {
    // Mock path_provider plugin channel call, as CacheProvider uses it to
    // get the temporary folder for caching.
    final directory = await Directory.systemTemp.createTemp();

    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      return directory.path;
    });
  });

  setUp(() {
    audioMock = MockAudioProvider();
    when(audioMock.player).thenReturn(AssetsAudioPlayer());
  });

  Future<void> _mount(
    WidgetTester tester, {
    List<Song>? songs,
    String? heading,
    void Function()? onTap,
  }) async {
    await tester.pumpAppWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AudioProvider>(create: (_) => audioMock),
          ChangeNotifierProvider<CacheProvider>(create: (_) => CacheProvider()),
        ],
        child: SimpleSongList(
          songs: songs ?? Song.fakeMany(4),
          headingText: heading,
          onHeaderTap: onTap,
        ),
      ),
    );
  }

  testWidgets('renders the song rows', (WidgetTester tester) async {
    await _mount(tester);
    expect(find.byType(SongRow), findsNWidgets(4));
  });

  testWidgets('does not render the heading', (WidgetTester tester) async {
    await _mount(tester);
    expect(find.byType(Heading5), findsNothing);
  });

  testWidgets('renders the heading', (WidgetTester tester) async {
    await _mount(tester, heading: 'Banana Leaves');
    expect(find.text('Banana Leaves'), findsOneWidget);
  });

  testWidgets('invokes tap function on heading', (WidgetTester tester) async {
    var onTap = Callable();
    await _mount(tester, heading: 'Banana Leaves', onTap: onTap);
    await tester.tap(find.text('Banana Leaves'));
    expect(onTap.called, isTrue);
  });
}
