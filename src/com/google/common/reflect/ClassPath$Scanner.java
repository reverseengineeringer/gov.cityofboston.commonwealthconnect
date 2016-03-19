package com.google.common.reflect;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Splitter;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.ImmutableSet.Builder;
import com.google.common.collect.ImmutableSortedSet;
import com.google.common.collect.ImmutableSortedSet.Builder;
import com.google.common.collect.Ordering;
import com.google.common.collect.Sets;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.Set;
import java.util.jar.Attributes;
import java.util.jar.Attributes.Name;
import java.util.jar.Manifest;
import java.util.logging.Logger;
import javax.annotation.Nullable;

@VisibleForTesting
final class ClassPath$Scanner
{
  private final ImmutableSortedSet.Builder<ClassPath.ResourceInfo> resources = new ImmutableSortedSet.Builder(Ordering.usingToString());
  private final Set<URI> scannedUris = Sets.newHashSet();
  
  @VisibleForTesting
  static URI getClassPathEntry(File paramFile, String paramString)
    throws URISyntaxException
  {
    URI localURI = new URI(paramString);
    if (localURI.isAbsolute()) {
      return localURI;
    }
    return new File(paramFile.getParentFile(), paramString.replace('/', File.separatorChar)).toURI();
  }
  
  @VisibleForTesting
  static ImmutableSet<URI> getClassPathFromManifest(File paramFile, @Nullable Manifest paramManifest)
  {
    if (paramManifest == null) {
      return ImmutableSet.of();
    }
    ImmutableSet.Builder localBuilder = ImmutableSet.builder();
    paramManifest = paramManifest.getMainAttributes().getValue(Attributes.Name.CLASS_PATH.toString());
    if (paramManifest != null)
    {
      paramManifest = ClassPath.access$200().split(paramManifest).iterator();
      while (paramManifest.hasNext())
      {
        String str = (String)paramManifest.next();
        try
        {
          URI localURI = getClassPathEntry(paramFile, str);
          localBuilder.add(localURI);
        }
        catch (URISyntaxException localURISyntaxException)
        {
          ClassPath.access$100().warning("Invalid Class-Path entry: " + str);
        }
      }
    }
    return localBuilder.build();
  }
  
  private void scanDirectory(File paramFile, ClassLoader paramClassLoader)
    throws IOException
  {
    scanDirectory(paramFile, paramClassLoader, "", ImmutableSet.of());
  }
  
  private void scanDirectory(File paramFile, ClassLoader paramClassLoader, String paramString, ImmutableSet<File> paramImmutableSet)
    throws IOException
  {
    Object localObject = paramFile.getCanonicalFile();
    if (paramImmutableSet.contains(localObject)) {
      return;
    }
    File[] arrayOfFile = paramFile.listFiles();
    if (arrayOfFile == null)
    {
      ClassPath.access$100().warning("Cannot read directory " + paramFile);
      return;
    }
    paramFile = ImmutableSet.builder().addAll(paramImmutableSet).add(localObject).build();
    int j = arrayOfFile.length;
    int i = 0;
    label79:
    if (i < j)
    {
      paramImmutableSet = arrayOfFile[i];
      localObject = paramImmutableSet.getName();
      if (!paramImmutableSet.isDirectory()) {
        break label149;
      }
      scanDirectory(paramImmutableSet, paramClassLoader, paramString + (String)localObject + "/", paramFile);
    }
    for (;;)
    {
      i += 1;
      break label79;
      break;
      label149:
      paramImmutableSet = paramString + (String)localObject;
      if (!paramImmutableSet.equals("META-INF/MANIFEST.MF")) {
        resources.add(ClassPath.ResourceInfo.of(paramImmutableSet, paramClassLoader));
      }
    }
  }
  
