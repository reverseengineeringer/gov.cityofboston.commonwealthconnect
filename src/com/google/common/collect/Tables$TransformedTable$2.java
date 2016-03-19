package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Map;

class Tables$TransformedTable$2
  implements Function<Map<C, V1>, Map<C, V2>>
{
  Tables$TransformedTable$2(Tables.TransformedTable paramTransformedTable) {}
  
  public Map<C, V2> apply(Map<C, V1> paramMap)
  {
    return Maps.transformValues(paramMap, this$0.function);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.TransformedTable.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */