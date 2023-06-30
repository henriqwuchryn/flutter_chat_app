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
import 'package:chatzera/application/chat_hub.dart' as _i7;
import 'package:chatzera/application/messages/api/messages_api.dart' as _i8;
import 'package:chatzera/application/messages/messages_service.dart' as _i9;
import 'package:chatzera/application/rooms/api/rooms_api.dart' as _i11;
import 'package:chatzera/application/rooms/rooms_service.dart' as _i12;
import 'package:chatzera/application/users/users_api.dart' as _i13;
import 'package:chatzera/application/users/users_service.dart' as _i14;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:signalr_netcore/hub_connection.dart' as _i10;

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
    gh.singleton<_i7.ChatHub>(_i7.ChatHub(gh<_i3.AuthStorage>()));
    gh.factory<_i8.MessagesApi>(() => _i8.MessagesApi(gh<_i5.Dio>()));
    gh.singleton<_i9.MessagesService>(_i9.MessagesService(
      gh<_i8.MessagesApi>(),
      gh<_i10.HubConnection>(),
    ));
    gh.factory<_i11.RoomsApi>(() => _i11.RoomsApi(gh<_i5.Dio>()));
    gh.singleton<_i12.RoomsService>(_i12.RoomsService(
      gh<_i11.RoomsApi>(),
      gh<_i7.ChatHub>(),
    ));
    gh.factory<_i13.UsersApi>(() => _i13.UsersApi(gh<_i5.Dio>()));
    gh.singleton<_i14.UsersService>(_i14.UsersService(
      gh<_i13.UsersApi>(),
      gh<_i10.HubConnection>(),
    ));
    return this;
  }
}
