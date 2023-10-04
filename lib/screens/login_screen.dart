import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixth_app/blocs/app_cubit/app_cubit.dart';
import 'package:sixth_app/screens/home_screen.dart';
import '../components/login_components/text_field.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.orange,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Hello , please Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textDirection: TextDirection.ltr,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Image(
                        image: AssetImage('assets/Hamburger-bro.png'),
                        width: 400,
                        height: 250),
                    const SizedBox(
                      height: 10,
                    ),
                    // const Text('برجر المدينة',
                    //  style: TextStyle(fontSize: 25 , color: Colors.black54),
                    //),
                    const Text(
                      'Burger Town',
                      style: TextStyle(fontSize: 35, color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextLoginField(
                            Icons.email, 'Email', (value){
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.endsWith('@gmail.com')){
                            return 'Email must end with @gmail.com';
                          }
                        }),

                    const SizedBox(
                      height: 10,
                    ),
                   TextLoginField(Icons.lock, 'Password',(value){
                     if (value == null || value.isEmpty) {
                       return 'Please enter your password';
                     } else if (value.length < 8) {
                       return 'password must be 8 characters or more';
                     }
                   }),

                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange[300]),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.ltr,
                      children: [
                        const Text(
                          'you don`t have an account yet ?',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.orange),
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
