import 'package:flutter/material.dart';

import '../../../../constants/dimensions.dart';

class SongsListTitleRow extends StatelessWidget {
  const SongsListTitleRow({
    Key? key,
    required this.playlistTitle,
  }) : super(key: key);

  final String playlistTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20, right: 20, bottom: 16, top: deviceHeight * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(playlistTitle, style: Theme.of(context).textTheme.displayLarge),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: Theme.of(context).iconTheme.color),
          ),
        ],
      ),
    );
  }
}
