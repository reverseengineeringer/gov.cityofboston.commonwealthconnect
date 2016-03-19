package com.google.common.base;

import com.google.common.annotations.Beta;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

@Beta
public final class Splitter$MapSplitter
{
  private static final String INVALID_ENTRY_MESSAGE = "Chunk [%s] is not a valid entry";
  private final Splitter entrySplitter;
  private final Splitter outerSplitter;
  
  private Splitter$MapSplitter(Splitter paramSplitter1, Splitter paramSplitter2)
  {
    outerSplitter = paramSplitter1;
    entrySplitter = ((Splitter)Preconditions.checkNotNull(paramSplitter2));
  }
  
  public Map<String, String> split(CharSequence paramCharSequence)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    paramCharSequence = outerSplitter.split(paramCharSequence).iterator();
    if (paramCharSequence.hasNext())
    {
      String str1 = (String)paramCharSequence.next();
      Iterator localIterator = Splitter.access$000(entrySplitter, str1);
      Preconditions.checkArgument(localIterator.hasNext(), "Chunk [%s] is not a valid entry", new Object[] { str1 });
      String str2 = (String)localIterator.next();
      if (!localLinkedHashMap.containsKey(str2))
      {
        bool = true;
        label99:
        Preconditions.checkArgument(bool, "Duplicate key [%s] found.", new Object[] { str2 });
        Preconditions.checkArgument(localIterator.hasNext(), "Chunk [%s] is not a valid entry", new Object[] { str1 });
        localLinkedHashMap.put(str2, (String)localIterator.next());
        if (localIterator.hasNext()) {
          break label189;
        }
      }
      label189:
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "Chunk [%s] is not a valid entry", new Object[] { str1 });
        break;
        bool = false;
        break label99;
      }
    }
    return Collections.unmodifiableMap(localLinkedHashMap);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.MapSplitter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */