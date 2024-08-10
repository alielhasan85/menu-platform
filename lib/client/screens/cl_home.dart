import 'package:flutter/material.dart';
import 'package:digital_menu/client/screens/cl_sign_up.dart';
import 'package:digital_menu/client/screens/cl_login.dart';
import 'package:digital_menu/services/responsive/responsive_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: responsive of login card - dont have account in case landscape
// TODO: revise the marcketing message of the side content
final authFormProvider = StateProvider<AuthForm>((ref) => AuthForm.login);

enum AuthForm { login, signUp }

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authForm = ref.watch(authFormProvider);

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: ResponsiveHelper.isMobile(context)
          ? Column(
              children: [
                _buildSideContent(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildFormContent(context, authForm, ref),
                  ),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(40.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                elevation: 5.0,
                child: Row(
                  children: [
                    _buildSideContent(context),
                    Expanded(
                      child: SingleChildScrollView(
                        child: _buildFormContent(context, authForm, ref),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

//design near the login card, chaged between different screen type
  Widget _buildSideContent(BuildContext context) {
    return ResponsiveHelper.isMobile(context)
        ? Container(
            width: double.infinity,
            // MediaQuery.of(context).size.width / 3.2,
            height: null,
            // MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.yellow[600],
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40))
                // : const BorderRadius.only(
                //     topLeft: Radius.circular(40),
                //     bottomLeft: Radius.circular(40),
                //   )
                ),
            padding: EdgeInsets.all(20.0),
            // const EdgeInsets.only(top: 70.0, right: 50.0, left: 50.0),
            child: const Align(
              alignment: Alignment.center,
              // Alignment.centerRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.black87,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/1537635/pexels-photo-1537635.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                    radius: 70.0,
                  ),
                  const SizedBox(height: 30.0),
                  Text("Let's get you set up",
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center
                      // TextAlign.left,
                      ),
                  const SizedBox(height: 5.0),
                  const Text(
                    "It should only take a couple of minutes to pair with your watch",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  const CircleAvatar(
                    backgroundColor: Colors.black87,
                    child: Text(
                      ">",
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width / 3.2,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.yellow[600],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                )),
            padding: const EdgeInsets.only(top: 70.0, right: 50.0, left: 50.0),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.black87,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/1537635/pexels-photo-1537635.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                    radius: 70.0,
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    "Let's get you set up",
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    "It should only take a couple of minutes to pair with your watch",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  const CircleAvatar(
                    backgroundColor: Colors.black87,
                    child: Text(
                      ">",
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget _buildFormContent(
      BuildContext context, AuthForm authForm, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SizedBox(
          width: ResponsiveHelper.isMobile(context)
              ? double.infinity
              : MediaQuery.of(context).size.width / 2.5,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: authForm == AuthForm.login
                  ? LoginForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      onToggle: () => ref
                          .read(authFormProvider.notifier)
                          .state = AuthForm.signUp,
                    )
                  : SignUpForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      onToggle: () => ref
                          .read(authFormProvider.notifier)
                          .state = AuthForm.login,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
