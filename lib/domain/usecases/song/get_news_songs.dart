import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/useCase/usecase.dart';

import '../../../service_locator.dart';
import '../../repository/song/song.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getNewsSongs();
  }
}
