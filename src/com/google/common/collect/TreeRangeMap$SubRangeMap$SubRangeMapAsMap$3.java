package com.google.common.collect;

import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Map;

class TreeRangeMap$SubRangeMap$SubRangeMapAsMap$3
  extends Maps.Values<Range<K>, V>
{
  TreeRangeMap$SubRangeMap$SubRangeMapAsMap$3(TreeRangeMap.SubRangeMap.SubRangeMapAsMap paramSubRangeMapAsMap, Map paramMap)
  {
    super(paramMap);
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.access$400(this$2, Predicates.compose(Predicates.in(paramCollection), Maps.valueFunction()));
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.access$400(this$2, Predicates.compose(Predicates.not(Predicates.in(paramCollection)), Maps.valueFunction()));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeMap.SubRangeMap.SubRangeMapAsMap.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */