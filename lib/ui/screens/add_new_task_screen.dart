import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widget/screen_background.dart';
import 'package:task_manager/ui/widget/snack_bar.dart';
import 'package:task_manager/ui/widget/tm_app_bar.dart';
class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                SizedBox(height: 80,),
                Text('Add New Task',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                
                const SizedBox(height: 20,),
                TextFormField(
                  controller: titleController,
                  maxLines: 6,          
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                    validator: (
                        String ? value) { 
                      if (value == null || value.isEmpty) {
                        return 'please enter title';
                      }
                      return null;
                    }
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                    validator: (
                        String ? value) { 
                      if (value == null || value.isEmpty) {
                        return 'please enter Description';
                      }
                      return null;
                    }
                ),
                 const SizedBox(height: 20,),
                FilledButton(onPressed: (){
                  if(_formKey.currentState !.validate()){
                    addNewTak();
                  };
                }, child: Icon(Icons.arrow_circle_right_outlined))
                        ],
                      ),
              ),
            ),
          )),
    );
  }
  bool _addTaskProgress = false;
  ///Api
  Future<void>addNewTak()async{
    _addTaskProgress = true;
    setState(() {

    });
    Map<String,dynamic>requestBody = {
      "title":titleController.text,
      "description":descriptionController.text,
      "status":"New"
    };
    final ApiResponse response =await ApiCaller.postRequest(
        url: Urls.createTaskUrl,
      body: requestBody,
    );
    _addTaskProgress = false;
    setState(() {

    });
    if(response.isSuccess){
      _clearField();
      Navigator.pushNamedAndRemoveUntil(context, 'NavBar',(predicate)=>false);
      showSnackBarMessage(context,'New task added');

    }else{
      showSnackBarMessage(context,response.errorMessage!);
    }
  }

  _clearField(){
    titleController.clear();
    descriptionController.clear();
  }
}





//new task e floating action button e click korle ei page tga ashbe
