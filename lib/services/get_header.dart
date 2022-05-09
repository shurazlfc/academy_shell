import 'package:academy_shell/constants/app_constants.dart';
import 'package:academy_shell/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

getHeader() {
  final String? token =
      locator<SharedPreferences>().getString(AppConstants.AccessToken);
  return token != null
      ? {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        }
      : {
          "Content-Type": "application/json",
          "Accept": "application/json",
        };
}
