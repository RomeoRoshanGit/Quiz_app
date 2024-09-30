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
  String admno='';
  RxList questions=[].obs;
  RxInt questionIndex=0.obs;
  var selectedOption = (-1).obs;
  RxBool questionAnswered=false.obs;
  RxInt correctIndex=(-1).obs;
  int score=0;

  Map<String, List<Map<String, dynamic>>> quizData = {
    'Networks': [
      {
        'question': 'What is the primary protocol used for internet communication?',
        'options': ['HTTP', 'FTP', 'TCP/IP', 'SMTP'],
        'correctAnswer': 'TCP/IP',
      },
      {
        'question': 'What does DNS stand for?',
        'options': ['Domain Name Service', 'Dynamic Network System', 'Domain Name System', 'Data Name Server'],
        'correctAnswer': 'Domain Name System',
      },
      {
        'question': 'Which layer of the OSI model does routing occur?',
        'options': ['Physical', 'Data Link', 'Network', 'Transport'],
        'correctAnswer': 'Network',
      },
    ],
    'Data Structures': [
      {
        'question': 'What data structure uses the First In First Out (FIFO) principle?',
        'options': ['Stack', 'Queue', 'Tree', 'Graph'],
        'correctAnswer': 'Queue',
      },
      {
        'question': 'What is a binary search tree?',
        'options': [
          'A tree where each node has two children',
          'A tree where each node has at most two children',
          'A tree where left child is smaller and right child is larger',
          'A balanced tree with equal height subtrees'
        ],
        'correctAnswer': 'A tree where left child is smaller and right child is larger',
      },
      {
        'question': 'Which of these is a linear data structure?',
        'options': ['Tree', 'Graph', 'Queue', 'Heap'],
        'correctAnswer': 'Queue',
      },
    ],
    'DBMS': [
      {
        'question': 'What is the primary key?',
        'options': ['A unique identifier for a record', 'A foreign key', 'An encrypted key', 'A primary value'],
        'correctAnswer': 'A unique identifier for a record',
      },
      {
        'question': 'What does SQL stand for?',
        'options': ['Structured Query Language', 'Simple Query Language', 'System Query Language', 'Syntax Query Language'],
        'correctAnswer': 'Structured Query Language',
      },
      {
        'question': 'Which type of join returns all records when there is a match in either table?',
        'options': ['INNER JOIN', 'LEFT JOIN', 'RIGHT JOIN', 'FULL JOIN'],
        'correctAnswer': 'FULL JOIN',
      },
    ],
    'Quantum': [
      {
        'question': 'What is the principle of quantum superposition?',
        'options': [
          'Particles exist in one state at a time',
          'Particles exist in all possible states simultaneously',
          'Energy cannot be created or destroyed',
          'Wave and particle duality'
        ],
        'correctAnswer': 'Particles exist in all possible states simultaneously',
      },
      {
        'question': 'Who is known as the father of quantum mechanics?',
        'options': ['Albert Einstein', 'Niels Bohr', 'Max Planck', 'Isaac Newton'],
        'correctAnswer': 'Max Planck',
      },
      {
        'question': 'What is Heisenberg’s Uncertainty Principle?',
        'options': ['Position and momentum cannot be precisely measured simultaneously',
          'Energy and time cannot be precisely measured simultaneously',
          'Mass and energy are equivalent',
          'Electrons revolve in fixed orbits'],
        'correctAnswer': 'Position and momentum cannot be precisely measured simultaneously',
      },
    ],
    'Electromagnetism': [
      {
        'question': 'What is the unit of electric current?',
        'options': ['Volt', 'Coulomb', 'Ampere', 'Ohm'],
        'correctAnswer': 'Ampere',
      },
      {
        'question': 'What law describes the force between two electric charges?',
        'options': ["Coulomb's Law", "Faraday's Law", "Gauss's Law", "Ohm's Law"],
        'correctAnswer': "Coulomb's Law",
      },
      {
        'question': 'What creates a magnetic field?',
        'options': ['Stationary charges', 'Moving charges', 'Massive objects', 'Thermal energy'],
        'correctAnswer': 'Moving charges',
      },
    ],
    'Mechanics': [
      {
        'question': 'What is Newton’s Second Law of Motion?',
        'options': [
          'For every action, there is an equal and opposite reaction',
          'Force equals mass times acceleration',
          'An object at rest stays at rest',
          'Energy cannot be created or destroyed'
        ],
        'correctAnswer': 'Force equals mass times acceleration',
      },
      {
        'question': 'What is the unit of energy?',
        'options': ['Newton', 'Joule', 'Pascal', 'Watt'],
        'correctAnswer': 'Joule',
      },
      {
        'question': 'What is kinetic energy?',
        'options': [
          'Energy stored in an object',
          'Energy an object has due to motion',
          'Energy due to an object’s position',
          'Energy due to heat'
        ],
        'correctAnswer': 'Energy an object has due to motion',
      },
    ],
    'Algebra': [
      {
        'question': 'What is the solution to the equation 2x + 3 = 7?',
        'options': ['x = 2', 'x = 3', 'x = 1', 'x = 0'],
        'correctAnswer': 'x = 2',
      },
      {
        'question': 'What does the term “matrix” refer to in linear algebra?',
        'options': ['A set of vectors', 'A rectangular array of numbers', 'A single variable equation', 'A function'],
        'correctAnswer': 'A rectangular array of numbers',
      },
      {
        'question': 'What is the determinant of a matrix?',
        'options': ['A number that describes the matrix', 'A type of vector', 'The inverse of the matrix', 'The rank of the matrix'],
        'correctAnswer': 'A number that describes the matrix',
      },
    ],
    'Calculus': [
      {
        'question': 'What is the derivative of x^2?',
        'options': ['2x', 'x', 'x^3', '1'],
        'correctAnswer': '2x',
      },
      {
        'question': 'What is the integral of 1/x?',
        'options': ['ln(x)', 'x^2', '1/x', 'x'],
        'correctAnswer': 'ln(x)',
      },
      {
        'question': 'What is the concept of a limit?',
        'options': [
          'The value a function approaches as the input approaches a certain point',
          'The highest value of a function',
          'The smallest value of a function',
          'The area under a curve'
        ],
        'correctAnswer': 'The value a function approaches as the input approaches a certain point',
      },
    ],
    'Probability': [
      {
        'question': 'What is the probability of getting heads in a fair coin toss?',
        'options': ['1/2', '1/3', '1/4', '1/6'],
        'correctAnswer': '1/2',
      },
      {
        'question': 'What is the expected value in probability?',
        'options': [
          'The average outcome over many trials',
          'The highest possible outcome',
          'The most frequent outcome',
          'The median value of the outcomes'
        ],
        'correctAnswer': 'The average outcome over many trials',
      },
      {
        'question': 'What is a random variable?',
        'options': ['A variable that can take any value',
          'A variable that depends on random outcomes',
          'A constant value',
          'A deterministic value'],
        'correctAnswer': 'A variable that depends on random outcomes',
      },
    ]
  };




  final count = 0.obs;
  @override
  void onInit() {
    List data=Get.arguments as List;
    subject=data[0];
    admno=data[1];
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

  nextQuestion() {
    if(questionIndex.value>1){
      return Get.dialog(
        barrierDismissible: false,
          Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quiz Completed",
                      style: textSemiBold(size: 16, color: ColorRes.textColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "You have scored $score",
                      style: textRegular(size: 14, color: ColorRes.secondary),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Get.offAllNamed(Routes.DASHBOARD,arguments: admno);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorRes.primary),
                              child: Center(
                                child: Text(
                                  "Dashboard",
                                  style: textMedium(size: 16, color: ColorRes.bgColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
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
        update();
      }
    } else if (isCorrectAnswer(index) && questionAnswered.value) {
      borderColor.value = Colors.green;
      update();
    } else {
      borderColor.value = ColorRes.secondary;
      update();
    }

  }

  void increment() => count.value++;
}
