package com.google.common.net;

import com.google.common.base.CharMatcher;
import com.google.common.base.Function;

class MediaType$2
  implements Function<String, String>
{
  MediaType$2(MediaType paramMediaType) {}
  
  public String apply(String paramString)
  {
    if (MediaType.access$000().matchesAllOf(paramString)) {
      return paramString;
    }
    return MediaType.access$100(paramString);
  }
}

/* Location:
 * Qualified Name:     com.google.common.net.MediaType.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */