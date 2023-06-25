// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chatzera/application/authentication/api/authentication_api.dart'
    as _i4;
import 'package:chatzera/application/authentication/auth_storage.dart' as _i3;
import 'package:chatzera/application/authentication/authentication_service.dart'
    as _i6;
import 'package:chatzera/application/messages/api/messages_api.dart' as _i7;
import 'package:chatzera/application/messages/messages_service.dart' as _i8;
import 'package:chatzera/application/rooms/api/rooms_api.dart' as _i9;
import 'package:chatzera/application/rooms/rooms_service.dart' as _i10;
import 'package:chatzera/application/users/users_api.dart' as _i11;
import 'package:chatzera/application/users/users_service.dart' as _i12;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthStorage>(_i3.AuthStorage());
    gh.factory<_i4.AuthenticationApi>(
        () => _i4.AuthenticationApi(gh<_i5.Dio>()));
    gh.singleton<_i6.AuthenticationService>(_i6.AuthenticationService(
      gh<_i4.AuthenticationApi>(),
      gh<_i3.AuthStorage>(),
    ));
    gh.factory<_i7.MessagesApi>(() => _i7.MessagesApi(gh<_i5.Dio>()));
    gh.singleton<_i8.MessagesService>(
        _i8.MessagesService(gh<_i7.MessagesApi>()));
    gh.factory<_i9.RoomsApi>(() => _i9.RoomsApi(gh<_i5.Dio>()));
    gh.singleton<_i10.RoomsService>(_i10.RoomsService(gh<_i9.RoomsApi>()));
    gh.factory<_i11.UsersApi>(() => _i11.UsersApi(gh<_i5.Dio>()));
    gh.singleton<_i12.UsersService>(_i12.UsersService(gh<_i11.UsersApi>()));
    return this;
  }
}
