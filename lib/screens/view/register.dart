import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nubae/authentication/authentication.dart';
import 'package:nubae/screens/view/constants.dart';
import 'package:nubae/screens/view/homepage.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


//  _textControllers

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _raceController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  bool _male = false;


  _register() async {
    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _ageController.text.isNotEmpty && _raceController.text.isNotEmpty){
      var resonse = await signUp(_emailController.text, _passwordController.text, _userNameController.text, int.parse(_ageController.text), _male, _raceController.text, _countryController.text, _cityController.text);
      if(resonse is bool)return Fluttertoast.showToast(msg: "Couldn't sign you in");
      Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> HomePage()));
    }
    else{
      Fluttertoast.showToast(msg: "Fill All Areas to continue");
    }
  }


  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);



    // TODO: implement build
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black, BlendMode.dstATop),
            image: AssetImage("assets/images/datingregister.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: height * 0.06),
                      Column(
                        children: [
                          Text(
                            "Create Account",
                            style: welcomeStyle,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "match and date TODAY!!!",
                            style: loginTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.black.withOpacity(0.5),
                            child: TextField(
                              controller: _userNameController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person,color: Colors.white), hintStyle: TextStyle(color: Colors.white), hintText: "User Name"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.black.withOpacity(0.5),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: _emailController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.email,color: Colors.white), hintStyle: TextStyle(color: Colors.white), hintText: "Email Address"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock,color: Colors.white), hintStyle: TextStyle(color: Colors.white), hintText: "Password"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: _ageController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_today,color: Colors.white), hintStyle: TextStyle(color: Colors.white), hintText: "Age"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.public,color: Colors.white), hintStyle: TextStyle(color: Colors.white), hintText: "Country"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: _cityController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.location_searching,color: Colors.white), hintStyle: TextStyle(color: Colors.white), hintText: "City"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: _raceController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.face,color: Colors.white), hintStyle: TextStyle(color: Colors.white), hintText: "Race"),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            width: width,
                            height: 50,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange
                            ),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        _male = false;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: _male? Colors.transparent: Colors.white
                                        ),
                                      height: 50,
                                        width: width * 0.45,
                                        alignment: Alignment.center,
                                        child: Text("I'm a Woman",style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        _male = true;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: !_male? Colors.transparent: Colors.white
                                        ),
                                      height: 50,
                                        width: width * 0.45,
                                        alignment: Alignment.center,
                                        child: Text("I'm a Man",style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          RaisedButton(
                            color: Colors.orange,
                            onPressed: () => _register(),
                            child: Container(
                              width: width,
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                "Register",
                                style: loginButtonTextStyle,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          InkWell(
                            onTap: ()=> Navigator.of(context).pop(),
                            child: Container(
                              width: width,
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,child: Text("Already have an account? Login Here",style: loginTextStyle,)),
                            ),
                          )
                        ],
                      )

                      ,
//                    Column(
//                      children: [
//                        Text(
//                          "Or",
//                          style: loginTextStyle.apply(color: Colors.white),
//                        ),
//                      ],
//                    ),


//                    Column(
//                      children: [
//                        Container(
//                          width: width,
//                          height: 50,
//                          child: FacebookSignInButton(onPressed: () {
//                            // call authentication logic
//                          }),
//                        ),
//                        SizedBox(height: 30,),
//                        Container(
//                          height: 50,
//                          width: width,
//                          child: GoogleSignInButton(
//                            onPressed: () {},
//                          ),
//                        )
//                      ],
//                    ),

//                    Container(
//                      width: width,
//                      alignment: Alignment.center,
//                      child: Text("Don't have an account? Register Here",style: loginTextStyle,),
//                    )

                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 10,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,color: Colors.white,),
                      Text("Back",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
