import 'package:rxdart/rxdart.dart';

class AppbarChoiceTab {
  AppbarChoiceTab._singleton();
  static final AppbarChoiceTab _instance = AppbarChoiceTab._singleton();
  static AppbarChoiceTab get instance => _instance;

  final BehaviorSubject<int> _subject = BehaviorSubject<int>.seeded(0);
  Stream<int> get stream => _subject.stream;
  int get current => _subject.value;

  void update(int upd) {
    _subject.add(upd);
  }

  void dispose() {
    _subject.close();
  }
}
