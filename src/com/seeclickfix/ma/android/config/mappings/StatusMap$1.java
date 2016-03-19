package com.seeclickfix.ma.android.config.mappings;

import com.google.common.base.Function;

final class StatusMap$1
  implements Function<String, String>
{
  public String apply(String paramString)
  {
    return StatusMap.getStateDisplayString(paramString);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.config.mappings.StatusMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */