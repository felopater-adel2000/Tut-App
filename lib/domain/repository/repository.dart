import 'package:app/data/network/requests.dart';
import 'package:app/domain/model/models.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';

abstract class Repository
{
  //Either<failure, success>
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}