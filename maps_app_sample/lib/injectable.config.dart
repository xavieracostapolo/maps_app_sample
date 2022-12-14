// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:maps_app_sample/blocs/login/login_bloc.dart' as _i5;
import 'package:maps_app_sample/blocs/user/user_bloc.dart' as _i6;
import 'package:maps_app_sample/repository/user_repository.dart' as _i4;
import 'package:maps_app_sample/repository/user_repository_interface.dart'
    as _i3;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.IUserRepository>(() => _i4.UserRepository());
  gh.singleton<_i5.LoginBloc>(_i5.LoginBloc());
  gh.singleton<_i6.UserBloc>(_i6.UserBloc(gh<_i3.IUserRepository>()));
  return getIt;
}
