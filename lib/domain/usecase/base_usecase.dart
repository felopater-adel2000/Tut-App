import 'package:app/data/network/failure.dart';
import 'package:dartz/dartz.dart';

// is Interface
abstract class BaseUseCase<In, Out>
{
  Future<Either<Failure, Out>> execute(In input);
}