import 'package:flutter/material.dart';
import 'package:running_app/utils/common_widgets/add_button.dart';
import 'package:running_app/utils/common_widgets/app_bar.dart';
import 'package:running_app/utils/common_widgets/background_container.dart';
import 'package:running_app/utils/common_widgets/header.dart';
import 'package:running_app/utils/common_widgets/main_wrapper.dart';
import 'package:running_app/utils/common_widgets/menu.dart';
import 'package:running_app/utils/common_widgets/default_background_layout.dart';
import 'package:running_app/utils/common_widgets/text_button.dart';
import 'package:running_app/utils/constants.dart';
import 'package:running_app/view/community/club/club_view.dart';
import 'package:running_app/view/community/event/event_view.dart';
import 'package:running_app/view/community/social_view.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({
    super.key
  });

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  String _showView = "Events";
  
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    List redirect = ["Events", "Social", "Clubs"];
    return Scaffold(
      appBar: const CustomAppBar(
        title: Header(title: "Community", backButton: false, noIcon: true),
      ),
      body: SingleChildScrollView(
        child: DefaultBackgroundLayout(
          child: Stack(
            children: [
              if(_showView != "Social")...[
                BackgroundContainer(
                  height: media.height * (_showView == "Events" ? 0.28 : 0.26),
                ),
              ],
              MainWrapper(
                child: Column(
                  children: [
                    // Redirect and search section
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 10
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: TColor.SECONDARY_BACKGROUND,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for(var x in redirect)
                            CustomTextButton(
                              onPressed: () {
                                setState(() {
                                  _showView = x;
                                });
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: media.width * 0.07
                                      )
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color?>(
                                    _showView == x ? TColor.PRIMARY : null
                                  ),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  )
                              ),
                              child: Text(
                                  x,
                                  style: TextStyle(
                                    color: TColor.PRIMARY_TEXT,
                                    fontSize: FontSize.NORMAL,
                                    fontWeight: FontWeight.w600,
                                  )
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: media.height * 0.005,),

                    // EventView(),
                    (_showView == "Events") ?
                      const EventView() : (_showView == "Social" ? const SocialView() : const ClubView()),
                    SizedBox(height: media.height * 0.05,),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
      // bottomSheet: Container(
      //   padding: EdgeInsets.only(
      //     bottom: 20,
      //     top: 5
      //   ),
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //         image: AssetImage(
      //             TImage.PRIMARY_BACKGROUND_IMAGE
      //         ),
      //         fit: BoxFit.cover
      //       )
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       AddButton(),
      //     ],
      //   ),
      // ),
      bottomSheet: (_showView == "Events" || _showView == "Clubs") ? AddButton(
        text: (_showView == "Events") 
            ? "Create your own event"
            : "Create your own club",
        onPressed: () {
          Navigator.pushNamed(context, _showView == "Events" ? "/add_event_feature" : "/add_club");
        },
      ) : null,
      bottomNavigationBar: const Menu(),
      // bottomNavigationBar: Stack(
      //   clipBehavior: Clip.none,
      //   children: [
      //     Container(
      //       padding: EdgeInsets.only(
      //         top: media.height * 0.09
      //       ),
      //       child: Menu()
      //     ),
      //     Positioned(
      //       // bottom: 25.0, // Adjust this value to change the distance from bottom
      //       // right: 25.0,
      //       bottom: media.height * 0.09,
      //       right: media.width * 0.025,
      //       child: AddButton(),
      //     ),
      //     // AddButton()
      //   ],
      // ),
    );
  }
}
