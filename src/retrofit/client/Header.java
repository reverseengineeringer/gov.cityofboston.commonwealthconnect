package retrofit.client;

public final class Header
{
  private final String name;
  private final String value;
  
  public Header(String paramString1, String paramString2)
  {
    name = paramString1;
    value = paramString2;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass())) {
        return false;
      }
      paramObject = (Header)paramObject;
      if (name != null)
      {
        if (name.equals(name)) {}
      }
      else {
        while (name != null) {
          return false;
        }
      }
      if (value == null) {
        break;
      }
    } while (value.equals(value));
    for (;;)
    {
      return false;
      if (value == null) {
        break;
      }
    }
  }
  
  public String getName()
  {
    return name;
  }
  
  public String getValue()
  {
    return value;
  }
  
  public int hashCode()
  {
    int j = 0;
    if (name != null) {}
    for (int i = name.hashCode();; i = 0)
    {
      if (value != null) {
        j = value.hashCode();
      }
      return i * 31 + j;
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (name != null)
    {
      str = name;
      localStringBuilder = localStringBuilder.append(str).append(": ");
      if (value == null) {
        break label58;
      }
    }
    label58:
    for (String str = value;; str = "")
    {
      return str;
      str = "";
      break;
    }
  }
}

/* Location:
 * Qualified Name:     retrofit.client.Header
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */