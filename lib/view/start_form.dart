import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mains_platform/controller/central_hive_cubit.dart';
import 'package:mains_platform/other/constants.dart';
import 'package:mains_platform/other/routes.dart';
import 'package:mains_platform/other/strings.dart';
import '../controller/start_form_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mains_platform/other/injection.dart';

class StartFormScreen extends StatefulWidget {
  StartFormScreen({super.key});
  final fullnameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  @override
  State<StartFormScreen> createState() => _StartFormScreenState();
}

class _StartFormScreenState extends State<StartFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    widget.fullnameController.dispose();
    widget.phoneNumberController.dispose();
    widget.emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartFormCubit(questionsRepository: sl()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(windowTitle),
            centerTitle: true,
          ),
          body: Center(
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                constraints:
                    BoxConstraints(maxHeight: constraints.maxHeight * 0.8),
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight * 0.8,
                padding: const EdgeInsets.fromLTRB(70, 50, 70, 50),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Candidate Form",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      TextFormField(
                        maxLength: 100,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: widget.fullnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Full Name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLength: 10,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: widget.phoneNumberController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone number",
                        ),
                        validator: ((value) {
                          if (value == null ||
                              value.length != 10 ||
                              int.tryParse(value) == null) {
                            return "Check your phone number. Phone number should be 10 character length";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLength: 100,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: widget.emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        ),
                        validator: ((value) {
                          if (value == null || !value.contains("@")) {
                            return "Email should not be empty and must contain @";
                          }
                          return null;
                        }),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (widget.fullnameController.text ==
                                    adminUserName &&
                                widget.emailController.text == adminPassword) {
                              context.go(Routes.adminPanelScreen);
                            } else if (_formKey.currentState!.validate()) {
                              var hiveCubit = context.read<CentralHiveCubit>();
                              var startCubit = context.read<StartFormCubit>();
                              await hiveCubit.connectHiveWithId(
                                widget.phoneNumberController.text,
                              );
                              await startCubit.setUserDetail(
                                hiveCubit.state!,
                                widget.phoneNumberController.text,
                                widget.fullnameController.text,
                                widget.emailController.text,
                              );

                              if (mounted) {
                                context.goNamed(
                                  Routes.passwordScreen,
                                  pathParameters: {
                                    "id": widget.phoneNumberController.text
                                  },
                                );
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          )),
    );
  }
}
