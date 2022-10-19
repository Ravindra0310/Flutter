import 'dart:io';

main(List<String> args) async {
  work1();
  String data2 = await work2();
  work3(data2);
}

void work1() {
  print('Work1');
}

Future<String> work2() async {
  Duration duration = Duration(seconds: 3);
  await Future.delayed(duration);
  print('Work2');
  return "work 2 data";
}

void work3(var data) {
  print('Work3= $data');
}
