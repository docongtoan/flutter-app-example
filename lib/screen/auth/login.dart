import 'package:flutter/material.dart';
import 'package:flutter_app_example/components/common/custom_input_field.dart';
import 'package:flutter_app_example/components/common/page_header.dart';
import 'package:flutter_app_example/components/common/custom_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_app_example/screen/auth/forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg-login.jpg"),
          fit: BoxFit.cover,
        )),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const PageHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          CustomInputField(
                            labelText: 'Email',
                            hintText: 'Nhập vào email',
                            valueCrt: _email,
                            prefixIcon: true,
                            prefixIconValue: const Icon(Icons.email),
                            validator: (textValue) {
                              if (textValue == null || textValue.isEmpty) {
                                return 'Email không được rỗng';
                              }
                              if (!EmailValidator.validate(textValue)) {
                                return 'Vui lòng nhập đúng định dạng email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomInputField(
                              labelText: 'Mật khẩu',
                              hintText: 'Nhập mật khẩu',
                              valueCrt: _password,
                              obscureText: true,
                              suffixIcon: true,
                              prefixIcon: true,
                              prefixIconValue: const Icon(Icons.key),
                              validator: (textValue) {
                                if (textValue == null || textValue.isEmpty) {
                                  return 'Mật khẩu không được rỗng';
                                }
                                if (textValue.length < 5) {
                                  return 'Mật khẩu phải có ít nhất 5 ký tự';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: size.width * 0.8,
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPassword()))
                              },
                              child: const Text(
                                'Quên mật khẩu?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            innerText: 'Đăng nhập',
                            onPressed: _handleLoginUser,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }

  void _handleLoginUser() {
    if (_loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Submit data')));
    }
  }
}
