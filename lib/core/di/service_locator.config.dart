// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/domain/auth_facade.dart' as _i4;
import '../../features/auth/infrastructure/auth_api_service.dart' as _i3;
import '../../features/auth/infrastructure/auth_service.dart' as _i5;
import '../../features/auth/presentation/blocs/auth_cubit.dart' as _i7;
import '../../features/jobs/domain/job_facade.dart' as _i8;
import '../../features/jobs/infrastructure/job_api_service.dart' as _i6;
import '../../features/jobs/infrastructure/job_service.dart' as _i9;
import '../../features/jobs/presentation/blocs/job_cubit.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthAPIService>(() => _i3.AuthAPIService.create());
  gh.factory<_i4.IAuthFacade>(() => _i5.AuthService(get<_i3.AuthAPIService>()));
  gh.factory<_i6.JobAPIService>(() => _i6.JobAPIService.create());
  gh.lazySingleton<_i7.AuthCubit>(() => _i7.AuthCubit(get<_i4.IAuthFacade>()));
  gh.factory<_i8.IJobFacade>(() => _i9.JobService(get<_i6.JobAPIService>()));
  gh.lazySingleton<_i10.JobHomeCubit>(
      () => _i10.JobHomeCubit(get<_i8.IJobFacade>()));
  return get;
}
