package com.google.common.base;

 enum CaseFormat$5
{
  CaseFormat$5(CharMatcher paramCharMatcher, String paramString1)
  {
    super(paramString, paramInt, paramCharMatcher, paramString1, null);
  }
  
  String convert(CaseFormat paramCaseFormat, String paramString)
  {
    if (paramCaseFormat == LOWER_HYPHEN) {
      return Ascii.toLowerCase(paramString.replace('_', '-'));
    }
    if (paramCaseFormat == LOWER_UNDERSCORE) {
      return Ascii.toLowerCase(paramString);
    }
    return super.convert(paramCaseFormat, paramString);
  }
  
  String normalizeWord(String paramString)
  {
    return Ascii.toUpperCase(paramString);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CaseFormat.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */