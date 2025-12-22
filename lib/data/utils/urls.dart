class Urls{
  static String _baseUrl = 'http://35.73.30.144:2005/api/v1';

  static String registrationUrl  = '$_baseUrl/registration';//registration page er jonno url postman theke make kora
  static String loginUrl  = '$_baseUrl/login';
   static String createTaskUrl  = '$_baseUrl/createTask';
  static String taskCountUrl  = '$_baseUrl/taskStatusCount';
  static String newTaskUrl  = '$_baseUrl/listTaskByStatus/New';
  static String progressTaskUrl  = '$_baseUrl/listTaskByStatus/Progress';
  static String completedTaskUrl  = '$_baseUrl/listTaskByStatus/Completed';
  static String cancelledTaskUrl  = '$_baseUrl/listTaskByStatus/Cancelled';
  static String deleteTaskUrl(String taskId)  => '$_baseUrl/deleteTask/$taskId';




  static String changeStatus(String taskId,String status)   => '$_baseUrl/updateTaskStatus/$taskId/$status';               ///eta nisi screen e je Showdialog e page ta ashe oitar maddome onno page e select er sath sathe jate jai

  //static String taskList(String type)   => '$_baseUrl/listTaskByStatus/$type';//jodi ekta url diye new,copleted,cancelled,progress kori tahole eibabe korbo






}