import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market/Classes/UserClass.dart';
import 'package:market/Widgets/bottom_nav.dart';
import 'package:market/Widgets/pref_userdata.dart';
import 'package:market/auth/Login.dart';

class SignUpAuth extends StatefulWidget {
  @override
  _SignUpAuthState createState() => _SignUpAuthState();
}

class _SignUpAuthState extends State<SignUpAuth> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _username = new TextEditingController();

  bool isloading = false;
  bool _isObscure = true;
  var _formkey = GlobalKey<FormState>();
  TapGestureRecognizer _tapgesture;

  String userimage= "https://firebasestorage.googleapis.com/v0/b/markets-9fae0.appspot.com/o/user%20image%2Fuser.jpg?alt=media&token=c05fceb6-f06d-4497-9247-fa12c8efa0a4";
  String usercontact= " ";
  String useraddress= " ";




  Future<void> signup(BuildContext context) async{

    setState(() {
      isloading=true;
    });
    if (_formkey.currentState.validate()){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text,
            password: _password.text
        ).then((user) async {

          UserClass userClass = new UserClass();
          userClass.image= userimage.toString();
          userClass.email= _email.text;
          userClass.contact = usercontact.toString();
          userClass.address= useraddress.toString();
          userClass.name= _username.text;
          String useruid= FirebaseAuth.instance.currentUser.uid.toString();
          userClass.docid=useruid.toString();
          await FirebaseFirestore.instance.collection("Users").doc(useruid).set(userClass.toMap());

          Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));
          Fluttertoast.showToast(msg: "Successfull");
          }).catchError((onError){
          Fluttertoast.showToast(msg: "error" + FlutterError.onError.toString());
          });
      }catch(e){
        Fluttertoast.showToast(msg: "Error while Login Retry ");
      }
      uploadData(_username.text);

    }

    setState(() {
      isloading=false;
    });

  }




  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: isloading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
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
              // hello
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //       child: Container(
              //         child: Text(
              //           "Hello",
              //           style: GoogleFonts.poppins(
              //               fontWeight: FontWeight.w600,
              //               fontSize: 70,
              //               letterSpacing: 2,
              //               height: 1),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "SignUp in to your account",
                      style: GoogleFonts.doHyeon(
                          fontSize: 18, color: Colors.black26),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  userInputCard("User Name", false),
                  emaildInputCard("Email", false),
                  passworddInputCard("password", true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextButton(
                            onPressed: () {
                              Fluttertoast.showToast(msg: "This Feature is not Avaliable");
                            },
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
                    signup(context);
                  },
                  child: Container(
                    width: size.width / 2,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Sign Up",
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Already have an account ?",
                          style: GoogleFonts.doHyeon(color: Colors.black26)
                      )),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context)=> LoginAuth())
                      );
                      print("===========================");
                    },
                    child: RichText(
                      text: TextSpan(
                          text: " Login",
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


  Padding userInputCard(String hint, bool pass) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        shadowColor: Colors.black26,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: _username,
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

