import 'package:take_my_tym/features/post/data/datasources/create_remote_data_source.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/domain/repositories/create_post_repo.dart';

final class CreatePostRepoImpl implements CreatePostRepo {
  final CreatePostRemoteData _remoteDataSource;
  CreatePostRepoImpl(this._remoteDataSource);

  @override
  Future<bool> buyTymPost({required PostModel postModel}) async {
    return await _remoteDataSource.buyTymPost(postModel: postModel);
  }

  @override
  Future<bool> sellTymPost({required PostModel postModel}) async {
    return await _remoteDataSource.sellTymPost(postModel: postModel);
  }
}
