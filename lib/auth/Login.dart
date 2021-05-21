import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market/Widgets/bottom_nav.dart';
import 'package:market/Widgets/pref_userdata.dart';
import 'package:market/auth/Signup.dart';

class LoginAuth extends StatefulWidget {
  @override
  _LoginAuthState createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {

  //    ------  2   ----   and initiaze it in textformfield
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _username = new TextEditingController();

  DocumentSnapshot varible;

  bool isloading=false;
  bool _isObscure = true;
  var _formkey = GlobalKey<FormState>();


  Future<void> signin(BuildContext context) async{

    setState(() {isloading=true;});

    if(_formkey.currentState.validate()){
      try{
        UserCredential userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => BottomNavigation()),
                (Route<dynamic> route) => false);
      }catch(e){
        Fluttertoast.showToast(msg: "Error while Login Retry ");
      }
    }else{
      Fluttertoast.showToast(msg: "Error while Login Retry ");
    }
    Fluttertoast.showToast(msg: "Sign in successfully");
    setState(() {
      isloading=false;
    });
    // MainScreen123();
  }

  @override
  void initState() {
    // TODO: implement initState
    if(AllUserData.isEmpty){
      dataupload();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isloading ? Center(child: CircularProgressIndicator()) :  SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper1(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.35,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFFFFB473), Color(0xFFFF42BA)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                    ),
                  ),
                  ClipPath(
                    clipper: MyClipper2(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.35,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFB473).withOpacity(0.5),
                                Color(0xFFFF42BA).withOpacity(0.5)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                    ),
                  ),
                  ClipPath(
                    clipper: MyClipper3(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.35,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFB473).withOpacity(0.5),
                                Color(0xFFFF42BA).withOpacity(0.5)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      width: size.width * 0.45,
                      height: size.height * 0.3,
                      child: Image(image: AssetImage('assets/images/wall.png')),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Login in to your account",
                      style: GoogleFonts.doHyeon(
                          fontSize: 18, color: Colors.black26),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),

              Column(
                children: [
                  emaildInputCard("Email", false),
                  passworddInputCard("password", true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Forgot your Password?",
                                style: TextStyle(
                                  color: Colors.black26,
                                )
                            )),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    signin(context);
                  },
                  child: Container(
                    width: size.width / 2,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.doHyeon(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [Color(0xFFFFB473), Color(0xFFFF42BA)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Don't have an account ?",
                          style: GoogleFonts.doHyeon(color: Colors.black26)
                      )),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context)=> SignUpAuth())
                      );
                      print("===========================");
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "  Create",
                        style: GoogleFonts.doHyeon(
                            color: Color(0xFFFF42BA),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )


            ],
          ),
        ),
      ),
    );
  }



  void dataupload()async {
    String useruid = FirebaseAuth.instance.currentUser.uid.toString();
    varible = await FirebaseFirestore.instance.collection("Users").doc(useruid).get();
    AllUserData.add(varible['address']); //  0  adrress
    AllUserData.add(varible['contact']); //  1 contact
    AllUserData.add(varible['docid']); // 2   docid
    AllUserData.add(varible['email']); //  3  email
    AllUserData.add(varible['image']); // 4   image
    AllUserData.add(varible['name']); // 5    name
    print(AllUserData);
    print("---------------------------------------------");
  }


  Padding emaildInputCard(String hint, bool pass) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        shadowColor: Colors.black26,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            validator:  (item){
              return item.contains("@") ? null : "Enter Valid Email";
            },
            controller: _email,
            obscureText: pass ? _isObscure : false,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.doHyeon(color: Colors.black26),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: pass ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.black26,
                    )) : null
            ),

          ),
        ),
      ),
    );
  }
  Padding passworddInputCard(String hint, bool pass) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        shadowColor: Colors.black26,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            validator: (item){
              return item.length > 0 ? null : "Password Must Contain 6 digit";
            },
            controller: _password,
            obscureText: pass ? _isObscure : false,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.doHyeon(color: Colors.black26),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: pass ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.black26,
                    )) : null
            ),

          ),
        ),
      ),
    );
  }
}

class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.quadraticBezierTo(0, size.height * 0.6, 0, size.height * 0.8);
    path.cubicTo(size.width * 0.35, size.height, size.width * 0.6,
        size.height * 0.6, size.width, size.height * 0.8);
    path.quadraticBezierTo(size.width, size.height * 0.6, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.quadraticBezierTo(0, size.height * 0.6, 0, size.height * 0.8);
    path.cubicTo(size.width * 0.56, size.height * 1.07, size.width * 0.7,
        size.height * 0.6, size.width, size.height * 0.8);
    path.quadraticBezierTo(size.width, size.height * 0.6, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.96, size.width, size.height * 0.8);
    path.quadraticBezierTo(size.width, size.height * 0.6, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

