class ApiUrls {
  static String getUserListPageUrl(int pageNo) =>
      "https://reqres.in/api/users?page=$pageNo";

  static String getUserIdUrl(int userId) =>
      "https://reqres.in/api/users/$userId";
}
