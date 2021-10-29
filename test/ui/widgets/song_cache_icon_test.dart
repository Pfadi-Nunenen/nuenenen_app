import 'package:nuenenen_app/models/song.dart';
import 'package:nuenenen_app/providers/cache_provider.dart';
import 'package:nuenenen_app/ui/widgets/song_cache_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../extensions/widget_tester_extension.dart';
import 'song_cache_icon_test.mocks.dart';

@GenerateMocks([CacheProvider, FileInfo])
void main() {
  late MockCacheProvider cacheMock;
  late Song song;
  late BehaviorSubject<bool> cacheCleared;
  late BehaviorSubject<SongCached> songCached;
  late BehaviorSubject<Song> singleCacheRemoved;

  setUp(() {
    cacheMock = MockCacheProvider();
    song = Song.fake();

    cacheCleared = BehaviorSubject();
    when(cacheMock.cacheClearedStream).thenAnswer((_) => cacheCleared.stream);

    songCached = BehaviorSubject();
    when(cacheMock.songCachedStream).thenAnswer((_) => songCached.stream);

    singleCacheRemoved = BehaviorSubject();
    when(cacheMock.singleCacheRemovedStream)
        .thenAnswer((_) => singleCacheRemoved.stream);
  });

  Future<void> _mount(WidgetTester tester) async {
    await tester.pumpAppWidget(
      ChangeNotifierProvider<CacheProvider>.value(
        value: cacheMock,
        child: SongCacheIcon(song: song),
      ),
    );
  }

  void _assertCacheStatus({required bool hasCache}) {
    if (hasCache) {
      expect(find.byIcon(CupertinoIcons.cloud_download_fill), findsNothing);
      expect(
        find.byIcon(CupertinoIcons.checkmark_alt_circle_fill),
        findsOneWidget,
      );
    } else {
      expect(find.byIcon(CupertinoIcons.cloud_download_fill), findsOneWidget);
      expect(
        find.byIcon(CupertinoIcons.checkmark_alt_circle_fill),
        findsNothing,
      );
    }
  }

  testWidgets(
    'renders a download button if song is not cached',
    (WidgetTester tester) async {
      when(cacheMock.has(song: song)).thenAnswer((_) async => false);

      await _mount(tester);
      _assertCacheStatus(hasCache: false);
    },
  );

  testWidgets(
    'renders a "downloaded" indicator if song is cached',
    (WidgetTester tester) async {
      when(cacheMock.has(song: song)).thenAnswer((_) async => true);

      await _mount(tester);
      _assertCacheStatus(hasCache: true);
    },
  );

  testWidgets('re-renders when cache is cleared', (WidgetTester tester) async {
    when(cacheMock.has(song: song)).thenAnswer((_) async => true);

    await _mount(tester);
    _assertCacheStatus(hasCache: true);

    cacheCleared.add(true);
    await tester.pumpAndSettle();
    _assertCacheStatus(hasCache: false);
  });

  testWidgets('re-renders when song is cached', (WidgetTester tester) async {
    when(cacheMock.has(song: song)).thenAnswer((_) async => false);

    await _mount(tester);
    _assertCacheStatus(hasCache: false);

    songCached.add(SongCached(song: song, info: MockFileInfo()));
    await tester.pumpAndSettle();
    _assertCacheStatus(hasCache: true);
  });

  testWidgets(
    're-renders when song cache is removed',
    (WidgetTester tester) async {
      when(cacheMock.has(song: song)).thenAnswer((_) async => true);

      await _mount(tester);
      _assertCacheStatus(hasCache: true);

      singleCacheRemoved.add(song);
      await tester.pumpAndSettle();
      _assertCacheStatus(hasCache: false);
    },
  );
}
