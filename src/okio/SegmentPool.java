package okio;

final class SegmentPool
{
  static final SegmentPool INSTANCE = new SegmentPool();
  static final long MAX_SIZE = 65536L;
  long byteCount;
  private Segment next;
  
  void recycle(Segment paramSegment)
  {
    if ((next != null) || (prev != null)) {
      throw new IllegalArgumentException();
    }
    try
    {
      if (byteCount + 2048L > 65536L) {
        return;
      }
      byteCount += 2048L;
      next = next;
      limit = 0;
      pos = 0;
      next = paramSegment;
      return;
    }
    finally {}
  }
  
  Segment take()
  {
    try
    {
      if (next != null)
      {
        Segment localSegment = next;
        next = next;
        next = null;
        byteCount -= 2048L;
        return localSegment;
      }
      return new Segment();
    }
    finally {}
  }
}

/* Location:
 * Qualified Name:     okio.SegmentPool
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */