import 'package:flutter_course/reverse_string_app/reverse_string_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('String should be reversed', () {
    String initialWord = "Hello";
    String reversedWord= reverseString(initialWord);
    expect(reversedWord, 'olleH');
  });
}