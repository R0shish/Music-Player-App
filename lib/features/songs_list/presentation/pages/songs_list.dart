import 'package:flutter/material.dart';

import '../../../../constants/dimensions.dart';
import '../../../../core/data/model/song_model.dart';

class SongsList extends StatelessWidget {
  final List<Song> songsList;
  const SongsList({Key? key, required this.songsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: ((context, scrollController) => Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: deviceHeight,
                  padding: const EdgeInsets.all(18.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Songs',
                                style: Theme.of(context).textTheme.headline1),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.close,
                                  color: Theme.of(context).iconTheme.color),
                            ),
                          ],
                        ),
                        SizedBox(height: deviceHeight * 0.03),
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: songsList.length,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                title: Text(songsList[index].name,
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                subtitle: Text(songsList[index].artist,
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
