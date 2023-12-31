import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppUtils {
  //write datas need to use across all parts of the app here

  ///Used to check internet connectivity with package => internet_connection_checker: ^0.0.1+3
  ///user this on every btn / or can be implemented on service before API call
  static Future<bool> isOnline() async {
    bool isOnline = await InternetConnectionChecker().hasConnection;
    if (isOnline) {
      return true;
    } else {
      // oneTimeSnackBar('No network connection!');
      return false;
    }
  }

  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    // AppUtils.logger.d("Access : Bearer $access");

    if (access != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access'
      };
    } else if (dbName != null) {
      return {'Content-Type': 'application/json', 'dbName': dbName};
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }
  //  static oneTimeSnackBar(
  //   String? message, {
  //   int time = 2,
  //   Color? bgColor,
  //   TextStyle? textStyle,
  //   BuildContext? context,
  //   bool showOnTop = false,
  // }) {
  //   ScaffoldMessenger.of(
  //           Routes.router.routerDelegate.navigatorKey.currentState!.context)
  //       .clearSnackBars();

  //   ///To CLEAR PREVIOUS SNACK BARS
  //   return ScaffoldMessenger.of(context ??
  //           Routes.router.routerDelegate.navigatorKey.currentState!.context)
  //       // ScaffoldMessenger.of(context??Routes.router.routerDelegate.navigatorKey.currentState!.context)
  //       .showSnackBar(
  //     SnackBar(
  //       /*action:SnackBarAction(label: "Ok",
  //       onPressed: (){
  //         SystemSettings.internalStorage();
  //       },
  //       ) ,*/

  //       behavior: showOnTop ? SnackBarBehavior.floating : null,
  //       backgroundColor: bgColor ?? ColorConstants.iconRose,
  //       content: Text(message!, style: textStyle),
  //       duration: Duration(seconds: time),
  //       margin: showOnTop
  //           ? EdgeInsets.only(
  //               bottom: MediaQuery.of(context ??
  //                           Routes.router.routerDelegate.navigatorKey
  //                               .currentState!.context)
  //                       .size
  //                       .height -
  //                   100,
  //               right: 20,
  //               left: 20)
  //           : null,
  //     ),
  //   );
  // }
}
