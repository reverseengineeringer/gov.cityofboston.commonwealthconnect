package com.google.common.base;

 enum CaseFormat$1
{
  CaseFormat$1(CharMatcher paramCharMatcher, String paramString1)
  {
    super(paramString, paramInt, paramCharMatcher, paramString1, null);
  }
  
  String convert(CaseFormat paramCaseFormat, String paramString)
  {
    if (paramCaseFormat == LOWER_UNDERSCORE) {
      return paramString.replace('-', '_');
    }
    if (paramCaseFormat == UPPER_UNDERSCORE) {
      return Ascii.toUpperCase(paramString.replace('-', '_'));
    }
    return super.convert(paramCaseFormat, paramString);
  }
  
  String normalizeWord(String paramString)
  {
    return Ascii.toLowerCase(paramString);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CaseFormat.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */