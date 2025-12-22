import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/ui/widget/screen_background.dart';
import 'package:task_manager/ui/widget/tm_app_bar.dart';

import '../widget/photo_picker.dart';
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});



  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final ImagePicker _imagePicker =ImagePicker();//object
  XFile? _selectedImage;
  Future<void> _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);//image picker package theke ei line ta ante hobe

    //image ta je add korsi ta screen e show korte ei conditon chalate hobe
    if(image != null){
      _selectedImage = image;
      setState(() {

      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
          child:Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Text('Update Profile',
            style: Theme.of(context).textTheme.titleLarge,//font boro kora// (TextTheme class) website e ache kibabe text boro kora jai
          ),
          const SizedBox(height: 10,),



          photo_picker(ontap: _pickImage,selectedPhoto: _selectedImage,),//widget make korsi//ontap e pickimage gallery theke pic ashbe//






          const SizedBox(height: 15,),

          TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          SizedBox(height: 15,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'First Name',
            ),
          ),
          SizedBox(height: 15,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Last Name',
            ),
          ),
          SizedBox(height: 15,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Mobile',
            ),
          ),
          SizedBox(height: 15,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          const SizedBox(height: 16,),
          FilledButton(onPressed: (){
          }, child: Icon(Icons.arrow_circle_right_outlined,),),
          const SizedBox(height: 35,),
        ],
      ),
    )

    ),
    );
  }
}

///profile e click korle eita page ta ashbe
