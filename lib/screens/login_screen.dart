import 'package:flutter/material.dart';
import 'package:mavazi/screens/signup_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState(){
    return _LoginScreenState();
  }
}
class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey =GlobalKey <FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePassword =true;
  @override    //this function
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child:Form( 
         key:loginFormKey,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 120,
            height: 160),
            SizedBox(height: 30),
          Text('Login',
          style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
          textAlign: TextAlign.center),

          SizedBox(height: 30),
          TextFormField(
            controller: emailController,
            keyboardType:TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(),

              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'Please enter valid email address';
                }
                if(!value.contains('@')){
                  return 'Enter valid email';
                }

                return null;
              },

            ),
          SizedBox(height:30),
          TextFormField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                labelText: 'password',
                border : OutlineInputBorder(),
                prefixIcon:Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                 onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                }, // Closes onPressed function
                icon: Icon(
                  hidePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                 // Closes Icon widget
              ), // Closes IconButton widget   
            ),
            validator: (value){
              if(value==null || value.isEmpty){
                return 'Enter your password';
              }
              return null;
            },
      
          ),
            SizedBox (height: 15),

            ElevatedButton(
              onPressed: (){
              if(loginFormKey.currentState!.validate()){

              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(8),
                ),
            ),
            child:const Text('Login',style: TextStyle(color:Colors.white),),
            ),

            SizedBox(height: 16,),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                const Text ("Don't  have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text('Sign Up'),
              ),
              ],
            ),
        ],
        ),
        ),
      ),
      ),
    );
  }
}
    
    
                                       
              
              
              
  

              
                