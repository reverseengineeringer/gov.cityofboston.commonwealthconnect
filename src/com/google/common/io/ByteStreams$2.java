package com.google.common.io;

import com.google.common.base.Function;
import java.io.InputStream;

final class ByteStreams$2
  implements Function<InputSupplier<? extends InputStream>, ByteSource>
{
  public ByteSource apply(InputSupplier<? extends InputStream> paramInputSupplier)
  {
    return ByteStreams.asByteSource(paramInputSupplier);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteStreams.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */