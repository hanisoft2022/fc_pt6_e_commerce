import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDisplayDao extends Mock implements DisplayDao {}

// class MockDisplayRepository extends Mock implements DisplayRepository {}

class MockGetMenusUsecase extends Mock implements GetMenusUsecase {}

void main() {
  late DisplayDao displayDao;
  late DisplayRepository displayRepository;
  late DisplayUsecase displayUsecase;

  setUpAll(() {
    displayDao = MockDisplayDao();
    displayRepository = DisplayRepositoryImpl(displayDao: displayDao);
    displayUsecase = DisplayUsecase(displayRepository: displayRepository);
  });

  test('의존성 주입 성공', () => expect(displayUsecase, isNotNull));

  test('메뉴 리스트 불러오기 성공', () async {
    final result = Result<List<MenuEntity>>.success([MenuEntity(tabId: -1, title: '메뉴 테스트')]);
    final usecase = MockGetMenusUsecase();

    when(() => usecase.mallType).thenReturn(MallType.market);
    when(() => usecase(displayRepository)).thenAnswer((_) async => result);

    final actual = await displayUsecase.execute(usecase: usecase);

    expect(actual, result);
  });

  test('메뉴 리스트 불러오기 실패', () async {
    final result = Result<List<MenuEntity>>.failure(ErrorResponse(status: 'error'));
    final usecase = MockGetMenusUsecase();

    when(() => usecase.mallType).thenReturn(MallType.market);
    when(() => usecase(displayRepository)).thenAnswer((_) async => result);

    final actual = await displayUsecase.execute(usecase: usecase);

    expect(actual, result);
  });
}
