# Features
- axios code style    -> [await->then->catchError]
- http                -> get, post, put, delete, upload, download
- http_interceptor    -> ability modify interceptor
- http_modifier       -> ability modify res, req
- refresh_token       -> ability modify auth
- http_log            -> show http log
- outcome             -> google sealed class technique (centralize)
- socket              -> ability to handle websocket
- auto fix http issue on low SDK android
- auto fix certificate issue on android
## Use example:


```dart
/// `main.dart` (inject)
void main() {
  ...
    Get.put(ExHttp(
      baseURL: 'https://your-api.com',
      baseHeader: {
        'App-ID': 'ex_v_1038',
        'Device-ID': await DeviceInfo().uuid(),
        'Device-Type': Platform.operatingSystem,
      },
    ));
  ...
}


/// repo or provider
class ExampleProvider extends BaseProvider {

  // example with baseURL
  getUsers() async {
    return apiService.httpGet(
      endpoint: '/users',
      header: {},
      query: {},
      withToken: true,
    );
  }

  // example without baseURL
  getTodayQoute() async {
    return apiService.http(
      url: 'https://zenquotes.io/api/today',
      method: Method.GET,
    );
  }
}

/// put on controller
class ExampleController extends BaseController<ExampleProvider> {

  loadAPI() async {
    await provider.getUsers().then((response) {
      print(response.body);
    }).catchError((e) {
      print(e);
    });
  }
}
```