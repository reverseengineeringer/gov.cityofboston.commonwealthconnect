package butterknife.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.lang.model.element.Element;
import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.TypeElement;
import javax.lang.model.element.VariableElement;
import javax.lang.model.util.Types;

final class Listener
{
  private final String methodName;
  private final String ownerType;
  private final List<String> parameterTypes;
  private final String returnType;
  private final String setterName;
  private final String type;
  
  private Listener(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, List<String> paramList)
  {
    ownerType = paramString1;
    setterName = paramString2;
    type = paramString3;
    returnType = paramString4;
    methodName = paramString5;
    parameterTypes = paramList;
  }
  
  static Listener from(TypeElement paramTypeElement, Types paramTypes)
  {
    Object localObject1 = paramTypeElement.getEnclosedElements();
    if (((List)localObject1).size() != 1) {
      throw new IllegalArgumentException(paramTypeElement.getSimpleName() + " is not a single-method interface");
    }
    Object localObject2 = (ExecutableElement)((List)localObject1).get(0);
    localObject1 = paramTypes.erasure(paramTypeElement.getEnclosingElement().asType()).toString();
    String str1 = "set" + paramTypeElement.getSimpleName();
    String str2 = paramTypeElement.getQualifiedName().toString();
    String str3 = ((ExecutableElement)localObject2).getSimpleName().toString();
    String str4 = ((ExecutableElement)localObject2).getReturnType().toString();
    paramTypeElement = ((ExecutableElement)localObject2).getParameters();
    localObject2 = new ArrayList(paramTypeElement.size());
    Iterator localIterator = paramTypeElement.iterator();
    while (localIterator.hasNext())
    {
      paramTypes = ((VariableElement)localIterator.next()).asType().toString();
      paramTypeElement = paramTypes;
      if (paramTypes.startsWith("java.lang."))
      {
        paramTypeElement = paramTypes;
        if (!paramTypes.substring(10).contains(".")) {
          paramTypeElement = paramTypes.substring(10);
        }
      }
      ((List)localObject2).add(paramTypeElement);
    }
    return new Listener((String)localObject1, str1, str2, str4, str3, (List)localObject2);
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
      paramObject = (Listener)paramObject;
    } while ((methodName.equals(methodName)) && (ownerType.equals(ownerType)) && (parameterTypes.equals(parameterTypes)) && (returnType.equals(returnType)) && (setterName.equals(setterName)) && (type.equals(type)));
    return false;
  }
  
  String getMethodName()
  {
    return methodName;
  }
  
  public String getOwnerType()
  {
    return ownerType;
  }
  
  List<String> getParameterTypes()
  {
    return parameterTypes;
  }
  
  String getReturnType()
  {
    return returnType;
  }
  
  public String getSetterName()
  {
    return setterName;
  }
  
  String getType()
  {
    return type;
  }
  
  public int hashCode()
  {
    return ((((ownerType.hashCode() * 31 + setterName.hashCode()) * 31 + type.hashCode()) * 31 + returnType.hashCode()) * 31 + methodName.hashCode()) * 31 + parameterTypes.hashCode();
  }
}

/* Location:
 * Qualified Name:     butterknife.internal.Listener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */