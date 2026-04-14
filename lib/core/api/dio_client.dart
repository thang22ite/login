import 'package:dio/dio.dart';

class DioClient {
  late Dio dio;
  DioClient(){
    dio = Dio(
      BaseOptions(
       baseUrl: 'https://ylsyixzzorgikoefisec.supabase.co',
        headers: {
          'apikey': 'sb_publishable_p5dFUE4K0bGoVTXEdrMV6Q_nZfCmAGx',
          'Authorization': 'Bearer sb_publishable_p5dFUE4K0bGoVTXEdrMV6Q_nZfCmAGx',
          'Content-Type': 'application/json',
        },
      )
    );
  }
}