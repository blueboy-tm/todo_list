
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

String jalaliNow(){
  var date = Jalali.now();
  return '${date.year}/${date.month}/${date.day}';
}