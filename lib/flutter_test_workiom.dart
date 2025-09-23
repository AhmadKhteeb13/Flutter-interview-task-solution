import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_workiom/core/routing/app_router.dart';
import 'package:flutter_test_workiom/core/routing/routers.dart';
import 'package:flutter_test_workiom/core/theming/colors.dart';

class FlutterTestWorkiom extends StatelessWidget {
  const FlutterTestWorkiom({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 785),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Flutter Test Workiom',
        theme: ThemeData(
          primaryTextTheme: const TextTheme(),
          fontFamily: "Rubik",
          primaryColor: ColorsManager.primaryBlueColor,
          appBarTheme: AppBarTheme(backgroundColor: ColorsManager.primaryBlueColor),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.grey,
            cursorColor: ColorsManager.primaryBlueColor,
            selectionHandleColor: ColorsManager.primaryBlueColor,
          ),
          brightness: Brightness.light,
          highlightColor: Colors.green.withValues(alpha: 0), //كبسة
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.orange,
            focusColor: Colors.pink,
            splashColor: ColorsManager.primaryBlueColor, //كبسة طويلة
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: ColorsManager.white)
              .copyWith(surface: ColorsManager.white),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.signupScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
