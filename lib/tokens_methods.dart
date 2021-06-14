import 'package:flutter_app/Boxes.dart';
import 'package:flutter_app/tokens.dart';

void setTokens(String fstToken, String sndToken) {
  final tokens = Tokens()
    ..firstToken = fstToken
    ..secondToken = sndToken;

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
