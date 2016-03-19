package com.google.common.io;

import com.google.common.collect.TreeTraverser;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;

final class Files$2
  extends TreeTraverser<File>
{
  public Iterable<File> children(File paramFile)
  {
    if (paramFile.isDirectory())
    {
      paramFile = paramFile.listFiles();
      if (paramFile != null) {
        return Collections.unmodifiableList(Arrays.asList(paramFile));
      }
    }
    return Collections.emptyList();
  }
  
  public String toString()
  {
    return "Files.fileTreeTraverser()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.Files.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */