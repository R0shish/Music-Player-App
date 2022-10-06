import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.06,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              style: Theme.of(context).textTheme.bodyText2,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.grey,
                hintText: 'Search Playlist',
                hintStyle: Theme.of(context).textTheme.bodyText2,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColor.secondary,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(width: deviceWidth * 0.04),
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
