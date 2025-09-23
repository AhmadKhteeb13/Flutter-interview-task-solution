import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_workiom/core/routing/app_router.dart';
import 'package:flutter_test_workiom/flutter_test_workiom.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlutterTestWorkiom(appRouter: AppRouter(),));
}
