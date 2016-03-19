package com.google.common.base;

import javax.annotation.Nullable;

class Joiner$1
  extends Joiner
{
  Joiner$1(Joiner paramJoiner1, Joiner paramJoiner2, String paramString)
  {
    super(paramJoiner2, null);
  }
  
  public Joiner skipNulls()
  {
    throw new UnsupportedOperationException("already specified useForNull");
  }
  
  CharSequence toString(@Nullable Object paramObject)
  {
    if (paramObject == null) {
      return val$nullText;
    }
    return this$0.toString(paramObject);
  }
  
  public Joiner useForNull(String paramString)
  {
    throw new UnsupportedOperationException("already specified useForNull");
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Joiner.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */