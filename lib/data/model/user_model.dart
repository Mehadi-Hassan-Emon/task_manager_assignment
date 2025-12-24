//{"status":"success","data":
// {"_id":"694011f6880cc5d30a3042ef",
// "email":"fcbbarca@gmail.com",  ///password:lm10barca
// "firstName":"emon",
// "lastName":"mehadi",
// "mobile":"01320904238",
// "createdDate":"2025-10-02T06:21:41.011Z"},
// "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NjU4OTMwMDksImRhdGEiOiJmY2JiYXJjYUBnbWFpbC5jb20iLCJpYXQiOjE3NjU4MDY2MTB9.LQydpKk7Z_JcukcSEqPOEay0TGk-M3kAqYquUx3AAMY"}


class UserModel{
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String photo;


  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.photo,

  });

 factory UserModel.fromjson(Map<String,dynamic> jsonData){
    return UserModel(
        id: jsonData['_id'], 
        email: jsonData['email'],
        firstName: jsonData['firstName'],
        lastName: jsonData['lastName'],
        mobile: jsonData['mobile'],
        photo: jsonData['photo'] ?? '',


    );
  }
  Map<String,dynamic>toJson(){
   return {
     "id":id,
     "email":email,
     "firstName":firstName,
     "lastName":lastName,
     "mobile" :mobile,
     //"photo":photo,

   };

  }

}
//logout,alogin,add new task screen
