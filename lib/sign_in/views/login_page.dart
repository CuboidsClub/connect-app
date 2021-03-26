import 'package:biher_noticeboard/sign_in/viewmodel/authviewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String id = '';
  String phone = '';
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRepository>(
      builder: (context, userRepository, _) {
        return Scaffold(
          body: Form(
            key: _formkey,
            child: Container(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) =>
                        value!.length >= 5 ? null : 'Invalid ID',
                    onSaved: (value) {
                      id = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Employee id',
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      phone = value!;
                    },
                    validator: (value) =>
                        value!.length >= 10 ? null : 'Invalid Phone',
                    decoration: InputDecoration(
                      labelText: 'Phone',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        context
                            .read<UserRepository>()
                            .signIn(id, '+91' + phone, context);
                      }
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
