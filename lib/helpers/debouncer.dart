import 'dart:async';

class Debouncer<T> {

  /// How to implement
  /// 
  /// `[duration]:` Is a delay time before triggering a value.
  /// 
  /// `[onValue]:` This method is triggered when gets a value.
  Debouncer({ required this.duration, this.onValue });

  final Duration duration;

  void Function(T value)? onValue;

  T? _value;
  Timer? _timer;

  T get value => _value!;

  set value(T val) {
    _value = val;
    _timer?.cancel();
    _timer = Timer(duration, () => onValue!(_value as T));
  }  
}