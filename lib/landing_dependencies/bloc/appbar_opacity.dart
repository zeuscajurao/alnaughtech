import 'package:rxdart/subjects.dart';

class AppBarOpacity {
  AppBarOpacity._singleton();
  static final AppBarOpacity __ = AppBarOpacity._singleton();
  static AppBarOpacity get instance => __;
  BehaviorSubject<double> _subject = BehaviorSubject<double>.seeded(0.0);
  Stream<double> get stream => _subject.stream;
  double get current => _subject.value;

  void update(double upd) {
    _subject.add(upd);
  }

  void dispose() {
    _subject.close();
  }
}
