class MyUser {

  static const String collectionName = "my_user";

  String id ;
  String name ;
  String email ;
  String phone ;

  MyUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });


  MyUser.fromFireStore(Map<String,dynamic> data):this(
     id: data['id'],
     name: data['name'],
     email: data['email'],
     phone: data['phone'],
  );

  Map<String,dynamic> toFireStore (){
   return {
     'id' : id,
     'name' : name,
     'email' : email,
     'phone' : phone,
   };





  }



}
