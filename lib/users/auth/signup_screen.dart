import 'dart:convert';

import 'package:ecommerce_app/users/auth/login_screen.dart';
import 'package:ecommerce_app/users/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../api_connection/api_connection.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var secure = true.obs;

validateUserEmail () async {
  try {
    var res = await http.post(Uri.parse(API.validateEmail),
    body: {
      'user_email': emailController.text.trim(),
    });
    if (res.statusCode == 200) {
      var resBodyOfValidateEmail = jsonDecode(res.body);
      if (resBodyOfValidateEmail['emailFound']) {
        Fluttertoast.showToast(msg: 'email is already in someone else use, please try another email');
      }
      else {
        registerAndSaveUserRecord();
      }}}
  catch (e)
  {
    print(e.toString());
    Fluttertoast.showToast(msg: e.toString());
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, cons){
          return ConstrainedBox(constraints: BoxConstraints(
            minHeight: cons.maxHeight,
          ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child: Image.asset('assets/images/shopping.jpg'),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(0, -3),
                            ),

                          ]

                      ),

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                        child: Column(
                          children: [
                            Form(
                                key: formKey,
                                child: Column(
                                  children: [

                                    //NAME TEST FIELD
                                    TextFormField(
                                      controller: nameController,
                                      validator: (val) => val == "" ? "please write name" : null,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.person, color: Colors.black,),
                                          hintText: "name...",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 6
                                          ),
                                          fillColor: Colors.white,
                                          filled: true
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),

                                    //EMAIL TEXT FIELD
                                    TextFormField(
                                      controller: emailController,
                                      validator: (val) => val == "" ? "please write email" : null,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.email, color: Colors.black,),
                                          hintText: "email...",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 6
                                          ),
                                          fillColor: Colors.white,
                                          filled: true
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    //PASSWORD TEXT FIELD
                                    Obx(() =>   TextFormField(
                                      obscureText: secure.value,
                                      controller: passwordController,
                                      validator: (val) => val == "" ? "please write password" : null,
                                      decoration: InputDecoration(
                                          prefixIcon:  Icon(Icons.vpn_key, color: Colors.black,),
                                          suffixIcon: Obx(
                                                  () => GestureDetector(
                                                onTap: (){
                                                  secure.value = !secure.value ;
                                                },
                                                child: Icon(
                                                    secure.value ? Icons.visibility_off : Icons.visibility
                                                ),
                                              )
                                          ),

                                          hintText: "password...",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 6
                                          ),
                                          fillColor: Colors.white,
                                          filled: true
                                      ),
                                    ),),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    //BUTTON LOGIN
                                    InkWell(
                                      onTap: (){
                                        if (formKey.currentState!.validate()) {
                                          validateUserEmail();
                                        }  
                                      },
                                      child: Material(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                                          child: Text('SignUp', style: TextStyle(color: Colors.white,fontSize: 16),),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text ("You have an Account? ", style: TextStyle(
                                  color: Colors.white60,
                                ),),
                                TextButton (
                                  onPressed: (){
                                    Get.to(const LoginScreen());
                                  },
                                  child: const Text(" login here", style: TextStyle(
                                    color: Colors.amberAccent,

                                  ),),)
                              ],
                            ),

                          ],
                        ),
                      ),


                    ),
                  ),

                ],
              ),

            ),
          );
        },
      ),
    );
  }

  void registerAndSaveUserRecord() async {
    User userModel = User(
        1,
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim());
  try
  {
    var res = await http.post(Uri.parse(API.signUp),
    body: userModel.toJason(),);
    if (res.statusCode == 200) {
      var resBodyOfSignUp = jsonDecode(res.body);
      if (resBodyOfSignUp['success']) {
        Fluttertoast.showToast(msg: 'Congratulation, you are signUp successfully');
      }
      else{
        Fluttertoast.showToast(msg: 'Error Occurred, try again  ');
      }}}
    catch (e)
    {
    print(e.toString());
    Fluttertoast.showToast(msg: e.toString());
    }
}



}
