import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'package:holedo/models/holedoapi/user.dart';

class LoginPage extends StatefulWidget {
  static const usernameFieldKey = Key('username-field');
  static const passwordFieldKey = Key('password-field');
  static const loginButtonKey = Key('login-button');

  final String? redirectTo;

  const LoginPage({
    Key? key,
    this.redirectTo = '/',
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final UsersController controller = Get.put(UsersController());

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_usernameController.text.isNotEmpty) {
      User? user = await controller.login(
          email: _usernameController.text, password: _passwordController.text);
      print('cjec: ${controller.isLogin.value}');
      //
      if (controller.isLogin.value) {
        Provider.of<AppState>(context, listen: false).username =
            _usernameController.text;
        Provider.of<AppState>(context, listen: false).profile = user;
        var redirect = widget.redirectTo;
        if (redirect == null) redirect = '/profile/${user.slug}';
        Routemaster.of(context).push(redirect);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Log in',
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Type any username to login'),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Username:'),
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      controller: _usernameController,
                      key: LoginPage.usernameFieldKey,
                      onSubmitted: (_) => _login(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Password:'),
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      controller: _passwordController,
                      key: LoginPage.passwordFieldKey,
                      onSubmitted: (_) => _login(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              AnimatedBuilder(
                animation: _usernameController,
                builder: (_, __) => ElevatedButton(
                  key: LoginPage.loginButtonKey,
                  onPressed: _usernameController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty
                      ? _login
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text('Log in'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
