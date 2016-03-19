package retrofit;

import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;

final class Types$WildcardTypeImpl
  implements WildcardType
{
  private final Type lowerBound;
  private final Type upperBound;
  
  public Types$WildcardTypeImpl(Type[] paramArrayOfType1, Type[] paramArrayOfType2)
  {
    if (paramArrayOfType2.length > 1) {
      throw new IllegalArgumentException();
    }
    if (paramArrayOfType1.length != 1) {
      throw new IllegalArgumentException();
    }
    if (paramArrayOfType2.length == 1)
    {
      if (paramArrayOfType2[0] == null) {
        throw new NullPointerException();
      }
      Types.access$000(paramArrayOfType2[0]);
      if (paramArrayOfType1[0] != Object.class) {
        throw new IllegalArgumentException();
      }
      lowerBound = paramArrayOfType2[0];
      upperBound = Object.class;
      return;
    }
    if (paramArrayOfType1[0] == null) {
      throw new NullPointerException();
    }
    Types.access$000(paramArrayOfType1[0]);
    lowerBound = null;
    upperBound = paramArrayOfType1[0];
  }
  
  public boolean equals(Object paramObject)
  {
    return ((paramObject instanceof WildcardType)) && (Types.equals(this, (WildcardType)paramObject));
  }
  
  public Type[] getLowerBounds()
  {
    if (lowerBound != null) {
      return new Type[] { lowerBound };
    }
    return Types.access$200();
  }
  
  public Type[] getUpperBounds()
  {
    return new Type[] { upperBound };
  }
  
  public int hashCode()
  {
    if (lowerBound != null) {}
    for (int i = lowerBound.hashCode() + 31;; i = 1) {
      return i ^ upperBound.hashCode() + 31;
    }
  }
  
  public String toString()
  {
    if (lowerBound != null) {
      return "? super " + Types.typeToString(lowerBound);
    }
    if (upperBound == Object.class) {
      return "?";
    }
    return "? extends " + Types.typeToString(upperBound);
  }
}

/* Location:
 * Qualified Name:     retrofit.Types.WildcardTypeImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */