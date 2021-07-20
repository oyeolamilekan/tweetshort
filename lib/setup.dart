import 'package:get_it/get_it.dart';

import 'services/api/api.dart';
import 'services/http.dart';

final locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton<HttpClient>(
    () => HttpClient(),
  );

  locator.registerLazySingleton<ApiClient>(
    () => ApiClient(),
  );
}
