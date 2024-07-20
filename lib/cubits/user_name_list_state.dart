part of 'user_name_list_cubit.dart';

final class UserNameListState {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserDataList>? userDataList;
  UserContentData? userContentData;

  UserNameListState.fromJson(Map<String, dynamic> json) {
    try {
      page = json["page"];
      perPage = json["per_page"];
      total = json["total"];
      totalPages = json["total_pages"];
      if (json["data"].runtimeType == List) {
        if (json["data"] != null) {
          userDataList = <UserDataList>[];
          List list = json["data"];

          for (var element in list) {
            userDataList!.add(UserDataList.fromJson(element));
          }
        }
      } else {
        userContentData = UserContentData.fromJson(json);
      }
    } catch (err) {
      rethrow;
    }
  }

  UserNameListState({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.userDataList,
  });
}

final class UserDataList {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? avatar;

  UserDataList({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.avatar,
  });

  UserDataList.fromJson(Map<String, dynamic> json) {
    userId = json["id"] ?? 0;
    firstName = json["first_name"] ?? "";
    lastName = json["last_name"] ?? "";
    email = json["email"] ?? "";
    avatar = json["avatar"] ?? "";
  }
}

final class UserContentData {
  UserDataList? userDataList;

  UserContentData.fromJson(Map<String, dynamic> json) {
    userDataList = json["data"] != null
        ? UserDataList.fromJson(json["data"] ?? {})
        : UserDataList();
  }

  UserContentData({
    this.userDataList,
  });
}
