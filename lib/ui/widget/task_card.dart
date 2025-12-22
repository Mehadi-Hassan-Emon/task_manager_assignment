import 'package:flutter/material.dart';
import 'package:task_manager/data/model/task_model.dart';
import 'package:task_manager/ui/widget/snack_bar.dart';

import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });
  //status gula nise bcz  nische je button ache oigula page onujayi ekek rokom
  final  TaskModel taskModel;
  final Color cardColor;
 final VoidCallback refreshParent;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {


    //Api//eta nisi screen e je Showdialog e page ta ashe oitar maddome onno page e select er sath sathe jate jai
    bool _changeStatusInProgress = false;
    bool _deleteLoading = false;


    Future<void>_changeStatus(String status) async {//ei status ta user ke updat korbe// parameter use korsi bcz urls e sobgular jonno dynamic urls use korsi tai just parameter call kore sob kichu korbo
      _changeStatusInProgress =true;

      ///Api///
      final ApiResponse response = await ApiCaller.getRequest(
        url: Urls.changeStatus(widget.taskModel.id, status),//taskid ta taskmodel er id theke nise//taskmodel er id thekei astase
      );
      _changeStatusInProgress = false;
      setState(() {

      });
      if(response.isSuccess){
        widget.refreshParent();
        Navigator.pop(context);
      }else{
        showSnackBarMessage(context, response.errorMessage.toString());
      }
    }


    ///delete
    Future<void>deleteTask()async{
      _deleteLoading = true;
      final ApiResponse response =await ApiCaller.getRequest(url: Urls.deleteTaskUrl(widget.taskModel.id));
      _deleteLoading = false;
      setState(() {

      });
      if(response.isSuccess){
        widget.refreshParent();
        showSnackBarMessage(context, 'Task Deleted');
      }else{
        showSnackBarMessage(context, response.errorMessage.toString());
      }
    }


//page ashbe and 4 ta page er name ashbe
    void _showChangeStatusDialog(){
      showDialog(context: context, builder:(context){
        return AlertDialog(
          title: Text('Change status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: (){
                  _changeStatus('New');
                },
                title: Text('New'),
                trailing: widget.taskModel.status == 'New' ? Icon(Icons.done): null,
              ),
              ListTile(
                onTap: (){
                  _changeStatus('Progress');
                },
                title: Text('Progress'),
                trailing: widget.taskModel.status == 'Progress' ? Icon(Icons.done): null,
              ),
              ListTile(
                onTap: (){
                  _changeStatus('Cancelled');
                },
                title: Text('Cancelled'),
                trailing: widget.taskModel.status == 'Cancelled' ? Icon(Icons.done): null,
              ),
              ListTile(
                onTap: (){
                  _changeStatus('Completed');
                },
                title: Text('Completed'),
                trailing: widget.taskModel.status == 'Completed' ? Icon(Icons.done): null,
              ),
            ],
          ),
        );
      });
    }






    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8)
          ),
          title: Text(widget.taskModel.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 18,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.taskModel.description),
              Text('Data: ${widget.taskModel.createdDate}'),
              Row(
                children: [
                  Chip(
                    label:Text(widget.taskModel.status),
                    backgroundColor:widget.cardColor,
                    labelStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal:18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){
                    _showChangeStatusDialog();
                  }, icon: Icon(Icons.edit_note_outlined)),
                  IconButton(onPressed: (){
                    deleteTask();
                  }, icon: Icon(Icons.delete,color: Colors.red,)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
