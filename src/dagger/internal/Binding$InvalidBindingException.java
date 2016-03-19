package dagger.internal;

public class Binding$InvalidBindingException
  extends RuntimeException
{
  public final String type;
  
  public Binding$InvalidBindingException(String paramString1, String paramString2)
  {
    super(paramString2);
    type = paramString1;
  }
  
  public Binding$InvalidBindingException(String paramString1, String paramString2, Throwable paramThrowable)
  {
    super("Binding for " + paramString1 + " was invalid: " + paramString2, paramThrowable);
    type = paramString1;
  }
}

/* Location:
 * Qualified Name:     dagger.internal.Binding.InvalidBindingException
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */