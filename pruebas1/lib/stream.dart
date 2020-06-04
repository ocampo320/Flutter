Stream<int> getNumber() async* {
  for (int i = 1; i <= 10; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
  void main() {
    getNumber().listen((event) {
      print(event);
    });
  }
}
