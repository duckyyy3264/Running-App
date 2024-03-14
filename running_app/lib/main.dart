import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:running_app/utils/common_widgets/email_verification.dart';
import 'package:running_app/utils/common_widgets/notification_box.dart';
import 'package:running_app/utils/providers/token_provider.dart';
import 'package:running_app/utils/providers/user_provider.dart';
import 'package:running_app/view/activity/activity_view.dart';
import 'package:running_app/view/address/address_view.dart';
import 'package:running_app/view/community/club_detail_view.dart';
import 'package:running_app/view/community/club_list_view.dart';
import 'package:running_app/view/community/community_view.dart';
import 'package:running_app/view/community/event_detail_view.dart';
import 'package:running_app/view/community/event_list_view.dart';
import 'package:running_app/view/community/your_event_list_view.dart';
import 'package:running_app/view/home/home_view.dart';
import 'package:running_app/view/home/notification_view.dart';
import 'package:running_app/view/login/get_started_view.dart';
import 'package:running_app/view/login/on_boarding_view.dart';
import 'package:running_app/view/login/profile_create_view.dart';
import 'package:running_app/view/login/sign_in_view.dart';
import 'package:running_app/view/login/sign_up_view.dart';
import 'package:running_app/view/rank/rank_view.dart';
import 'package:running_app/view/store/product_view.dart';
import 'package:running_app/view/store/store_view.dart';
import 'package:running_app/view/user/account_information_setting_view.dart';
import 'package:running_app/view/user/athlete_discovery_view.dart';
import 'package:running_app/view/user/follower_view.dart';
import 'package:running_app/view/user/notification_setting_view.dart';
import 'package:running_app/view/user/privacy_setting_view.dart';
import 'package:running_app/view/user/setting_view.dart';
import 'package:running_app/view/user/user_view.dart';
import 'package:running_app/view/wallet/wallet.dart';


void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider<TokenProvider>(
          create: (_) => TokenProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Running',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false
      ),
      initialRoute: '/sign_in',
      routes: {
        '/': (context) => const GetStartedView(),
        '/on_board': (context) => const OnBoardingView(),
        '/sign_in': (context) => const SignInView(),
        '/sign_up': (context) => const SignUpView(),
        '/profile_create': (context) => const ProfileCreateView(),
        '/home': (context) => const HomeView(),
        '/activity': (context) => const ActivityView(),
        '/store': (context) => const StoreView(),
        '/product': (context) => const ProductView(),
        '/rank': (context) => const RankView(),
        '/box': (context) => const NotificationBox(),
        '/address': (context) => const AddressView(),
        '/wallet': (context) => const WalletView(),
        '/email_verification': (context) => const EmailVerification(),
        '/community': (context) => const CommunityView(),
        '/club_list': (context) => const ClubListView(),
        '/club_detail': (context) => const ClubDetailView(),
        '/event_list': (context) => const EventListView(),
        '/your_event_list': (context) => const YourEventListView(),
        '/user': (context) => const UserView(),
        '/setting': (context) => const SettingView(),
        '/event_detail': (context) => const EventDetailView(),
        '/privacy_setting': (context) => const PrivacySettingView(),
        '/account_information_setting': (context) => const AccountInformationSettingView(),
        '/notification_setting': (context) => const NotificationSettingView(),
        '/athlete_discovery': (context) => const AthleteDiscoveryView(),
        '/follower': (context) => const FollowerView(),
        '/notification': (context) => const NotificationView(),
        // '/verify': (context) => VerifyCodeForm(),
        // '/running': (context) => const RunningView(),
      },
    );
  }
}
