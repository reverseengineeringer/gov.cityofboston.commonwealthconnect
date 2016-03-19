package butterknife.internal;

import butterknife.InjectView;
import butterknife.OnCheckedChanged;
import butterknife.OnClick;
import butterknife.OnEditorAction;
import butterknife.OnFocusChanged;
import butterknife.OnItemClick;
import butterknife.OnItemLongClick;
import butterknife.OnLongClick;
import butterknife.Optional;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.processing.AbstractProcessor;
import javax.annotation.processing.Filer;
import javax.annotation.processing.Messager;
import javax.annotation.processing.ProcessingEnvironment;
import javax.annotation.processing.RoundEnvironment;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.Element;
import javax.lang.model.element.ElementKind;
import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.Modifier;
import javax.lang.model.element.PackageElement;
import javax.lang.model.element.TypeElement;
import javax.lang.model.element.VariableElement;
import javax.lang.model.type.DeclaredType;
import javax.lang.model.type.TypeKind;
import javax.lang.model.type.TypeMirror;
import javax.lang.model.util.Elements;
import javax.lang.model.util.Types;
import javax.tools.Diagnostic.Kind;
import javax.tools.JavaFileObject;

public final class InjectViewProcessor
  extends AbstractProcessor
{
  private static final List<Class<? extends Annotation>> LISTENERS = Arrays.asList(new Class[] { OnCheckedChanged.class, OnClick.class, OnEditorAction.class, OnFocusChanged.class, OnItemClick.class, OnItemLongClick.class, OnLongClick.class });
  private static final Map<String, Listener> LISTENER_MAP = new LinkedHashMap();
  public static final String SUFFIX = "$$ViewInjector";
  static final String VIEW_TYPE = "android.view.View";
  private Elements elementUtils;
  private Filer filer;
  private Types typeUtils;
  
  private boolean containsTypeMirror(Collection<TypeMirror> paramCollection, TypeMirror paramTypeMirror)
  {
    paramTypeMirror = typeUtils.erasure(paramTypeMirror);
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext())
    {
      TypeMirror localTypeMirror = (TypeMirror)paramCollection.next();
      if (typeUtils.isSameType(localTypeMirror, paramTypeMirror)) {
        return true;
      }
    }
    return false;
  }
  
  private void error(Element paramElement, String paramString, Object... paramVarArgs)
  {
    processingEnv.getMessager().printMessage(Diagnostic.Kind.ERROR, String.format(paramString, paramVarArgs), paramElement);
  }
  
  private void findAndParseListener(RoundEnvironment paramRoundEnvironment, Class<? extends Annotation> paramClass, Map<TypeElement, ViewInjector> paramMap, Set<TypeMirror> paramSet)
  {
    paramRoundEnvironment = paramRoundEnvironment.getElementsAnnotatedWith(paramClass).iterator();
    while (paramRoundEnvironment.hasNext())
    {
      Element localElement = (Element)paramRoundEnvironment.next();
      try
      {
        parseListenerAnnotation(paramClass, localElement, paramMap, paramSet);
      }
      catch (Exception localException)
      {
        StringWriter localStringWriter = new StringWriter();
        localException.printStackTrace(new PrintWriter(localStringWriter));
        error(localElement, "Unable to generate view injector for @%s.\n\n%s", new Object[] { paramClass.getSimpleName(), localStringWriter.toString() });
      }
    }
  }
  
  private Map<TypeElement, ViewInjector> findAndParseTargets(RoundEnvironment paramRoundEnvironment)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    LinkedHashSet localLinkedHashSet = new LinkedHashSet();
    Object localObject1 = paramRoundEnvironment.getElementsAnnotatedWith(InjectView.class).iterator();
    Object localObject2;
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Element)((Iterator)localObject1).next();
      try
      {
        parseInjectView((Element)localObject2, localLinkedHashMap, localLinkedHashSet);
      }
      catch (Exception localException)
      {
        StringWriter localStringWriter = new StringWriter();
        localException.printStackTrace(new PrintWriter(localStringWriter));
        error((Element)localObject2, "Unable to generate view injector for @InjectView.\n\n%s", new Object[] { localStringWriter.toString() });
      }
    }
    localObject1 = LISTENERS.iterator();
    while (((Iterator)localObject1).hasNext()) {
      findAndParseListener(paramRoundEnvironment, (Class)((Iterator)localObject1).next(), localLinkedHashMap, localLinkedHashSet);
    }
    paramRoundEnvironment = localLinkedHashMap.entrySet().iterator();
    while (paramRoundEnvironment.hasNext())
    {
      localObject1 = (Map.Entry)paramRoundEnvironment.next();
      localObject2 = findParentFqcn((TypeElement)((Map.Entry)localObject1).getKey(), localLinkedHashSet);
      if (localObject2 != null) {
        ((ViewInjector)((Map.Entry)localObject1).getValue()).setParentInjector((String)localObject2 + "$$ViewInjector");
      }
    }
    return localLinkedHashMap;
  }
  
  private String findParentFqcn(TypeElement paramTypeElement, Set<TypeMirror> paramSet)
  {
    TypeMirror localTypeMirror;
    TypeElement localTypeElement;
    do
    {
      localTypeMirror = paramTypeElement.getSuperclass();
      if (localTypeMirror.getKind() == TypeKind.NONE) {
        return null;
      }
      localTypeElement = (TypeElement)((DeclaredType)localTypeMirror).asElement();
      paramTypeElement = localTypeElement;
    } while (!containsTypeMirror(paramSet, localTypeMirror));
    paramTypeElement = getPackageName(localTypeElement);
    return paramTypeElement + "." + getClassName(localTypeElement, paramTypeElement);
  }
  
  private static String getClassName(TypeElement paramTypeElement, String paramString)
  {
    int i = paramString.length();
    return paramTypeElement.getQualifiedName().toString().substring(i + 1).replace('.', '$');
  }
  
  private ViewInjector getOrCreateTargetClass(Map<TypeElement, ViewInjector> paramMap, TypeElement paramTypeElement)
  {
    Object localObject2 = (ViewInjector)paramMap.get(paramTypeElement);
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      localObject1 = paramTypeElement.getQualifiedName().toString();
      localObject2 = getPackageName(paramTypeElement);
      localObject1 = new ViewInjector((String)localObject2, getClassName(paramTypeElement, (String)localObject2) + "$$ViewInjector", (String)localObject1);
      paramMap.put(paramTypeElement, localObject1);
    }
    return (ViewInjector)localObject1;
  }
  
  private String getPackageName(TypeElement paramTypeElement)
  {
    return elementUtils.getPackageOf(paramTypeElement).getQualifiedName().toString();
  }
  
  private boolean isSubtypeOfType(TypeMirror paramTypeMirror, String paramString)
  {
    if (paramString.equals(paramTypeMirror.toString())) {}
    do
    {
      StringBuilder localStringBuilder;
      do
      {
        return true;
        if (!(paramTypeMirror instanceof DeclaredType)) {
          return false;
        }
        paramTypeMirror = (DeclaredType)paramTypeMirror;
        List localList = paramTypeMirror.getTypeArguments();
        if (localList.size() <= 0) {
          break;
        }
        localStringBuilder = new StringBuilder(paramTypeMirror.asElement().toString());
        localStringBuilder.append('<');
        int i = 0;
        while (i < localList.size())
        {
          if (i > 0) {
            localStringBuilder.append(',');
          }
          localStringBuilder.append('?');
          i += 1;
        }
        localStringBuilder.append('>');
      } while (localStringBuilder.toString().equals(paramString));
      paramTypeMirror = paramTypeMirror.asElement();
      if (!(paramTypeMirror instanceof TypeElement)) {
        return false;
      }
      paramTypeMirror = (TypeElement)paramTypeMirror;
    } while (isSubtypeOfType(paramTypeMirror.getSuperclass(), paramString));
    paramTypeMirror = paramTypeMirror.getInterfaces().iterator();
    while (paramTypeMirror.hasNext()) {
      if (isSubtypeOfType((TypeMirror)paramTypeMirror.next(), paramString)) {
        return true;
      }
    }
    return false;
  }
  
  private boolean isValidForGeneratedCode(Class<? extends Annotation> paramClass, String paramString, Element paramElement)
  {
    boolean bool = false;
    TypeElement localTypeElement = (TypeElement)paramElement.getEnclosingElement();
    Set localSet = paramElement.getModifiers();
    if ((localSet.contains(Modifier.PRIVATE)) || (localSet.contains(Modifier.STATIC)))
    {
      error(paramElement, "@%s %s must not be private or static. (%s.%s)", new Object[] { paramClass.getSimpleName(), paramString, localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      bool = true;
    }
    if (localTypeElement.getKind() != ElementKind.CLASS)
    {
      error(localTypeElement, "@%s %s may only be contained in classes. (%s.%s)", new Object[] { paramClass.getSimpleName(), paramString, localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      bool = true;
    }
    if (localTypeElement.getModifiers().contains(Modifier.PRIVATE))
    {
      error(localTypeElement, "@%s %s may not be contained in private classes. (%s.%s)", new Object[] { paramClass.getSimpleName(), paramString, localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      bool = true;
    }
    return bool;
  }
  
  private void parseInjectView(Element paramElement, Map<TypeElement, ViewInjector> paramMap, Set<TypeMirror> paramSet)
  {
    boolean bool = true;
    int i = 0;
    TypeElement localTypeElement = (TypeElement)paramElement.getEnclosingElement();
    if (!isSubtypeOfType(paramElement.asType(), "android.view.View"))
    {
      error(paramElement, "@InjectView fields must extend from View (%s.%s).", new Object[] { localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      i = 1;
    }
    if ((i | isValidForGeneratedCode(InjectView.class, "fields", paramElement)) != 0) {
      return;
    }
    String str1 = paramElement.getSimpleName().toString();
    i = ((InjectView)paramElement.getAnnotation(InjectView.class)).value();
    String str2 = paramElement.asType().toString();
    if (paramElement.getAnnotation(Optional.class) == null) {}
    for (;;)
    {
      getOrCreateTargetClass(paramMap, localTypeElement).addField(i, str1, str2, bool);
      paramSet.add(typeUtils.erasure(localTypeElement.asType()));
      return;
      bool = false;
    }
  }
  
  private void parseListenerAnnotation(Class<? extends Annotation> paramClass, Element paramElement, Map<TypeElement, ViewInjector> paramMap, Set<TypeMirror> paramSet)
    throws Exception
  {
    if ((!(paramElement instanceof ExecutableElement)) || (paramElement.getKind() != ElementKind.METHOD))
    {
      error(paramElement, "@%s annotation must be on a method.", new Object[] { paramClass.getSimpleName() });
      return;
    }
    ExecutableElement localExecutableElement = (ExecutableElement)paramElement;
    TypeElement localTypeElement = (TypeElement)paramElement.getEnclosingElement();
    Object localObject1 = paramElement.getAnnotation(paramClass);
    Object localObject2 = paramClass.getDeclaredMethod("value", new Class[0]);
    if ((localObject2 == null) || (((Method)localObject2).getReturnType() != int[].class))
    {
      error(paramElement, "@%s annotation lacks int[] value property. (%s.%s)", new Object[] { paramClass, localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      return;
    }
    int[] arrayOfInt = (int[])((Method)localObject2).invoke(localObject1, new Object[0]);
    String str = localExecutableElement.getSimpleName().toString();
    if (paramElement.getAnnotation(Optional.class) == null) {}
    boolean bool1;
    int k;
    for (boolean bool2 = true;; bool2 = false)
    {
      bool1 = isValidForGeneratedCode(paramClass, "methods", paramElement);
      localObject1 = new LinkedHashSet(arrayOfInt.length);
      j = arrayOfInt.length;
      i = 0;
      while (i < j)
      {
        k = arrayOfInt[i];
        if (!((Set)localObject1).add(Integer.valueOf(k)))
        {
          error(paramElement, "@%s annotation for method contains duplicate ID %d. (%s.%s)", new Object[] { paramClass.getSimpleName(), Integer.valueOf(k), localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
          bool1 = true;
        }
        i += 1;
      }
    }
    localObject1 = (ListenerClass)paramClass.getAnnotation(ListenerClass.class);
    if (localObject1 == null)
    {
      error(paramElement, "No @%s defined on @%s.", new Object[] { ListenerClass.class.getSimpleName(), paramClass.getSimpleName() });
      return;
    }
    Object localObject3 = ((ListenerClass)localObject1).value();
    localObject2 = (Listener)LISTENER_MAP.get(localObject3);
    localObject1 = localObject2;
    if (localObject2 == null) {}
    for (;;)
    {
      List localList1;
      BitSet localBitSet;
      try
      {
        localObject1 = Listener.from(elementUtils.getTypeElement((CharSequence)localObject3), typeUtils);
        LISTENER_MAP.put(localObject3, localObject1);
        localList1 = localExecutableElement.getParameters();
        if (localList1.size() > ((Listener)localObject1).getParameterTypes().size())
        {
          error(paramElement, "@%s methods can have at most %s parameter(s). (%s.%s)", new Object[] { paramClass.getSimpleName(), Integer.valueOf(((Listener)localObject1).getParameterTypes().size()), localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
          bool1 = true;
        }
        if (!localExecutableElement.getReturnType().toString().equals(((Listener)localObject1).getReturnType()))
        {
          error(paramElement, "@%s methods must have a '%s' return type. (%s.%s)", new Object[] { paramClass.getSimpleName(), ((Listener)localObject1).getReturnType(), localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
          bool1 = true;
        }
        if (bool1) {
          break;
        }
        localObject2 = Parameter.NONE;
        if (localList1.isEmpty()) {
          break label1078;
        }
        localObject3 = new Parameter[localList1.size()];
        localBitSet = new BitSet(localList1.size());
        List localList2 = ((Listener)localObject1).getParameterTypes();
        i = 0;
        localObject2 = localObject3;
        if (i >= localList1.size()) {
          break label1078;
        }
        localObject2 = ((VariableElement)localList1.get(i)).asType();
        j = 0;
        if (j >= localList2.size()) {
          break label787;
        }
        if (localBitSet.get(j))
        {
          j += 1;
          continue;
        }
        if (!isSubtypeOfType((TypeMirror)localObject2, (String)localList2.get(j))) {
          continue;
        }
      }
      catch (IllegalArgumentException paramElement)
      {
        error(elementUtils.getTypeElement(paramClass.getName()), "%s (%s on @%s)", new Object[] { paramElement.getMessage(), localObject3, paramClass.getName() });
        return;
      }
      localObject3[i] = new Parameter(j, localObject2.toString());
      localBitSet.set(j);
      label787:
      if (localObject3[i] == null)
      {
        paramMap = new StringBuilder();
        paramMap.append("Unable to match @").append(paramClass.getSimpleName()).append(" method arguments. (").append(localTypeElement.getQualifiedName()).append('.').append(paramElement.getSimpleName()).append(')');
        i = 0;
        if (i < localObject3.length)
        {
          paramClass = localObject3[i];
          paramMap.append("\n\n  Parameter #").append(i + 1).append(": ").append(((VariableElement)localList1.get(i)).asType().toString()).append("\n    ");
          if (paramClass == null) {
            paramMap.append("did not match any listener parameters");
          }
          for (;;)
          {
            i += 1;
            break;
            paramMap.append("matched listener parameter #").append(paramClass.getListenerPosition() + 1).append(": ").append(paramClass.getType());
          }
        }
        paramMap.append("\n\nMethods may have up to ").append(((Listener)localObject1).getParameterTypes().size()).append(" parameter(s):\n");
        paramClass = ((Listener)localObject1).getParameterTypes().iterator();
        while (paramClass.hasNext())
        {
          paramElement = (String)paramClass.next();
          paramMap.append("\n  ").append(paramElement);
        }
        paramMap.append("\n\nThese may be listed in any order but will be searched for from top to bottom.");
        error(localExecutableElement, paramMap.toString(), new Object[0]);
        return;
      }
      i += 1;
    }
    label1078:
    paramMap = getOrCreateTargetClass(paramMap, localTypeElement);
    int j = arrayOfInt.length;
    int i = 0;
    while (i < j)
    {
      k = arrayOfInt[i];
      if (!paramMap.addMethod(k, (Listener)localObject1, str, Arrays.asList((Object[])localObject2), bool2))
      {
        error(paramElement, "Multiple @%s methods declared for ID %s in %s.", new Object[] { paramClass.getSimpleName(), Integer.valueOf(k), localTypeElement.getQualifiedName() });
        return;
      }
      i += 1;
    }
    paramSet.add(typeUtils.erasure(localTypeElement.asType()));
  }
  
  public Set<String> getSupportedAnnotationTypes()
  {
    LinkedHashSet localLinkedHashSet = new LinkedHashSet();
    localLinkedHashSet.add(InjectView.class.getCanonicalName());
    Iterator localIterator = LISTENERS.iterator();
    while (localIterator.hasNext()) {
      localLinkedHashSet.add(((Class)localIterator.next()).getCanonicalName());
    }
    return localLinkedHashSet;
  }
  
  public SourceVersion getSupportedSourceVersion()
  {
    return SourceVersion.latestSupported();
  }
  
  public void init(ProcessingEnvironment paramProcessingEnvironment)
  {
    try
    {
      super.init(paramProcessingEnvironment);
      elementUtils = paramProcessingEnvironment.getElementUtils();
      typeUtils = paramProcessingEnvironment.getTypeUtils();
      filer = paramProcessingEnvironment.getFiler();
      return;
    }
    finally
    {
      paramProcessingEnvironment = finally;
      throw paramProcessingEnvironment;
    }
  }
  
  public boolean process(Set<? extends TypeElement> paramSet, RoundEnvironment paramRoundEnvironment)
  {
    paramSet = findAndParseTargets(paramRoundEnvironment).entrySet().iterator();
    while (paramSet.hasNext())
    {
      Object localObject = (Map.Entry)paramSet.next();
      paramRoundEnvironment = (TypeElement)((Map.Entry)localObject).getKey();
      localObject = (ViewInjector)((Map.Entry)localObject).getValue();
      try
      {
        Writer localWriter = filer.createSourceFile(((ViewInjector)localObject).getFqcn(), new Element[] { paramRoundEnvironment }).openWriter();
        localWriter.write(((ViewInjector)localObject).brewJava());
        localWriter.flush();
        localWriter.close();
      }
      catch (IOException localIOException)
      {
        error(paramRoundEnvironment, "Unable to write injector for type %s: %s", new Object[] { paramRoundEnvironment, localIOException.getMessage() });
      }
    }
    return true;
  }
}

/* Location:
 * Qualified Name:     butterknife.internal.InjectViewProcessor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */