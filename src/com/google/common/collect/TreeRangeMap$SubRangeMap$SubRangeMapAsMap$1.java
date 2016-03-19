package com.google.common.collect;

import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Map;
import javax.annotation.Nullable;

class TreeRangeMap$SubRangeMap$SubRangeMapAsMap$1
  extends Maps.KeySet<Range<K>, V>
{
  TreeRangeMap$SubRangeMap$SubRangeMapAsMap$1(TreeRangeMap.SubRangeMap.SubRangeMapAsMap paramSubRangeMapAsMap, Map paramMap)
  {
    super(paramMap);
  }
  
  public boolean remove(@Nullable Object paramObject)
  {
    return this$2.remove(paramObject) != null;
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return TreeRangeMap.SubRangeMap.SubRangeMapAsMap.access$400(this$2, Predicates.compose(Predicates.not(Predicates.in(paramCollection)), Maps.keyFunction()));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeMap.SubRangeMap.SubRangeMapAsMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */