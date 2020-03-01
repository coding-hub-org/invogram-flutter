import 'package:flutter/widgets.dart';
import 'package:invogram/screens/home/home_screen.dart';
import 'package:invogram/screens/login/login_screen.dart';
import 'package:invogram/screens/reminder/reminder_screen.dart';
import 'package:invogram/screens/sign_up/sign_up_screen.dart';

class Routes {
  static Route home = Route(name: '/home', widget: HomeScreen());
  static Route reminder = Route(name: '/reminder', widget: ReminderScreen());
  static Route signUp = Route(name: '/sign_up', widget: SignUpScreen());
  static Route login = Route(name: '/login', widget: LoginScreen());

  static List<Route> allRoutes = [home, reminder, signUp, login];
}

class Route {
  String name;
  Widget widget;

  Route({this.name, this.widget})
      : assert(name != null),
        assert(widget != null);
}
