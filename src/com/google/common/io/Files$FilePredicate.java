package com.google.common.io;

import com.google.common.base.Predicate;
import java.io.File;

 enum Files$FilePredicate
  implements Predicate<File>
{
  IS_DIRECTORY,  IS_FILE;
  
  private Files$FilePredicate() {}
}

/* Location:
 * Qualified Name:     com.google.common.io.Files.FilePredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */