import 'package:flutter/material.dart';
import 'package:digital_menu/client/screens/cl_sign_up.dart';
import 'package:digital_menu/client/screens/cl_login.dart';
import 'package:digital_menu/services/responsive/responsive_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Widget _buildSideContent(BuildContext context) {
    return Container(
      width: ResponsiveHelper.isMobile(context)
          ? double.infinity
          : MediaQuery.of(context).size.width / 3.3,
      height: ResponsiveHelper.isMobile(context)
          ? null
          : MediaQuery.of(context).size.height,
      color: Colors.yellow[600],
      child: Padding(
        padding: ResponsiveHelper.isMobile(context)
            ? const EdgeInsets.all(20.0)
            : const EdgeInsets.only(top: 70.0, right: 50.0, left: 50.0),
        child: Align(
          alignment: ResponsiveHelper.isMobile(context)
              ? Alignment.center
              : Alignment.centerRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.black87,
                backgroundImage: NetworkImage(
                  'https://media.finedinemenu.com/filters:strip_exif()/filters:format(webp)/475x475/JTMY8AYcI/831528d7-2b4e-4f22-a8d3-c7fa74380053.png',
                ),
                radius: 70.0,
              ),
              SizedBox(height: 30.0),
              Text(
                "Let's get you set up",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: ResponsiveHelper.isMobile(context)
                    ? TextAlign.center
                    : TextAlign.left,
              ),
              SizedBox(height: 5.0),
              Text(
                "It should only take a couple of minutes to pair with your watch",
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              CircleAvatar(
                backgroundColor: Colors.black87,
                child: Text(
                  ">",
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ],
          ),
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
