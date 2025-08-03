import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDisplayApi extends Mock implements DisplayApi {}

void main() {
  late DisplayRepository displayRepository;
  late DisplayApi displayApi;

  setUpAll(() {
    displayApi = MockDisplayApi();
    displayRepository = DisplayRepositoryImpl(displayApi: displayApi);
  });

  test('의존성 주입 및 객체 생성 완료', () {
    expect(displayRepository, isNotNull);
  });

  group('메뉴 리스트 불러오기', () {
    test('api 호출 완료', () async {
      try {
        await displayRepository.getMenus(mallType: MallType.market);
      } catch (_) {}
      verify(() => displayApi.getMenus(any())).called(1);
    });

    test('api 호출 실패', () async {
      final exception = Exception('error');
      when(() => displayApi.getMenus(any())).thenThrow(exception);
      expect(() => displayRepository.getMenus(mallType: MallType.market), throwsA(exception));
    });
  });
}
