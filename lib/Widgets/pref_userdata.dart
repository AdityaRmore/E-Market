import 'package:shared_preferences/shared_preferences.dart';

List nullcheck=[];
List Data=[];
List AllUserData=[];
List RecomendedShop1=[];
List RecomendedShop2=[];
List RecomendedShop3=[];
List RecomendedShop4=[];

Future<bool> uploadData(String username) async{
  if(nullcheck.isEmpty){
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString("name", username.toUpperCase());
    nullcheck.add("djbjhc");
    print("=========Success================");
    return preferences.commit();
  }
}

Future<String> getData233() async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    String name= preferences.getString("name");
    return name;
}