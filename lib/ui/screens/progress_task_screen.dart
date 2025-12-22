import 'package:flutter/material.dart';

import '../../data/model/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../widget/snack_bar.dart';
import '../widget/task_card.dart';
import '../widget/tm_app_bar.dart';
class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}
class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  List<TaskModel> _progressTaskList = [];
  bool _getprogressTaskProgress = false;

  Future<void>_getAllTasks() async {
    _getprogressTaskProgress =true;
    setState(() {

    });
    ///Api///
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.progressTaskUrl,
    );
    _getprogressTaskProgress = false;
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
    _progressTaskList= list;
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
          visible: _getprogressTaskProgress ==  false ,
          replacement: Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: _progressTaskList.length,
            itemBuilder: (context, index) {
              return TaskCard(
                taskModel: _progressTaskList[index],
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
