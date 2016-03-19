package com.google.common.io;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableSet;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

final class Files$FileByteSink
  extends ByteSink
{
  private final File file;
  private final ImmutableSet<FileWriteMode> modes;
  
  private Files$FileByteSink(File paramFile, FileWriteMode... paramVarArgs)
  {
    file = ((File)Preconditions.checkNotNull(paramFile));
    modes = ImmutableSet.copyOf(paramVarArgs);
  }
  
  public FileOutputStream openStream()
    throws IOException
  {
    return new FileOutputStream(file, modes.contains(FileWriteMode.APPEND));
  }
  
  public String toString()
  {
    return "Files.asByteSink(" + file + ", " + modes + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.Files.FileByteSink
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */