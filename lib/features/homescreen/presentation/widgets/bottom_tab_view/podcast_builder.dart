import 'package:flutter/material.dart';

import '../../../../../constants/dimensions.dart';
import '../../../../../core/widgets/podcast_container.dart';
import '../../../../../model/podcast_model.dart';

class PodcastBuilder extends StatelessWidget {
  final Map<String, dynamic> podcastData;
  const PodcastBuilder({Key? key, required this.podcastData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: deviceHeight * 0.3,
        child: ListView.builder(
          itemCount: podcastData['data'].length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Podcast podcast = Podcast.fromJson(
              podcastData['data'][index],
            );
            return PodcastContainer(
                title: podcast.title,
                subTitle: podcast.subTitle,
                image: podcast.image);
          },
        ));
  }
}
