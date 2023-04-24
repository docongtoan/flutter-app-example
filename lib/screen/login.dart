import 'package:flutter/material.dart';
import 'package:flutter_app_example/components/common/custom_heading.dart';
import 'package:flutter_app_example/components/common/custom_input_field.dart';
import 'package:flutter_app_example/components/common/page_header.dart';
import 'package:email_validator/email_validator.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key) ;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:AssetImage("assets/images/bg-login.jpg"),
                fit: BoxFit.cover,
            )
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                children:[
                  const PageHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _loginFormKey,
                        child: Column(
                          children: [
                            const CustomHeading(title: 'Đăng Nhập'),
                            CustomInputField(
                              labelText: 'Email',
                              hintText: 'Nhập vào email',
                              validator: (textValue){
                                if(textValue == null || textValue.isEmpty){
                                  return 'Email không được rỗng';
                                }
                                if(!EmailValidator.validate(textValue)){
                                  return 'Vui lòng nhập đúng định dạng email';
                                }
                                return null;
                              }
                            ),
                            CustomInputField(
                                labelText: 'Mật khẩu',
                                hintText: 'Nhập mật khẩu',

                                validator: (textValue){
                                  if(textValue == null || textValue.isEmpty){
                                    return 'Mật khẩu không được rỗng';
                                  }
                                  if(textValue.length < 5){
                                    return 'Mật khẩu phải có ít nhất 5 ký tự';
                                  }
                                  return null;
                                }
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
      ]
    );
  }
}
