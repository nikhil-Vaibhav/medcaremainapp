import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/services_and_managers/notifiers/auth_notitfier.dart';
import 'package:medcaremainapp/ui/screens/authenticate/authenticate.dart';
import 'package:medcaremainapp/ui/screens/home_page.dart';
import 'package:medcaremainapp/ui/layouts/common_home_page_layout.dart';

import '../../models/app_user_status.dart';
import '../../utils/service_locator.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo: based on user auth return home page or authenticate page

    String userID = getIt<CurrentAppUser>().uid;
    print(userID);
    if(userID != "") {
      return const CommonHomePageLayout();
    } else {
      return const Authenticate();
    }
  }
}
