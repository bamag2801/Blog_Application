import 'package:blog_app/cubits/user_name_list_cubit.dart';
import 'package:blog_app/ui/screens/user_content_screen.dart';
import 'package:blog_app/ui/widgets/custom_appbar_widget.dart';
import 'package:blog_app/ui/widgets/user_list_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserListScreen extends StatefulWidget {
  static const routeName = "/userListScreen";

  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      fetchData(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserNameListCubit, UserNameListState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
          child: Scaffold(
            appBar: const CustomAppBarWidget(
              isBackFunction: false,
              title: "Users",
            ),
            body: PagedListView<int, dynamic>.separated(
              padding: const EdgeInsets.all(15),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
                  animateTransitions: true,
                  itemBuilder: (_, element, index) {
                    return UserListComponent(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserContentScreen(
                              userId: element.userId,
                              userName: element.firstName,
                            ),
                          ),
                        );
                      },
                      userName: element.firstName,
                      image: element.avatar,
                    );
                  }),
              separatorBuilder: (_, index) => const SizedBox(
                height: 5,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> fetchData(int pageNo) async {
    try {
      final userListData =
          await context.read<UserNameListCubit>().userNameListData(pageNo);
      if (mounted) {
        if (context.read<UserNameListCubit>().responseStatusCode == 200) {
          print("+++++");
          final isLastPage =
              userListData.userDataList!.length < userListData.perPage!;
          if (isLastPage) {
            _pagingController.appendLastPage(userListData.userDataList!);
          } else {
            final nextPageNo = pageNo + 1;
            _pagingController.appendPage(userListData.userDataList!, nextPageNo);
          }
        } else {
          print("Something went wrong");
        }
      }
    }
    // Handle error in catch
    catch (error) {
      print("Something went wrong");
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
