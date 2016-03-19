package com.google.common.io;

import com.google.common.base.Function;
import java.io.Reader;

final class CharStreams$1
  implements Function<InputSupplier<? extends Reader>, CharSource>
{
  public CharSource apply(InputSupplier<? extends Reader> paramInputSupplier)
  {
    return CharStreams.asCharSource(paramInputSupplier);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CharStreams.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */