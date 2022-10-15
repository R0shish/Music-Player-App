import 'package:flutter/material.dart';
import 'package:music_player/constants/constants.dart';
import 'package:music_player/core/presentation/widgets/widgets.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({
    Key? key,
    required this.setting,
  }) : super(key: key);

  final List<Map<String, dynamic>> setting;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.lightBlack,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: ((context, index) => Center(
                    child: ListTile(
                      onTap: setting[index]['onTap'],
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: deviceWidth * 0.06),
                      leading: Icon(
                        setting[index]['icon'],
                        color: AppColor.secondary,
                      ),
                      title: TextTitle(text: setting[index]['title']),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.secondary,
                      ),
                    ),
                  )))),
    );
  }
}
