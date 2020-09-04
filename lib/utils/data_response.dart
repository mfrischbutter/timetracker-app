import 'package:timetracker_app/models/data.dart';

class DataResponse {
  final  List<Data> data;
  final String apiMore;
  DataResponse(this.data, this.apiMore);
}