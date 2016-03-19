package com.google.common.hash;

import java.io.Serializable;
import java.nio.charset.Charset;

class Funnels$StringCharsetFunnel$SerializedForm
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final String charsetCanonicalName;
  
  Funnels$StringCharsetFunnel$SerializedForm(Charset paramCharset)
  {
    charsetCanonicalName = paramCharset.name();
  }
  
  private Object readResolve()
  {
    return Funnels.stringFunnel(Charset.forName(charsetCanonicalName));
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Funnels.StringCharsetFunnel.SerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */