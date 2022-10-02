import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2_result = await task2();
  task3(task2_result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete.');
}

Future task2() async {
  Duration time = Duration(seconds: 3);
  String result = 'null';
  await Future.delayed(
    time,
    () {
      result = 'task 2 data';
      print('Task 2 complete');
    },
  );
  return result;
}

void task3(String task2_data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2_data');
}
