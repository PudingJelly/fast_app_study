import 'dart:core';
import 'package:fast_app_base/common/common.dart';

void main() {
  /// Stream 기본 개념
  /// Future - 1번의 데이터를 가져옴
  /// Stream - 여러번의 데이터를 받을 수 있음

  /// Stream 생성과 수행
  /// 1. async*
  /// 2. streamController

  // countStream(4).listen((event) {
  //   print(event);
  // });
  final controller = StreamController<int>();
  final stream = controller.stream;
  stream.listen((event) {
    print(event);
  });

  addDataTotheSink(controller);
  /// Stream 데이터 관찰

  /// 위젯에서 Stream Data 표현하기

  /// Stream 데이터 관찰2 - BroadcastStream

  /// 2개의 위젯에서 하나의 BroadcastStream Data 표현하기

  /// Stream Error Handling
}

void addDataTotheSink(StreamController<int> controller) async{
  for(int i = 1; i <= 4; i++) {
    print('이전 싱크');
    controller.sink.add(i);
    print('이후 싱크');
    await sleepAsync(1.seconds);
  }
}

Stream<int> countStream(int max) async* {
  for(int i = 1; i<=max; i++) {
    await sleepAsync(1.seconds);
    yield i;
  }
}