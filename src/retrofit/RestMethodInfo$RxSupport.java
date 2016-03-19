package retrofit;

import java.lang.reflect.Type;
import rx.Observable;

final class RestMethodInfo$RxSupport
{
  public static Type getObservableType(Type paramType, Class paramClass)
  {
    return Types.getSupertype(paramType, paramClass, Observable.class);
  }
  
  public static boolean isObservable(Class paramClass)
  {
    return paramClass == Observable.class;
  }
}

/* Location:
 * Qualified Name:     retrofit.RestMethodInfo.RxSupport
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */