import 'package:bloc/bloc.dart';
import 'package:blog_app/constants/api_urls.dart';
import 'package:dio/dio.dart';

part 'user_name_list_state.dart';

class UserNameListCubit extends Cubit<UserNameListState> {
  UserNameListCubit() : super(UserNameListState());
  Dio client = Dio();

  int responseStatusCode = 0;
  String responseStatusMessage = "";

  bool userNameListLoading = false;
  bool userContentLoading = false;

  Future<UserNameListState> userNameListData(int pageNo) async {
    userNameListLoading = true;
    try {
      client.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));

      Response response = await client.get(ApiUrls.getUserListPageUrl(pageNo));
      responseStatusCode = response.statusCode!;
      responseStatusMessage = response.statusMessage!;
      emit(UserNameListState.fromJson(response.data));
      userNameListLoading = false;
      return state;
    } on DioException {
      userNameListLoading = false;

      rethrow;
    }
  }

  Future<void> userContentDetailsData(int userId) async {
    userContentLoading = true;
    try {
      client.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));

      Response response = await client.get(ApiUrls.getUserIdUrl(userId));
      responseStatusCode = response.statusCode!;
      responseStatusMessage = response.statusMessage!;

      emit(UserNameListState.fromJson(response.data));
      userContentLoading = false;
    } on DioException {
      userContentLoading = false;
      rethrow;
    }
  }
}
