import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/network_service.dart';
import 'package:flutter_bloc_example/ui/post_cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  final NetworkService networkService;

  PostCubit({this.networkService}) : super(PostInitial());

  Future<void> clear() async {
    emit(PostInitial());
  }

  Future<void> getPost() async {
    emit(PostLoading());
    await networkService.fetchPosts().then((posts) {
      emit(PostLoaded(posts));
    }).catchError(() {
      emit(PostError(message: "Some error"));
    });
  }
}
