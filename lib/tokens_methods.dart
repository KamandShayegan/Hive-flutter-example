import 'package:flutter_app/Boxes.dart';
import 'package:flutter_app/tokens.dart';

void addTokens(String acToken, String agToken) {
  final tokens = Tokens()
    ..firstToken = acToken
    ..secondToken = agToken;

  final box = Boxes.getTokens();
  box.put('tokens', tokens);
  tokens.save();
}

String getFirstToken() {
  final box = Boxes.getTokens();
  return box.get('tokens').firstToken;
}

String getSecondToken() {
  final box = Boxes.getTokens();
  return box.get('tokens').secondToken;
}

void deleteTokens() async {
  // Tokens tokens;
  final box = Boxes.getTokens();
  box.delete('tokens');
}
