package com.google.common.net;

import com.google.common.base.CharMatcher;
import com.google.common.base.Preconditions;

final class MediaType$Tokenizer
{
  final String input;
  int position = 0;
  
  MediaType$Tokenizer(String paramString)
  {
    input = paramString;
  }
  
  char consumeCharacter(char paramChar)
  {
    Preconditions.checkState(hasMore());
    if (previewChar() == paramChar) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool);
      position += 1;
      return paramChar;
    }
  }
  
  char consumeCharacter(CharMatcher paramCharMatcher)
  {
    Preconditions.checkState(hasMore());
    char c = previewChar();
    Preconditions.checkState(paramCharMatcher.matches(c));
    position += 1;
    return c;
  }
  
  String consumeToken(CharMatcher paramCharMatcher)
  {
    int i = position;
    paramCharMatcher = consumeTokenIfPresent(paramCharMatcher);
    if (position != i) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool);
      return paramCharMatcher;
    }
  }
  
  String consumeTokenIfPresent(CharMatcher paramCharMatcher)
  {
    Preconditions.checkState(hasMore());
    int i = position;
    position = paramCharMatcher.negate().indexIn(input, i);
    if (hasMore()) {
      return input.substring(i, position);
    }
    return input.substring(i);
  }
  
  boolean hasMore()
  {
    return (position >= 0) && (position < input.length());
  }
  
  char previewChar()
  {
    Preconditions.checkState(hasMore());
    return input.charAt(position);
  }
}

/* Location:
 * Qualified Name:     com.google.common.net.MediaType.Tokenizer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */