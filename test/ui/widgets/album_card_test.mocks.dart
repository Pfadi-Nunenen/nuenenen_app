// Mocks generated by Mockito 5.0.12 from annotations
// in app/test/ui/widgets/album_card_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:nuenenen_app/models/album.dart' as _i5;
import 'package:nuenenen_app/models/artist.dart' as _i6;
import 'package:nuenenen_app/models/song.dart' as _i7;
import 'package:nuenenen_app/router.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [AppRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppRouter extends _i1.Mock implements _i2.AppRouter {
  MockAppRouter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> gotoAlbumDetailsScreen(_i4.BuildContext? context,
          {_i5.Album? album}) =>
      (super.noSuchMethod(
          Invocation.method(
              #gotoAlbumDetailsScreen, [context], {#album: album}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> gotoArtistDetailsScreen(_i4.BuildContext? context,
          {_i6.Artist? artist}) =>
      (super.noSuchMethod(
          Invocation.method(
              #gotoArtistDetailsScreen, [context], {#artist: artist}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> openNowPlayingScreen(_i4.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#openNowPlayingScreen, [context]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showCreatePlaylistSheet(_i4.BuildContext? context) => (super
      .noSuchMethod(Invocation.method(#showCreatePlaylistSheet, [context]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showActionSheet(_i4.BuildContext? context,
          {_i7.Song? song}) =>
      (super.noSuchMethod(
          Invocation.method(#showActionSheet, [context], {#song: song}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}
