import 'package:flutter/material.dart';
import 'package:running_app/utils/common_widgets/header.dart';
import 'package:running_app/utils/common_widgets/main_wrapper.dart';
import 'package:running_app/utils/common_widgets/default_background_layout.dart';
import 'package:running_app/utils/common_widgets/text_button.dart';
import 'package:running_app/utils/constants.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  List settingList = [
    {
      "icon": Icons.person_outline_rounded,
      "text": "Account Information",
      "url": "/account_information_setting",
    },
    // {
    //   "icon": Icons.shield_outlined,
    //   "text": "Login and Security",
    //   "url": "/login_&_security",
    // },
    {
      "icon": Icons.privacy_tip_outlined,
      "text": "Privacy",
      "url": "/privacy_setting",
    },
    {
      "icon": Icons.notifications_none_rounded,
      "text": "Notification",
      "url": "/notification_setting",
    },
    // {
    //   "icon": Icons.policy_outlined,
    //   "text": "Policies",
    //   "url": "/policies",
    // },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Header(title: "Setting", noIcon: true,),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/home/background_1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: DefaultBackgroundLayout(
        child: Stack(
          children: [
            MainWrapper(
              leftMargin: 0,
              rightMargin: 0,
              child: Column(
                children: [
                  Column(
                    children: [
                      for(var setting in settingList)...[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.0, color: TColor.BORDER_COLOR),
                              top: settingList.indexOf(setting) == 0
                                  ? BorderSide(width: 1.0, color: TColor.BORDER_COLOR)
                                  : BorderSide.none,
                            )
                          ),
                          child: CustomTextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                  vertical: 22,
                                  horizontal: 12
                                )
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, setting["url"]);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      setting["icon"],
                                      color: TColor.DESCRIPTION,
                                    ),
                                    SizedBox(width: media.width * 0.02,),
                                    Text(
                                      setting["text"],
                                      style: TextStyle(
                                        color: TColor.DESCRIPTION,
                                        fontSize: FontSize.LARGE,
                                        fontWeight: FontWeight.w900
                                      ),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: TColor.DESCRIPTION,
                                )
                              ],
                            ),
                          ),
                        )
                      ]
                    ],
                  ),
                  SizedBox(height: media.height * 0.02,),
                  SizedBox(
                    width: media.width,
                    child: CustomTextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 0
                          )
                        )
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: FontSize.LARGE,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
