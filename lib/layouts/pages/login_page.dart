import 'package:holedo/main.dart';
import 'package:holedo/models/holedoapi/data.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/utils/validator.dart';
import 'package:routemaster/routemaster.dart';

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
  final UsersController usersControler = Get.put(HoledoDatabase().users);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;
  bool checked = false;
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Processing Data'),
          backgroundColor: Colors.green.shade300,
        ),
      );
      if (_usernameController.text.isNotEmpty) {
        var api = new Holedoapi();
        api = await api.login(
            context: context,
            email: _usernameController.text,
            password: _passwordController.text);
        print('cjec: ${api.data?.user?.toJson().toString()}');

        if (api.success == true) {
          Provider.of<AppState>(context, listen: false).username =
              _usernameController.text;
          Provider.of<AppState>(context, listen: false).profile =
              api.data?.user;
          var redirect = widget.redirectTo;
          if (redirect == null) redirect = '/profile/${api.data?.user?.slug}';
          Routemaster.of(context).push(redirect);
        }
        if (api.errors != null) {
          holedoDatabase.snackBarMessage(
              context, 'error', api.errors.toString());
        }
        if (api.messages != null) {
          holedoDatabase.snackBarMessage(
              context, 'error', api.messages.toString());
        }
      }
    } else {
      holedoDatabase.snackBarMessage(
          context, 'error', 'Error: ${_formKey.currentState!.validate()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PageScaffold(
      title: 'Log in',
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 0.85,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // SizedBox(height: size.height * 0.08),
                          const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.06),
                          TextFormField(
                            controller: _usernameController,
                            validator: (value) {
                              return Validator.validateEmail(value ?? "");
                            },
                            decoration: InputDecoration(
                              hintText: "Email",
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          TextFormField(
                            obscureText: _showPassword,
                            controller: _passwordController,
                            validator: (value) {
                              return Validator.validatePassword(value ?? "");
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(
                                      () => _showPassword = !_showPassword);
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "Password",
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _login,
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15)),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
