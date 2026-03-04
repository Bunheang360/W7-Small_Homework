import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../ui/theme/theme.dart';
import '../../../widgets/songs_tile.dart';
import '../view_model/library_view_model.dart';


class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryViewModel libraryViewModel = context.watch<LibraryViewModel>();

    return Container(
      color: libraryViewModel.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),
          
          Expanded(
            child: ListView.builder(
              itemCount: libraryViewModel.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: libraryViewModel.songs[index], 
                isPlaying: libraryViewModel.isPlaying(libraryViewModel.songs[index]),
                onTap: () {
                  libraryViewModel.songPlay(libraryViewModel.songs[index]);
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}