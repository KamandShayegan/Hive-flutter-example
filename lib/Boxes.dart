import 'package:flutter_app/tokens.dart';
import 'package:hive/hive.dart';

class Boxes{
  static Box<Tokens> getTokens()=> Hive.box<Tokens>('tokens');

}