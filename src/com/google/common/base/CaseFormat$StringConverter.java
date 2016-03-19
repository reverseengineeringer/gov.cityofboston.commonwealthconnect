package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

final class CaseFormat$StringConverter
  extends Converter<String, String>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final CaseFormat sourceFormat;
  private final CaseFormat targetFormat;
  
  CaseFormat$StringConverter(CaseFormat paramCaseFormat1, CaseFormat paramCaseFormat2)
  {
    sourceFormat = ((CaseFormat)Preconditions.checkNotNull(paramCaseFormat1));
    targetFormat = ((CaseFormat)Preconditions.checkNotNull(paramCaseFormat2));
  }
  
  protected String doBackward(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return targetFormat.to(sourceFormat, paramString);
  }
  
  protected String doForward(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return sourceFormat.to(targetFormat, paramString);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof StringConverter))
    {
      paramObject = (StringConverter)paramObject;
      bool1 = bool2;
      if (sourceFormat.equals(sourceFormat))
      {
        bool1 = bool2;
        if (targetFormat.equals(targetFormat)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return sourceFormat.hashCode() ^ targetFormat.hashCode();
  }
  
  public String toString()
  {
    return sourceFormat + ".converterTo(" + targetFormat + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CaseFormat.StringConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */