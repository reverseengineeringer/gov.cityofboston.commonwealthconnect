package net.sqlcipher.database;

public abstract class SQLiteClosable
{
  private Object mLock = new Object();
  private int mReferenceCount = 1;
  
  private String getObjInfo()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getClass().getName());
    localStringBuilder.append(" (");
    if ((this instanceof SQLiteDatabase))
    {
      localStringBuilder.append("database = ");
      localStringBuilder.append(((SQLiteDatabase)this).getPath());
    }
    for (;;)
    {
      localStringBuilder.append(") ");
      return localStringBuilder.toString();
      if (((this instanceof SQLiteProgram)) || ((this instanceof SQLiteStatement)) || ((this instanceof SQLiteQuery)))
      {
        localStringBuilder.append("mSql = ");
        localStringBuilder.append(mSql);
      }
    }
  }
  
  public void acquireReference()
  {
    synchronized (mLock)
    {
      if (mReferenceCount <= 0) {
        throw new IllegalStateException("attempt to re-open an already-closed object: " + getObjInfo());
      }
    }
    mReferenceCount += 1;
  }
  
  protected abstract void onAllReferencesReleased();
  
  protected void onAllReferencesReleasedFromContainer() {}
  
  public void releaseReference()
  {
    synchronized (mLock)
    {
      mReferenceCount -= 1;
      if (mReferenceCount == 0) {
        onAllReferencesReleased();
      }
      return;
    }
  }
  
  public void releaseReferenceFromContainer()
  {
    synchronized (mLock)
    {
      mReferenceCount -= 1;
      if (mReferenceCount == 0) {
        onAllReferencesReleasedFromContainer();
      }
      return;
    }
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.database.SQLiteClosable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */