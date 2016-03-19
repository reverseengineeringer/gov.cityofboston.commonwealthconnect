package butterknife.internal;

final class FieldBinding
  implements Binding
{
  private final String name;
  private final boolean required;
  private final String type;
  
  FieldBinding(String paramString1, String paramString2, boolean paramBoolean)
  {
    name = paramString1;
    type = paramString2;
    required = paramBoolean;
  }
  
  public String getDescription()
  {
    return "field '" + name + "'";
  }
  
  public String getName()
  {
    return name;
  }
  
  public String getType()
  {
    return type;
  }
  
  public boolean isRequired()
  {
    return required;
  }
}

/* Location:
 * Qualified Name:     butterknife.internal.FieldBinding
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */