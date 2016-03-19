package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Collections;
import java.util.Map;

final class Tables$1
  implements Function<Map<Object, Object>, Map<Object, Object>>
{
  public Map<Object, Object> apply(Map<Object, Object> paramMap)
  {
    return Collections.unmodifiableMap(paramMap);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */