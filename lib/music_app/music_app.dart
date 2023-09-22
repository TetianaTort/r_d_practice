import 'dart:convert';
import 'dart:io';

class Song {
  final String name;
  final String artist;
  final Duration duration;
  final int year;

  Song({
    required this.name,
    required this.artist,
    required this.duration,
    required this.year,
  });
}

class Playlist with SearchMixin {
  final String name;
  List<Song> songs;

  Playlist({
    required this.name,
    required this.songs,
  });

  void addSong(Song song) {
    songs.add(song);
  }
}

//utils
void showPlaylist(List<Song> songs, String errorTitle) {
  if (songs.isNotEmpty) {
    var num = 0;
    for (var song in songs) {
      num += 1;
      print(
          '$num song: \'${song.name}\', artist: ${song.artist}, duration: ${song.duration.inMinutes}:${song.duration.inSeconds.remainder(60)}, year: ${song.year}');
    }
  } else {
    print(errorTitle);
  }
}

mixin SearchMixin {
  List<Song> search(Playlist playlist, String query) {
    query = query.toLowerCase();
    var newSongList = playlist.songs.where((song) {
      return song.artist.toString().toLowerCase().contains(query) ||
          song.name.toString().toLowerCase().contains(query);
    }).toList();

    return newSongList;
  }
}

extension CountingDuration on List<Song> {
  void sumDuration() {
    Duration totalDuration = Duration.zero;
    for (var element in this) {
      totalDuration += element.duration;
    }
    print('Total duration: $totalDuration');
  }
}

void main(List<String> arguments) {
  //create new playlist
  Playlist myPlayList = Playlist(
    name: 'travel',
    songs: [],
  );

  //add songs to playlist
  myPlayList.addSong(
    Song(
      name: '1901',
      artist: 'Phoenix',
      duration: const Duration(minutes: 3, seconds: 13),
      year: 2009,
    ),
  );
  myPlayList.addSong(
    Song(
        name: 'How We Feel',
        artist: 'Panama',
        duration: const Duration(minutes: 4, seconds: 3),
        year: 2013),
  );
  myPlayList.addSong(
    Song(
        name: 'Water Me Down',
        artist: 'Vagabon',
        duration: const Duration(minutes: 4, seconds: 32),
        year: 2019),
  );
  myPlayList.addSong(
    Song(
        name: 'Keep It Gold',
        artist: 'Surfaces',
        duration: const Duration(minutes: 4, seconds: 14),
        year: 2019),
  );
  myPlayList.addSong(
    Song(
        name: 'Follow the Sun',
        artist: 'Caroline Pennell',
        duration: const Duration(minutes: 3, seconds: 36),
        year: 2016),
  );
  myPlayList.addSong(
    Song(
        name: 'Where\'s My Love',
        artist: 'SYML',
        duration: const Duration(minutes: 3, seconds: 22),
        year: 2017),
  );
  myPlayList.addSong(
    Song(
        name: 'Nothing\'s Gonna Hurt You Baby',
        artist: 'Cigaretts After Sex',
        duration: const Duration(minutes: 4, seconds: 46),
        year: 2012),
  );
  myPlayList.addSong(
    Song(
        name: 'Prey',
        artist: 'The Neighbourhood',
        duration: const Duration(minutes: 4, seconds: 43),
        year: 2015),
  );
  myPlayList.addSong(
    Song(
        name: 'i walk this earth all by myself',
        artist: 'EKKSTACY',
        duration: const Duration(minutes: 2, seconds: 26),
        year: 2021),
  );
  myPlayList.addSong(
    Song(
        name: 'Such Great Heights',
        artist: 'The Postal Service',
        duration: const Duration(minutes: 4, seconds: 27),
        year: 2003),
  );
  myPlayList.addSong(
    Song(
        name: 'September',
        artist: 'Sparky Deathcap',
        duration: const Duration(minutes: 4, seconds: 27),
        year: 2023),
  );
  myPlayList.addSong(
    Song(
        name: 'Someday',
        artist: 'The Strokes',
        duration: const Duration(minutes: 3, seconds: 4),
        year: 2001),
  );
  myPlayList.addSong(
    Song(
        name: 'Lisztomania',
        artist: 'Phoenix',
        duration: const Duration(minutes: 4, seconds: 2),
        year: 2009),
  );
  myPlayList.addSong(
    Song(
        name: 'Mountain at My Gates',
        artist: 'Foals',
        duration: const Duration(minutes: 4, seconds: 4),
        year: 2015),
  );
  myPlayList.addSong(
    Song(
      name: 'Hush',
      artist: 'Tourist',
      duration: const Duration(minutes: 3, seconds: 20),
      year: 2017,
    ),
  );
  myPlayList.addSong(
    Song(
        name: 'Out of My League',
        artist: 'Fitz and The Tantrums',
        duration: const Duration(minutes: 3, seconds: 31),
        year: 2013),
  );
  myPlayList.addSong(
    Song(
        name: 'My Number',
        artist: 'Foals',
        duration: const Duration(minutes: 3, seconds: 59),
        year: 2012),
  );
  myPlayList.addSong(
    Song(
        name: 'Heat Waves',
        artist: 'Glass Animals',
        duration: const Duration(minutes: 3, seconds: 59),
        year: 2020),
  );
  myPlayList.addSong(
    Song(
        name: 'Banquet',
        artist: 'Bloc Party',
        duration: const Duration(minutes: 3, seconds: 21),
        year: 2005),
  );
  myPlayList.addSong(
    Song(
        name: 'Brazil',
        artist: 'Declan McKenna',
        duration: const Duration(minutes: 4, seconds: 12),
        year: 2015),
  );

//show new playlist
  print('playlist name: ${myPlayList.name}');
  showPlaylist(myPlayList.songs, 'add your first song');
//count duration of playlist
  myPlayList.songs.sumDuration();

//search for a track
  print('find your song with track name or artist name: ');
  var query = stdin.readLineSync(encoding: utf8);
  var filtredSongs = myPlayList.search(myPlayList, query!);
//get result
  showPlaylist(filtredSongs, 'no such track');
  filtredSongs.sumDuration();
}
