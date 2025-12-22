import 'package:flutter/material.dart';
import 'package:task_manager/ui/widget/task_card.dart';
import 'package:task_manager/ui/widget/tm_app_bar.dart';

import '../../data/model/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../widget/snack_bar.dart';
class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  List<TaskModel> _completedTaskList = [];
  bool _isLoading = false;

  Future<void>_getAllTasks() async {
    _isLoading =true;
    setState(() {

    });
    ///Api///
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.completedTaskUrl,
    );
    _isLoading = false;
    setState(() {

    });

    List<TaskModel> list =[];
    if(response.isSuccess){
      for(Map<String,dynamic> jsonData in response.responseData['data']){//jsondata holo model er ar responseData holo api taskCount er Data r bitorer ta
        list.add(TaskModel.fromJson(jsonData));
      }

    }else{
      showSnackBarMessage(context, response.errorMessage.toString());
    }
    _completedTaskList= list;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllTasks();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Visibility(
          visible: _isLoading ==  false ,
          replacement: Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: _completedTaskList.length,
            itemBuilder: (context, index) {
              return TaskCard(
                taskModel: _completedTaskList[index],
                cardColor: Colors.blue,
                refreshParent: (){
                  _getAllTasks();
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 4,
              );
            },
          ),

      ),
      )
    );
  }
}
