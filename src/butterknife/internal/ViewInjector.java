package butterknife.internal;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class ViewInjector
{
  private final String className;
  private final String classPackage;
  private String parentInjector;
  private final String targetClass;
  private final Map<Integer, ViewInjection> viewIdMap = new LinkedHashMap();
  
  ViewInjector(String paramString1, String paramString2, String paramString3)
  {
    classPackage = paramString1;
    className = paramString2;
    targetClass = paramString3;
  }
  
  static void emitCastIfNeeded(StringBuilder paramStringBuilder, String paramString)
  {
    emitCastIfNeeded(paramStringBuilder, "android.view.View", paramString);
  }
  
  static void emitCastIfNeeded(StringBuilder paramStringBuilder, String paramString1, String paramString2)
  {
    if (!paramString1.equals(paramString2)) {
      paramStringBuilder.append('(').append(paramString2).append(") ");
    }
  }
  
  private void emitFieldBindings(StringBuilder paramStringBuilder, ViewInjection paramViewInjection)
  {
    paramViewInjection = paramViewInjection.getFieldBindings();
    if (paramViewInjection.isEmpty()) {}
    for (;;)
    {
      return;
      paramViewInjection = paramViewInjection.iterator();
      while (paramViewInjection.hasNext())
      {
        FieldBinding localFieldBinding = (FieldBinding)paramViewInjection.next();
        paramStringBuilder.append("    target.").append(localFieldBinding.getName()).append(" = ");
        emitCastIfNeeded(paramStringBuilder, localFieldBinding.getType());
        paramStringBuilder.append("view;\n");
      }
    }
  }
  
  static void emitHumanDescription(StringBuilder paramStringBuilder, List<Binding> paramList)
  {
    int i;
    int j;
    switch (paramList.size())
    {
    default: 
      i = 0;
      j = paramList.size();
    case 1: 
      while (i < j)
      {
        Binding localBinding = (Binding)paramList.get(i);
        if (i != 0) {
          paramStringBuilder.append(", ");
        }
        if (i == j - 1) {
          paramStringBuilder.append("and ");
        }
        paramStringBuilder.append(localBinding.getDescription());
        i += 1;
        continue;
        paramStringBuilder.append(((Binding)paramList.get(0)).getDescription());
      }
      return;
    }
    paramStringBuilder.append(((Binding)paramList.get(0)).getDescription()).append(" and ").append(((Binding)paramList.get(1)).getDescription());
  }
  
  private void emitInject(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append("  public static void inject(Finder finder, final ").append(targetClass).append(" target, Object source) {\n");
    if (parentInjector != null) {
      paramStringBuilder.append("    ").append(parentInjector).append(".inject(finder, target, source);\n\n");
    }
    paramStringBuilder.append("    View view;\n");
    Iterator localIterator = viewIdMap.values().iterator();
    while (localIterator.hasNext()) {
      emitViewInjection(paramStringBuilder, (ViewInjection)localIterator.next());
    }
    paramStringBuilder.append("  }\n");
  }
  
  private void emitMethodBindings(StringBuilder paramStringBuilder, ViewInjection paramViewInjection)
  {
    Object localObject2 = paramViewInjection.getMethodBindings();
    if (((Map)localObject2).isEmpty()) {}
    boolean bool;
    do
    {
      return;
      Object localObject1 = "";
      bool = paramViewInjection.getRequiredBindings().isEmpty();
      paramViewInjection = (ViewInjection)localObject1;
      if (bool)
      {
        paramStringBuilder.append("    if (view != null) {\n");
        paramViewInjection = "  ";
      }
      localObject1 = ((Map)localObject2).entrySet().iterator();
      while (((Iterator)localObject1).hasNext())
      {
        Object localObject3 = (Map.Entry)((Iterator)localObject1).next();
        localObject2 = (Listener)((Map.Entry)localObject3).getKey();
        localObject3 = (MethodBinding)((Map.Entry)localObject3).getValue();
        if (!"android.view.View".equals(((Listener)localObject2).getOwnerType())) {}
        Object localObject4;
        for (int i = 1;; i = 0)
        {
          paramStringBuilder.append(paramViewInjection).append("    ");
          if (i != 0) {
            paramStringBuilder.append("((").append(((Listener)localObject2).getOwnerType()).append(") ");
          }
          paramStringBuilder.append("view");
          if (i != 0) {
            paramStringBuilder.append(')');
          }
          paramStringBuilder.append('.').append(((Listener)localObject2).getSetterName()).append("(\n");
          paramStringBuilder.append(paramViewInjection).append("      new ").append(((Listener)localObject2).getType()).append("() {\n");
          paramStringBuilder.append(paramViewInjection).append("        @Override public ").append(((Listener)localObject2).getReturnType()).append(' ').append(((Listener)localObject2).getMethodName()).append("(\n");
          localObject4 = ((Listener)localObject2).getParameterTypes();
          i = 0;
          j = ((List)localObject4).size();
          while (i < j)
          {
            paramStringBuilder.append(paramViewInjection).append("          ").append((String)((List)localObject4).get(i)).append(" p").append(i);
            if (i < j - 1) {
              paramStringBuilder.append(',');
            }
            paramStringBuilder.append('\n');
            i += 1;
          }
        }
        paramStringBuilder.append(paramViewInjection).append("        ) {\n");
        paramStringBuilder.append(paramViewInjection).append("          ");
        if (!"void".equals(((Listener)localObject2).getReturnType())) {
          paramStringBuilder.append("return ");
        }
        paramStringBuilder.append("target.").append(((MethodBinding)localObject3).getName()).append('(');
        localObject3 = ((MethodBinding)localObject3).getParameters();
        localObject2 = ((Listener)localObject2).getParameterTypes();
        i = 0;
        int j = ((List)localObject3).size();
        while (i < j)
        {
          localObject4 = (Parameter)((List)localObject3).get(i);
          int k = ((Parameter)localObject4).getListenerPosition();
          emitCastIfNeeded(paramStringBuilder, (String)((List)localObject2).get(k), ((Parameter)localObject4).getType());
          paramStringBuilder.append('p').append(k);
          if (i < j - 1) {
            paramStringBuilder.append(", ");
          }
          i += 1;
        }
        paramStringBuilder.append(");\n");
        paramStringBuilder.append(paramViewInjection).append("        }\n");
        paramStringBuilder.append(paramViewInjection).append("      });\n");
      }
    } while (!bool);
    paramStringBuilder.append("    }\n");
  }
  
  private void emitReset(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append("  public static void reset(").append(targetClass).append(" target) {\n");
    if (parentInjector != null) {
      paramStringBuilder.append("    ").append(parentInjector).append(".reset(target);\n\n");
    }
    Iterator localIterator1 = viewIdMap.values().iterator();
    while (localIterator1.hasNext())
    {
      Iterator localIterator2 = ((ViewInjection)localIterator1.next()).getFieldBindings().iterator();
      while (localIterator2.hasNext())
      {
        FieldBinding localFieldBinding = (FieldBinding)localIterator2.next();
        paramStringBuilder.append("    target.").append(localFieldBinding.getName()).append(" = null;\n");
      }
    }
    paramStringBuilder.append("  }\n");
  }
  
  private void emitViewInjection(StringBuilder paramStringBuilder, ViewInjection paramViewInjection)
  {
    paramStringBuilder.append("    view = finder.findById(source, ").append(paramViewInjection.getId()).append(");\n");
    List localList = paramViewInjection.getRequiredBindings();
    if (!localList.isEmpty())
    {
      paramStringBuilder.append("    if (view == null) {\n").append("      throw new IllegalStateException(\"Required view with id '").append(paramViewInjection.getId()).append("' for ");
      emitHumanDescription(paramStringBuilder, localList);
      paramStringBuilder.append(" was not found. If this view is optional add '@Optional' annotation.\");\n").append("    }\n");
    }
    emitFieldBindings(paramStringBuilder, paramViewInjection);
    emitMethodBindings(paramStringBuilder, paramViewInjection);
  }
  
  private ViewInjection getOrCreateViewBinding(int paramInt)
  {
    ViewInjection localViewInjection2 = (ViewInjection)viewIdMap.get(Integer.valueOf(paramInt));
    ViewInjection localViewInjection1 = localViewInjection2;
    if (localViewInjection2 == null)
    {
      localViewInjection1 = new ViewInjection(paramInt);
      viewIdMap.put(Integer.valueOf(paramInt), localViewInjection1);
    }
    return localViewInjection1;
  }
  
  void addField(int paramInt, String paramString1, String paramString2, boolean paramBoolean)
  {
    getOrCreateViewBinding(paramInt).addFieldBinding(new FieldBinding(paramString1, paramString2, paramBoolean));
  }
  
  boolean addMethod(int paramInt, Listener paramListener, String paramString, List<Parameter> paramList, boolean paramBoolean)
  {
    try
    {
      getOrCreateViewBinding(paramInt).addMethodBinding(paramListener, new MethodBinding(paramString, paramList, paramBoolean));
      return true;
    }
    catch (IllegalStateException paramListener) {}
    return false;
  }
  
  String brewJava()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("// Generated code from Butter Knife. Do not modify!\n");
    localStringBuilder.append("package ").append(classPackage).append(";\n\n");
    localStringBuilder.append("import android.view.View;\n");
    localStringBuilder.append("import butterknife.ButterKnife.Finder;\n\n");
    localStringBuilder.append("public class ").append(className).append(" {\n");
    emitInject(localStringBuilder);
    localStringBuilder.append('\n');
    emitReset(localStringBuilder);
    localStringBuilder.append("}\n");
    return localStringBuilder.toString();
  }
  
  String getFqcn()
  {
    return classPackage + "." + className;
  }
  
  void setParentInjector(String paramString)
  {
    parentInjector = paramString;
  }
}

/* Location:
 * Qualified Name:     butterknife.internal.ViewInjector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */