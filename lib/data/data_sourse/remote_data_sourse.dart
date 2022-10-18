import 'package:app/data/network/app_api.dart';
import 'package:app/data/network/requests.dart';
import 'package:app/data/response/responses.dart';

abstract class RemoteDataSource
{
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementation implements RemoteDataSource
{
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementation(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async
  {
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

}