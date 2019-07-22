@TestOn('browser')
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:project_bunny/entry.dart';
import 'package:project_bunny/entry.template.dart' as ng;

void main() {
  final testBed =
      NgTestBed.forComponent<AppEntry>(ng.AppEntryNgFactory);
  NgTestFixture<AppEntry> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  test('heading', () {
    expect(fixture.text, contains('My First AngularDart App'));
  });

  // Testing info: https://webdev.dartlang.org/angular/guide/testing
}
