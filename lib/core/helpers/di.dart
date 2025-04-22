import 'package:get_it/get_it.dart';
import 'package:habitect/core/supabase/database_services.dart';
import 'package:habitect/core/supabase/supabase_auth_services.dart';
import 'package:habitect/features/auth/data/repo/supabase_repo_impl.dart';
import 'package:habitect/features/auth/domain/repo/auth_repo.dart';

import 'package:shared_preferences/shared_preferences.dart';

var getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<DatabaseServices>(DatabaseServices());

  getIt.registerSingleton<AuthRepo>(
    SupabaseRepoImpl(SupabaseAuthServices(), getIt.get<DatabaseServices>()),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
}
