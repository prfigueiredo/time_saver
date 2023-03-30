import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing time saver calculator', () {
    test('positive values input', () {
    //setup
    double? go = 60;
    double? back = 60;
    double? elevator = 12;
    //do
     double? tempo = ((go + back + elevator) * 22/60*12)/24;
    //test
    expect(tempo, closeTo(24.20, 0.01));
  });
  test('negative values input', () {
    //setup
    double? go = -60;
    double? back = -60;
    double? elevator = -12;
    //do
     double? tempo = ((go + back + elevator) * 22/60*12)/24;
    //test
    expect(tempo, closeTo(-24.20, 0.01));
  });
   });
}