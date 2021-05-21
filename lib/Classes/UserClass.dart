class UserClass{
  String image;
  String name;
  String email;
  String address;
  String contact;
  String docid;


  UserClass({this.image, this.name, this.address, this.contact, this.email, this.docid});

  toMap(){
    Map<String, dynamic> map=Map();
    map['image']=image;
    map['name']=name;
    map['email']=email;
    map['address']=address;
    map['contact']=contact;
    map['docid']=docid;
    return map;

  }

}

