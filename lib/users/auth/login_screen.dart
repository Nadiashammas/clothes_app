import 'package:ecommerce_app/users/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var secure = true.obs;

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
                                  Material(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                                      child: Text('login', style: TextStyle(color: Colors.white,fontSize: 16),),
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
                              const Text ("Don't have an Account? ", style: TextStyle(
                                color: Colors.white60,
                              ),),
                              TextButton (
                                onPressed: (){
                                  Get.to(const SignUp());
                                },
                                child: const Text(" Signup here", style: TextStyle(
                                color: Colors.amberAccent,

                              ),),)
                            ],
                          ),
                         const Text("or",style: TextStyle(color: Colors.white60),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text ("Are you an Admin? ", style: TextStyle(
                                color: Colors.white60,
                              ),),
                              TextButton (
                                onPressed: (){},
                                child: const Text(" Click here", style: TextStyle(
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
}
