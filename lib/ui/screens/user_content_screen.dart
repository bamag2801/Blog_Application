import 'package:blog_app/cubits/user_name_list_cubit.dart';
import 'package:blog_app/ui/widgets/custom_appbar_widget.dart';
import 'package:blog_app/ui/widgets/user_content_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserContentScreen extends StatefulWidget {
  final int? userId;
  final String? userName;

  const UserContentScreen({super.key, this.userId, this.userName});

  @override
  State<UserContentScreen> createState() => _UserContentScreenState();
}

class _UserContentScreenState extends State<UserContentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  Future getApi() async {
    try {
      await context
          .read<UserNameListCubit>()
          .userContentDetailsData(widget.userId!);
      print(widget.userId!);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWidget(
          title: widget.userName!,
          isBackFunction: true,
        ),
        body: BlocBuilder<UserNameListCubit, UserNameListState>(
            builder: (context, userContentState) {
          return context.read<UserNameListCubit>().userContentLoading
              ? const Center(child: CircularProgressIndicator())
              : UserContentComponent(
                  userName:
                      userContentState.userContentData!.userDataList!.firstName,
                  userId: userContentState.userContentData!.userDataList!.userId
                      .toString(),
                  userEmail:
                      userContentState.userContentData!.userDataList!.email,
                  image: userContentState.userContentData!.userDataList!.avatar,
                );
        }));
  }
}
