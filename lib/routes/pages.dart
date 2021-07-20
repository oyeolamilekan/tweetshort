import 'package:get/get.dart';
import '../pages/about_me.dart';
import 'routes.dart';

import '../pages/editor.dart';
import '../pages/index.dart';

final pages = [
  GetPage(
    name: Routes.aboutMe,
    page: () => AboutMe(),
  ),
  GetPage(
    name: Routes.index,
    page: () => Index(),
  ),
  GetPage(
    name: Routes.editor,
    page: () => Editor(),
  )
];
