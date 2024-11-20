Future<void> main() async {
  print('start');

  await task();
  // Future.delayed(const Duration(seconds: 3)).then((value) {
  //   print('end');
  // }).catchError((error) {
  //   print(error);
  // });

  // Future delay = Future.delayed(const Duration(seconds: 3), (){
  //   print('end');
  // });

  print('holding');
}

Future<void> task() async {
  await Future.delayed(const Duration(seconds: 3));
  print('task');
}