package com.google.common.escape;

final class Escapers$2
  extends UnicodeEscaper
{
  Escapers$2(CharEscaper paramCharEscaper) {}
  
  protected char[] escape(int paramInt)
  {
    if (paramInt < 65536)
    {
      localObject = val$escaper.escape((char)paramInt);
      return (char[])localObject;
    }
    Object localObject = new char[2];
    Character.toChars(paramInt, (char[])localObject, 0);
    char[] arrayOfChar3 = val$escaper.escape(localObject[0]);
    char[] arrayOfChar2 = val$escaper.escape(localObject[1]);
    if ((arrayOfChar3 == null) && (arrayOfChar2 == null)) {
      return null;
    }
    if (arrayOfChar3 != null)
    {
      paramInt = arrayOfChar3.length;
      if (arrayOfChar2 == null) {
        break label124;
      }
    }
    char[] arrayOfChar1;
    label124:
    for (int i = arrayOfChar2.length;; i = 1)
    {
      arrayOfChar1 = new char[paramInt + i];
      if (arrayOfChar3 == null) {
        break label129;
      }
      i = 0;
      while (i < arrayOfChar3.length)
      {
        arrayOfChar1[i] = arrayOfChar3[i];
        i += 1;
      }
      paramInt = 1;
      break;
    }
    label129:
    arrayOfChar1[0] = localObject[0];
    if (arrayOfChar2 != null)
    {
      i = 0;
      for (;;)
      {
        localObject = arrayOfChar1;
        if (i >= arrayOfChar2.length) {
          break;
        }
        arrayOfChar1[(paramInt + i)] = arrayOfChar2[i];
        i += 1;
      }
    }
    arrayOfChar1[paramInt] = localObject[1];
    return arrayOfChar1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.escape.Escapers.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */