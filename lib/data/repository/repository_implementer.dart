import 'package:app/data/data_sourse/remote_data_sourse.dart';
import 'package:app/data/mapper/mapper.dart';
import 'package:app/data/network/error_handler.dart';
import 'package:app/data/network/failure.dart';
import 'package:app/data/network/network_info.dart';
import 'package:app/data/network/requests.dart';
import 'package:app/domain/model/models.dart';
import 'package:app/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImplementer implements Repository
{
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImplementer(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async
  {
    if(await _networkInfo.inConnected)
      {
        try
        {
          final response = await _remoteDataSource.login(loginRequest);
          if(response.status == APIInternalStatus.SUCCESS)
          {
            return Right(response.toDomain());
          }
          else
          {
            return Left(Failure(APIInternalStatus.FAITEUR, response.message ?? ResponseMessage.DEFAULT));
          }
        }catch(error){
          return Left(ErrorHandler.handle(error).failure);
        }


      }
    else
      {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
  }
}