import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'login/kakaoLoginButton.dart';

void main() {
  KakaoSdk.init(nativeAppKey: "2154b2c766bd07e284207be7dd19c8ff");
  runApp(AppMain());
}

///앱 메인 페이지
class AppMain extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<AppMain> {
  // const _HomeState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /** Widget
     * 1. MaterialApp : google style, custom 가능
     */
    /**
     * Scaffold : 앱을 상중하로 나눠줌
     */
    /**
     * Row : 가로로 배열
     */
    // return MaterialApp(
    //     home: Center(
    //         child: Container(
    //   width: 50,
    //   height: 100,
    //   color: Colors.blue,
    // )));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title:
                  const Text('versus', style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Align(
              alignment: Alignment.center,
              child: Container(
                  child: Column(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  KakaoLoginButton(),
                ],
              )),
            ),
            bottomNavigationBar: BottomAppBar()));
  }
}
