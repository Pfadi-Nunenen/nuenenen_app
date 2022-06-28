import 'package:nuenenen/models/artist.dart';
import 'package:nuenenen/models/song.dart';
import 'package:nuenenen/providers/audio_provider.dart';
import 'package:nuenenen/router.dart';
import 'package:nuenenen/ui/widgets/song_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../extensions/widget_tester_extension.dart';
import 'song_card_test.mocks.dart';

@GenerateMocks([AudioProvider, AppRouter])
void main() {
  late MockAudioProvider audioMock;
  late MockAppRouter router;
  late Song song;

  setUp(() {
    audioMock = MockAudioProvider();
    router = MockAppRouter();

    song = Song.fake(
      title: 'Banana Work Is Never Done',
      artist: Artist.fake(name: 'Super Bananas'),
    );
  });

  Future<void> _mount(WidgetTester tester) async {
    await tester.pumpAppWidget(
      ChangeNotifierProvider<AudioProvider>.value(
        value: audioMock,
        child: SongCard(
          song: song,
          router: router,
        ),
      ),
    );
  }

  testWidgets('renders', (WidgetTester tester) async {
    await _mount(tester);
    await expectLater(
      find.byType(SongCard),
      matchesGoldenFile('goldens/song_card.png'),
    );
  });

  testWidgets('plays when tapped', (WidgetTester tester) async {
    await _mount(tester);
    await tester.tap(find.byType(SongCard));
    verify(audioMock.play(song: song)).called(1);
  });

  testWidgets(
    'opens action sheet when long pressed',
    (WidgetTester tester) async {
      await _mount(tester);
      await tester.longPress(find.byType(SongCard));
      verify(router.showActionSheet(any, song: song)).called(1);
    },
  );
}
