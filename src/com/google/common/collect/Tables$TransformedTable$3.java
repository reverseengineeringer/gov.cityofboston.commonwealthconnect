package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Map;

class Tables$TransformedTable$3
  implements Function<Map<R, V1>, Map<R, V2>>
{
  Tables$TransformedTable$3(Tables.TransformedTable paramTransformedTable) {}
  
  public Map<R, V2> apply(Map<R, V1> paramMap)
  {
    return Maps.transformValues(paramMap, this$0.function);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.TransformedTable.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */