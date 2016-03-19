package com.google.common.io;

import com.google.common.collect.Lists;
import java.util.List;

final class Resources$1
  implements LineProcessor<List<String>>
{
  final List<String> result = Lists.newArrayList();
  
  public List<String> getResult()
  {
    return result;
  }
  
  public boolean processLine(String paramString)
  {
    result.add(paramString);
    return true;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.Resources.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */