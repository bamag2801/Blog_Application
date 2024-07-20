import 'package:blog_app/cubits/user_name_list_cubit.dart';
import 'package:blog_app/ui/screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserNameListCubit>(
              create: (context) => UserNameListCubit()),
        ],
        child: ScreenUtilInit(
          minTextAdapt: true,
          designSize: const Size(360, 640),
          builder: (context, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Blog",
              home: const UserListScreen(),
              theme: ThemeData(
                primarySwatch: Colors.purple,
                textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16.sp)),
              ),
              routes: {
                UserListScreen.routeName: (context) => const UserListScreen()
              },
            );
          },
        ));
  }
}
