import 'package:flutter_test/flutter_test.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/helpers/page_routing/application.dart';
import 'package:dashboard/helpers/page_routing/routes.dart';
import 'package:mockito/mockito.dart';
import 'api_helper_test.mocks.dart'; // Import generated mocks
import 'package:fluro/fluro.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // Initialize the router before tests
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  });

  testWidgets('Profile fetch test', (WidgetTester tester) async {
    final mockApiHelper = MockApiHelper();

    // Stubbing the methods of mockApiHelper
    when(mockApiHelper.get(url: anyNamed('url'))).thenAnswer((_) async {
      return [
        {'name': 'John Doe', 'email': 'john.doe@example.com', 'permissions': ['dashboard']}
      ];
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(apiHelper: mockApiHelper));

    // Verify that profile data is fetched and displayed correctly
    await tester.pumpAndSettle(); // Wait for all frames to complete

    // Verify fetched user name is displayed
    expect(find.text('John Doe'), findsOneWidget);
  });
}
