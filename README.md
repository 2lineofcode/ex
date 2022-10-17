# Ex
Just Start with Type : Ex...

not-yet ready for production. (est. 2023 early)

## DEMO (WEB)
https://abehbatre.github.io/ex-preview.github.io/#/

---


## Some Example
### ImagePreview (overlay, pinch, zoom, interactive) like IG
<img width="90" alt="Screenshot 2022-10-13 at 15 01 34" src="https://user-images.githubusercontent.com/36602270/195540844-44b05fec-89b7-4e99-a268-2541c4afe261.png">

```
ExImagePreview.show(
  'https://imageurl.com',
),
```

### ExAlert:
```
tipe     : success, error, confirm
example  : https://github.com/abehbatre/ex/blob/master/example/lib/helper_gallery/alert_page.dart
```

### ExBottomSheet:
```
tipe     : bottomSheetContentDialog, bottomSheetCustomDialog, bottomSheetListWithSelectedDialog
example  : https://github.com/abehbatre/ex/blob/master/example/lib/helper_gallery/bottomsheet_page.dart
```
### ExDialog
```
tipe     : singleInput, custom
example  : https://github.com/abehbatre/ex/blob/master/example/lib/helper_gallery/input_dialog_page.dart
```

### ExSnackbar
```
tipe     : neutral, info, warning, success, error, action || top/bottom
example  : https://github.com/abehbatre/ex/blob/master/example/lib/helper_gallery/input_dialog_page.dart
```

### ExLog
```
logD('message');
logE('message');
logW('message');
logI('message');

# output
[ExLog] 👻 | message
[ExLog] 🔴 | message
[ExLog] 🟠 | message
[ExLog] ℹ️ | message
```


### ExHttp

**simple example** | lets explore more params/option: https://github.com/abehbatre/ex/blob/master/lib/src/core/ex_http.dart

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


## Screenshoot
<img width="90" alt="Screenshot 2022-10-13 at 15 04 05" src="https://user-images.githubusercontent.com/36602270/195540776-9d7a1a06-2824-48d0-ac55-ff4f40b2a63f.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 03 55" src="https://user-images.githubusercontent.com/36602270/195540779-6e56c041-f06e-4963-83c5-a9a79841599c.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 03 47" src="https://user-images.githubusercontent.com/36602270/195540781-92e837b0-7b5b-4664-9e06-81a0fe8de78b.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 03 42" src="https://user-images.githubusercontent.com/36602270/195540785-13c23dfa-3102-43e9-a27c-f570eaf120f9.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 03 26" src="https://user-images.githubusercontent.com/36602270/195540794-ed16ad16-2fcf-4b17-baf7-2a2aa22364b3.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 03 18" src="https://user-images.githubusercontent.com/36602270/195540797-98ac763c-40c1-40cf-90ba-9dac7a58cbc0.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 03 05" src="https://user-images.githubusercontent.com/36602270/195540800-5fd4e2c5-5331-4f24-98aa-023cf3e50c76.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 02 48" src="https://user-images.githubusercontent.com/36602270/195540804-9104956b-4a69-40bd-ae3e-6eb40150f32e.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 02 40" src="https://user-images.githubusercontent.com/36602270/195540818-6a2d7f98-7ac4-46c8-a93e-307039e2d544.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 02 33" src="https://user-images.githubusercontent.com/36602270/195540820-d3ebcd55-c86c-437d-9c7a-646ec674a1da.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 02 15" src="https://user-images.githubusercontent.com/36602270/195540822-bb2d1ea8-f498-46aa-8656-058b7f9c97aa.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 02 05" src="https://user-images.githubusercontent.com/36602270/195540826-e2643074-6583-4fc0-ab22-0df485ba685f.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 58" src="https://user-images.githubusercontent.com/36602270/195540830-c808a6d1-a41f-4e36-ad7f-7d3319274e65.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 50" src="https://user-images.githubusercontent.com/36602270/195540833-058d3940-c01c-4071-bb8e-c6c454173e45.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 47" src="https://user-images.githubusercontent.com/36602270/195540834-c4e2c294-c409-4240-b2b1-83af9a3d9cad.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 41" src="https://user-images.githubusercontent.com/36602270/195540835-3c363bd5-c2bb-40ca-be26-57dcf10d2702.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 37" src="https://user-images.githubusercontent.com/36602270/195540841-291d75de-25e0-4b17-9def-78796f3a55de.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 34" src="https://user-images.githubusercontent.com/36602270/195540844-44b05fec-89b7-4e99-a268-2541c4afe261.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 30" src="https://user-images.githubusercontent.com/36602270/195540848-0319340d-7b73-477a-8bcc-fa8ec286a720.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 25" src="https://user-images.githubusercontent.com/36602270/195540852-d43d5151-91c7-465e-9dd8-6a59eba8ad80.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 21" src="https://user-images.githubusercontent.com/36602270/195540855-c055d7cc-9068-424c-b0cd-97ef0fb24afe.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 01 17" src="https://user-images.githubusercontent.com/36602270/195540858-6b06c057-5b96-4a86-841e-8ce4d0d9f199.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 00 48" src="https://user-images.githubusercontent.com/36602270/195540861-82759d7f-33d9-4318-bc5c-1772739a1777.png">
<img width="90" alt="Screenshot 2022-10-13 at 15 00 30" src="https://user-images.githubusercontent.com/36602270/195540865-9143850b-5e89-4051-af59-697b833f8e55.png">