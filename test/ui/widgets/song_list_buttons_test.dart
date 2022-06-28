import 'package:nuenenen/models/song.dart';
import 'package:nuenenen/providers/audio_provider.dart';
import 'package:nuenenen/ui/widgets/song_list_buttons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../extensions/widget_tester_extension.dart';
import 'song_list_buttons_test.mocks.dart';

@GenerateMocks([AudioProvider])
void main() {
  late MockAudioProvider audioMock;
  late List<Song> songs;

  setUp(() {
    audioMock = MockAudioProvider();
    songs = Song.fakeMany(10);
  });

  Future<void> _mount(WidgetTester tester) async {
    await tester.pumpAppWidget(
      ChangeNotifierProvider<AudioProvider>.value(
        value: audioMock,
        child: SongListButtons(songs: songs),
      ),
    );
  }

  testWidgets('plays all', (WidgetTester tester) async {
    await _mount(tester);
    await tester.tap(find.byKey(SongListButtons.playAllButtonKey));
    verify(audioMock.replaceQueue(songs)).called(1);
  });

  testWidgets('shuffles all', (WidgetTester tester) async {
    await _mount(tester);
    await tester.tap(find.byKey(SongListButtons.shuffleAllButtonKey));
    verify(audioMock.replaceQueue(songs, shuffle: true)).called(1);
  });
}
