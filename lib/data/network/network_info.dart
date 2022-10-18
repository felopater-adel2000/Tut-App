import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo
{
  Future<bool> get inConnected;
}

class NetworkInfoImplementer implements NetworkInfo
{
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImplementer(this._internetConnectionChecker);

  @override
  Future<bool> get inConnected => _internetConnectionChecker.hasConnection;

}