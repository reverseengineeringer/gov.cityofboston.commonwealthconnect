package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.nio.charset.Charset;
import javax.annotation.Nullable;

class Funnels$StringCharsetFunnel
  implements Funnel<CharSequence>, Serializable
{
  private final Charset charset;
  
  Funnels$StringCharsetFunnel(Charset paramCharset)
  {
    charset = ((Charset)Preconditions.checkNotNull(paramCharset));
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof StringCharsetFunnel))
    {
      paramObject = (StringCharsetFunnel)paramObject;
      return charset.equals(charset);
    }
    return false;
  }
  
  public void funnel(CharSequence paramCharSequence, PrimitiveSink paramPrimitiveSink)
  {
    paramPrimitiveSink.putString(paramCharSequence, charset);
  }
  
  public int hashCode()
  {
    return StringCharsetFunnel.class.hashCode() ^ charset.hashCode();
  }
  
  public String toString()
  {
    return "Funnels.stringFunnel(" + charset.name() + ")";
  }
  
  Object writeReplace()
  {
    return new SerializedForm(charset);
  }
  
  private static class SerializedForm
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    private final String charsetCanonicalName;
    
    SerializedForm(Charset paramCharset)
    {
      charsetCanonicalName = paramCharset.name();
    }
    
    private Object readResolve()
    {
      return Funnels.stringFunnel(Charset.forName(charsetCanonicalName));
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Funnels.StringCharsetFunnel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */