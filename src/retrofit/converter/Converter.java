package retrofit.converter;

import java.lang.reflect.Type;
import retrofit.mime.TypedInput;
import retrofit.mime.TypedOutput;

public abstract interface Converter
{
  public abstract Object fromBody(TypedInput paramTypedInput, Type paramType)
    throws ConversionException;
  
  public abstract TypedOutput toBody(Object paramObject);
}

/* Location:
 * Qualified Name:     retrofit.converter.Converter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */