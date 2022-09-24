import 'package:flutter/material.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/dimensions.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.07,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.grey,
                hintText: 'Search Playlist',
                hintStyle: Theme.of(context).textTheme.bodyText2,
                prefixIcon: const Icon(Icons.search, color: AppColor.secondary),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(width: deviceWidth * 0.05),
          Expanded(
            child: Container(
              height: deviceHeight * 0.07,
              decoration: BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.filter_list,
                  size: 30, color: AppColor.secondary),
            ),
          )
        ],
      ),
    );
  }
}
