import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  String admno='';
  final storage = GetStorage();
  var userDetails={};
  String course='';
  String university='';
  var degrees = {
    "MCA": ["Networks", "Data Structures", "DBMS"],
    "Bsc Physics": ["Quantum", "Electromagnetism", "Mechanics"],
    "Bsc Maths": ["Algebra", "Calculus", "Probability"]
  };
  List<String> subjects=[];

  @override
  void onInit() {
    admno=Get.arguments as String;
    getUserDetails();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getUserDetails(){
    List<dynamic> usersList = storage.read<List>('users') ?? [];
    for (var user in usersList) {
      if (user['admno']==admno) {
        userDetails=user;
        course=userDetails['course'];
        university=userDetails['university'];
        print(userDetails);
      }

    }
    getSubjects();
  }

  void getSubjects(){
    if(course=='MCA'){
      subjects=degrees['MCA']!;
    }
    else if(course=='Bsc Physics'){
      subjects=degrees['Bsc Physics']!;
    }
    else{
      subjects=degrees['Bsc Maths']!;
    }
  }

}
