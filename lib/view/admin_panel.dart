import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mains_platform/model/userdata.dart';
import 'package:mains_platform/other/constants.dart';
import 'package:mains_platform/other/routes.dart';
import '../controller/admin_panel_cubit.dart';
import 'package:mains_platform/other/injection.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminPanelCubit(questionsRepository: sl()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Admin Panel"),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () => context.read<AdminPanelCubit>().getUserData(),
                icon: const Icon(Icons.refresh),
              );
            }),
            BlocBuilder<AdminPanelCubit, AdminPanelState>(
              builder: (context, state) {
                var icon = Icons.play_arrow;

                if (state is AdminPanelStateLoaded) {
                  icon = state.isStarted ? Icons.stop : Icons.play_arrow;
                }
                return IconButton(
                  onPressed: () {
                    context.read<AdminPanelCubit>().toggleStartExam();
                  },
                  icon: Icon(
                    icon,
                  ),
                );
              },
            )
          ],
        ),
        body: BlocBuilder<AdminPanelCubit, AdminPanelState>(
          builder: (context, state) {
            switch (state) {
              case AdminPanelStateError(:final error, :final stackTrace):
                return Center(
                  child: Text(
                    "$error \n $stackTrace",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.redAccent,
                        ),
                  ),
                );
              case AdminPanelStateLoading():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case AdminPanelStateInitial():
                return Container();
              case AdminPanelStateLoaded(:final userDataList):
                switch (userDataList.length) {
                  case 0:
                    return const Center(
                      child: Text("No responses yet"),
                    );
                  default:
                    return GridView.count(
                      crossAxisCount: 5,
                      children: userDataList
                          .map((userData) => GridItem(userData: userData))
                          .toList(),
                    );
                }
            }
          },
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final UserData userData;
  const GridItem({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.questionScreen,
          pathParameters: {
            pathParameterIdKey: userData.phoneNumber,
            pathParameterIsAdminKey: true.toString(),
          },
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Full Name: ${userData.fullName}",
            ),
            Text(
              "Phone number ${userData.phoneNumber}",
            ),
            Text(
              "Email ${userData.email}",
            ),
            Text(
              "Password Completed: ${userData.isPasswordComplete}",
            ),
            Text(
              "Everything Completed: ${userData.isEverythingComplete}",
            )
          ],
        ),
      ),
    );
  }
}
