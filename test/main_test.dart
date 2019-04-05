import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  test('http 통신 테스트', () async {
    var url = 'https://koreanjson.com/posts/1';

    var response = await http.get(url);

    expect(response.statusCode, 200);

    var jsonResponse = convert.jsonDecode(response.body);
    var id = jsonResponse['id'];
    var title = jsonResponse['title'];

    expect(id, 1);
    expect(title,
        '정당의 목적이나 활동이 민주적 기본질서에 위배될 때에는 정부는 헌법재판소에 그 해산을 제소할 수 있고, 정당은 헌법재판소의 심판에 의하여 해산된다.');
  });
}
