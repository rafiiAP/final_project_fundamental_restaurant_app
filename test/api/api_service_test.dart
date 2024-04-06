import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:restaurant_app/data/api/api_service.dart';

void main() {
  group('ApiService', () {
    late http.Client httpClient;
    late ApiService apiService;

    setUp(() {
      httpClient = MockClient((request) async {
        if (request.url.path == '/list') {
          const mockResponse = '''
          {
            "error": false,
            "message": "success",
            "count": 20,
            "restaurants": [
              {
                "id": "rqdv5juczeskfw1e867",
                "name": "Melting Pot",
                "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
                "pictureId": "14",
                "city": "Medan",
                "rating": 4.2
              },
              {
                "id": "s1knt6za9kkfw1e867",
                "name": "Kafe Kita",
                "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
                "pictureId": "25",
                "city": "Aceh",
                "rating": 4.5
              }
            ]
          }
          ''';

          return http.Response(mockResponse, 200);
        }
        return http.Response('Not Found', 404);
      });

      apiService = ApiService(httpClient: httpClient);
    });

    test('getListRestaurant - success', () async {
      final response = await apiService.getListRestaurant();

      expect(response.error, false);
      expect(response.message, 'success');
    });

    test('getListRestaurant - Exception', () async {
      httpClient = MockClient((request) async {
        throw Exception('Server Error');
      });

      apiService = ApiService(httpClient: httpClient);

      try {
        await apiService.getListRestaurant();
        fail('Exception expected but not thrown');
      } catch (e) {
        expect(e, isInstanceOf<Exception>());
        expect(e.toString(), 'Exception expected but not thrown');
      }
    });
  });
}