  /* Error */
  private void scanJar(File paramFile, ClassLoader paramClassLoader)
    throws IOException
  {
    // Byte code:
    //   0: new 225	java/util/jar/JarFile
    //   3: dup
    //   4: aload_1
    //   5: invokespecial 228	java/util/jar/JarFile:<init>	(Ljava/io/File;)V
    //   8: astore_3
    //   9: aload_1
    //   10: aload_3
    //   11: invokevirtual 232	java/util/jar/JarFile:getManifest	()Ljava/util/jar/Manifest;
    //   14: invokestatic 234	com/google/common/reflect/ClassPath$Scanner:getClassPathFromManifest	(Ljava/io/File;Ljava/util/jar/Manifest;)Lcom/google/common/collect/ImmutableSet;
    //   17: invokevirtual 235	com/google/common/collect/ImmutableSet:iterator	()Ljava/util/Iterator;
    //   20: astore_1
    //   21: aload_1
    //   22: invokeinterface 134 1 0
    //   27: ifeq +29 -> 56
    //   30: aload_0
    //   31: aload_1
    //   32: invokeinterface 138 1 0
    //   37: checkcast 46	java/net/URI
    //   40: aload_2
    //   41: invokevirtual 239	com/google/common/reflect/ClassPath$Scanner:scan	(Ljava/net/URI;Ljava/lang/ClassLoader;)V
    //   44: goto -23 -> 21
    //   47: astore_1
    //   48: aload_3
    //   49: invokevirtual 242	java/util/jar/JarFile:close	()V
    //   52: aload_1
    //   53: athrow
    //   54: astore_1
    //   55: return
    //   56: aload_3
    //   57: invokevirtual 246	java/util/jar/JarFile:entries	()Ljava/util/Enumeration;
    //   60: astore_1
    //   61: aload_1
    //   62: invokeinterface 251 1 0
    //   67: ifeq +55 -> 122
    //   70: aload_1
    //   71: invokeinterface 254 1 0
    //   76: checkcast 256	java/util/jar/JarEntry
    //   79: astore 4
    //   81: aload 4
    //   83: invokevirtual 257	java/util/jar/JarEntry:isDirectory	()Z
    //   86: ifne -25 -> 61
    //   89: aload 4
    //   91: invokevirtual 258	java/util/jar/JarEntry:getName	()Ljava/lang/String;
    //   94: ldc -46
    //   96: invokevirtual 213	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   99: ifne -38 -> 61
    //   102: aload_0
    //   103: getfield 31	com/google/common/reflect/ClassPath$Scanner:resources	Lcom/google/common/collect/ImmutableSortedSet$Builder;
    //   106: aload 4
    //   108: invokevirtual 258	java/util/jar/JarEntry:getName	()Ljava/lang/String;
    //   111: aload_2
    //   112: invokestatic 218	com/google/common/reflect/ClassPath$ResourceInfo:of	(Ljava/lang/String;Ljava/lang/ClassLoader;)Lcom/google/common/reflect/ClassPath$ResourceInfo;
    //   115: invokevirtual 221	com/google/common/collect/ImmutableSortedSet$Builder:add	(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet$Builder;
    //   118: pop
    //   119: goto -58 -> 61
    //   122: aload_3
    //   123: invokevirtual 242	java/util/jar/JarFile:close	()V
    //   126: return
    //   127: astore_1
    //   128: return
    //   129: astore_2
    //   130: goto -78 -> 52
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	133	0	this	Scanner
    //   0	133	1	paramFile	File
    //   0	133	2	paramClassLoader	ClassLoader
    //   8	115	3	localJarFile	java.util.jar.JarFile
    //   79	28	4	localJarEntry	java.util.jar.JarEntry
    // Exception table:
    //   from	to	target	type
    //   9	21	47	finally
    //   21	44	47	finally
    //   56	61	47	finally
    //   61	119	47	finally
    //   0	9	54	java/io/IOException
    //   122	126	127	java/io/IOException
    //   48	52	129	java/io/IOException
  }
  
  ImmutableSortedSet<ClassPath.ResourceInfo> getResources()
  {
    return resources.build();
  }
  
  void scan(URI paramURI, ClassLoader paramClassLoader)
    throws IOException
  {
    if ((paramURI.getScheme().equals("file")) && (scannedUris.add(paramURI))) {
      scanFrom(new File(paramURI), paramClassLoader);
    }
  }
  
  @VisibleForTesting
  void scanFrom(File paramFile, ClassLoader paramClassLoader)
    throws IOException
  {
    if (!paramFile.exists()) {
      return;
    }
    if (paramFile.isDirectory())
    {
      scanDirectory(paramFile, paramClassLoader);
      return;
    }
    scanJar(paramFile, paramClassLoader);
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.ClassPath.Scanner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */