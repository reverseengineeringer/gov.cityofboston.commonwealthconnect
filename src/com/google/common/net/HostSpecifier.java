package com.google.common.net;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.net.InetAddress;
import java.text.ParseException;
import javax.annotation.Nullable;

@Beta
public final class HostSpecifier
{
  private final String canonicalForm;
  
  private HostSpecifier(String paramString)
  {
    canonicalForm = paramString;
  }
  
  public static HostSpecifier from(String paramString)
    throws ParseException
  {
    try
    {
      HostSpecifier localHostSpecifier = fromValid(paramString);
      return localHostSpecifier;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      paramString = new ParseException("Invalid host specifier: " + paramString, 0);
      paramString.initCause(localIllegalArgumentException);
      throw paramString;
    }
  }
  
  public static HostSpecifier fromValid(String paramString)
  {
    paramString = HostAndPort.fromString(paramString);
    if (!paramString.hasPort()) {}
    String str;
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      str = paramString.getHostText();
      paramString = null;
      try
      {
        InetAddress localInetAddress = InetAddresses.forString(str);
        paramString = localInetAddress;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        for (;;) {}
      }
      if (paramString == null) {
        break;
      }
      return new HostSpecifier(InetAddresses.toUriString(paramString));
    }
    paramString = InternetDomainName.from(str);
    if (paramString.hasPublicSuffix()) {
      return new HostSpecifier(paramString.toString());
    }
    throw new IllegalArgumentException("Domain name does not have a recognized public suffix: " + str);
  }
  
  public static boolean isValid(String paramString)
  {
    try
    {
      fromValid(paramString);
      return true;
    }
    catch (IllegalArgumentException paramString) {}
    return false;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (this == paramObject) {
      return true;
    }
    if ((paramObject instanceof HostSpecifier))
    {
      paramObject = (HostSpecifier)paramObject;
      return canonicalForm.equals(canonicalForm);
    }
    return false;
  }
  
  public int hashCode()
  {
    return canonicalForm.hashCode();
  }
  
  public String toString()
  {
    return canonicalForm;
  }
}

/* Location:
 * Qualified Name:     com.google.common.net.HostSpecifier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */