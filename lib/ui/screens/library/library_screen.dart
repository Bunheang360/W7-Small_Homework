import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/songs/song_repository.dart';
import '../../../ui/screens/library/view_model/library_view_model.dart';
import '../../../ui/states/player_state.dart';
import '../../../ui/states/settings_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LibraryViewModel(
        songRepository: context.read<SongRepository>(), 
        playerState: context.read<PlayerState>(), 
        settingsState: context.read<AppSettingsState>(),
        ),
      child: const LibraryScreen(),
    );
  }
}
