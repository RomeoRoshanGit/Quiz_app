import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/modules/utils/styles.dart';
import 'package:quiz_app/app/routes/app_pages.dart';

import '../../utils/color_res.dart';

class QuizPageController extends GetxController {
  //TODO: Implement QuizPageController
  late BuildContext context;
  String subject='';
  String name='';
  RxList questions=[].obs;
  RxInt questionIndex=0.obs;
  var selectedOption = (-1).obs;
  RxBool questionAnswered=false.obs;
  RxInt correctIndex=(-1).obs;
  int score=0;

  Map<String, List<Map<String, dynamic>>> quizData = {
    'Physics': [
      {
        'question': 'What is the unit of force?',
        'options': ['Newton', 'Joule', 'Watt', 'Pascal'],
        'correctAnswer': 'Newton',
      },
      {
        'question': 'What is the speed of light?',
        'options': ['300,000 km/s', '150,000 km/s', '1,000 km/s', '3,000 km/s'],
        'correctAnswer': '150,000 km/s',
      },
      {
        'question': 'What is the law of inertia?',
        'options': [
          'An object at rest stays at rest',
          'Force equals mass times acceleration',
          'Energy cannot be created or destroyed',
          'For every action, there is an equal and opposite reaction'
        ],
        'correctAnswer': 'An object at rest stays at rest',
      },
    ],
    'Chemistry': [
      {
        'question': 'What is the chemical symbol for water?',
        'options': ['H2O', 'O2', 'CO2', 'NaCl'],
        'correctAnswer': 'H2O',
      },
      {
        'question': 'What is the pH of pure water?',
        'options': ['7', '0', '14', '3'],
        'correctAnswer': '7',
      },
      {
        'question': 'Which gas is produced during photosynthesis?',
        'options': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
        'correctAnswer': 'Oxygen',
      },
    ],
    'Biology': [
      {
        'question': 'What is the powerhouse of the cell?',
        'options': ['Nucleus', 'Mitochondria', 'Ribosome', 'Endoplasmic Reticulum'],
        'correctAnswer': 'Mitochondria',
      },
      {
        'question': 'Which organ is responsible for pumping blood?',
        'options': ['Liver', 'Lungs', 'Heart', 'Kidneys'],
        'correctAnswer': 'Heart',
      },
      {
        'question': 'What is the basic unit of life?',
        'options': ['Tissue', 'Organ', 'Cell', 'System'],
        'correctAnswer': 'Cell',
      },
    ],
  };



  final count = 0.obs;
  @override
  void onInit() {
    List data=Get.arguments as List;
    subject=data[0];
    name=data[1];
    setQuestions(subject);
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

  void setQuestions(String sub){
    questions.value=quizData[sub]!;
  }

  void findCorrectIndex(){
    for(int i=0;i<questions[questionIndex.value]['options'].length;i++){
      if(questions[questionIndex.value]['correctAnswer']==questions[questionIndex.value]['options'][i]){
        correctIndex.value=i;
      }
    }
  }

  bool isAnswerCorrect(int index) {
    return questions[questionIndex.value]['correctAnswer'] == questions[questionIndex.value]['options'][index];
  }

  // Check if the option is the correct answer
  bool isCorrectAnswer(int index) {
    return questions[questionIndex.value]['correctAnswer'] == questions[questionIndex.value]['options'][index];
  }

  void nextQuestion() {
    if(questionIndex.value>1){
      Get.defaultDialog(
        contentPadding: EdgeInsets.all(5),
        titlePadding: EdgeInsets.only(top: 30),

        backgroundColor: ColorRes.bgColor,
        confirm: Padding(
          padding: const EdgeInsets.only(left: 2.0,bottom: 30,top: 5),
          child: GestureDetector(
            onTap: (){
              Get.back();
              Get.offAllNamed(Routes.DASHBOARD,arguments: name);
            },
            child: Expanded(
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                    color: ColorRes.primary,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Dashboard",style: textMedium(color: ColorRes.bgColor),)),
              ),
            ),
          ),
        ),
        cancel: Padding(
          padding: const EdgeInsets.only(right: 2.0,bottom: 30,top: 5),
          child: Expanded(
            child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                    color: ColorRes.bgColor,
                    border: Border.all(color: ColorRes.primary!),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Cancel",style: textMedium(color: ColorRes.primary),),),
              ),
            ),
          ),
        ),
        titleStyle: textSemiBold(size: 20),
        middleTextStyle: textRegular(size: 12,color: ColorRes.secondary),
        title: "Quiz Over",
        middleText: "You have scored $score.",
        textConfirm: "Confirm",
        textCancel: "Cancel",
        onConfirm: () {
          Get.back(); // Close the dialog on confirm
          print("Confirmed");
        },
        onCancel: () {
          Get.back();
          print("Canceled");
        },
      );

    }
    else{
      borderColor.value=ColorRes.secondary;
      questionAnswered.value = false;
      correctIndex.value =-1;
      questionIndex.value+=1;
    }
  }

  var borderColor=ColorRes.secondary.obs;
  RxString clickValue =''.obs;
  void selectOption(int index) {
    selectedOption.value = index;
    findCorrectIndex();
    if(correctIndex.value==selectedOption.value){
      score+=1;
    }
    questionAnswered.value=true;
    clickValue.value = questions[questionIndex.value]['correctAnswer'];
    if (selectedOption.value == index) {
      if (isAnswerCorrect(index)) {
        borderColor.value = Colors.green;
        update();
      } else {
        borderColor.value = Colors.red;
        update();// Incorrect answer
      }
    } else if (isCorrectAnswer(index) && questionAnswered.value) {
      borderColor.value = Colors.green;
      update();
      // Show correct answer in green
    } else {
      borderColor.value = ColorRes.secondary;
      update();// Default color
    }

  }

  void increment() => count.value++;
}
