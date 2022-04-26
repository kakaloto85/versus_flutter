import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:versus_flutter/signUp/photo.dart';

void main() {
  runApp(KakaoLoginButton());
}

class KakaoLoginButton extends StatefulWidget {
  @override
  _KakaoLoginButtonState createState() => _KakaoLoginButtonState();
}

class _KakaoLoginButtonState extends State<KakaoLoginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        Icons.home,
        color: Colors.green,
        size: 30.0,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow, // background
        onPrimary: Colors.black, // foreground
      ),
      onPressed: () async {
        // 카카오 로그인 구현 예제
// 카카오톡 설치 여부 확인
// 카카오톡이 설치되어 있으면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
        if (await isKakaoTalkInstalled()) {
          print(1);
          try {
            await UserApi.instance.loginWithKakaoTalk();
            print('카카오톡으로 로그인 성공');
          } catch (error) {
            print('카카오톡으로 로그인 실패 $error');

            // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
            // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
            if (error is PlatformException && error.code == 'CANCELED') {
              return;
            }
            // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
            try {
              await UserApi.instance.loginWithKakaoAccount();
              print('카카오계정으로 로그인 성공');
            } catch (error) {
              print('카카오계정으로 로그인 실패 $error');
            }
          }
        } else {
          print(2);
          try {
            var token = await UserApi.instance.loginWithKakaoAccount();
            print(token);
            print('카카오계정으로 로그인 성공');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPhoto()));
          } catch (error) {
            print('카카오계정으로 로그인 실패 $error');
          }
        }
      },
      label: Text('카카오로 로그인하기'),
    );
  }
}
