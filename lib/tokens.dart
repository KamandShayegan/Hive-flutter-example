import 'package:hive/hive.dart';

part 'tokens.g.dart';

@HiveType(typeId: 0)
class Tokens extends HiveObject{
  @HiveField(0)
   String firstToken;
  @HiveField(1)
   String secondToken;

}
