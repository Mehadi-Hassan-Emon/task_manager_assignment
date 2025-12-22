import 'package:flutter/material.dart';
import 'package:task_manager/data/utils/urls.dart';

import '../../data/model/task_model.dart';
import '../../data/services/api_caller.dart';
import '../widget/snack_bar.dart';
import '../widget/task_card.dart';
import '../widget/tm_app_bar.dart';
class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {

  List<TaskModel> _cancelledTaskList = [];
  bool _isLoading = false;

  Future<void>_getAllTasks() async {
    _isLoading =true;
    setState(() {

    });
    ///Api///
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.cancelledTaskUrl,
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
    _cancelledTaskList= list;
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
          child:  ListView.separated(
            itemCount: _cancelledTaskList.length,

            itemBuilder: (context, index) {
              return TaskCard(
             /// return TaskCard(status: 'Canceled', cardColor: Colors.red,);

                taskModel: _cancelledTaskList[index],
                cardColor: Colors.red,
                refreshParent: () {
                  _getAllTasks();
                },
              );
            },

            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
          ),

        ),
      ),
    );

  }
}
