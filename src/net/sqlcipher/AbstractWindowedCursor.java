package net.sqlcipher;

import android.database.CharArrayBuffer;

public abstract class AbstractWindowedCursor
  extends AbstractCursor
{
  protected CursorWindow mWindow;
  
  protected void checkPosition()
  {
    super.checkPosition();
    if (mWindow == null) {
      throw new StaleDataException("Access closed cursor");
    }
  }
  
  public void copyStringToBuffer(int paramInt, CharArrayBuffer paramCharArrayBuffer)
  {
    checkPosition();
    synchronized (mUpdatedRows)
    {
      if (isFieldUpdated(paramInt)) {
        super.copyStringToBuffer(paramInt, paramCharArrayBuffer);
      }
      mWindow.copyStringToBuffer(mPos, paramInt, paramCharArrayBuffer);
      return;
    }
  }
  
  public byte[] getBlob(int paramInt)
  {
    checkPosition();
    synchronized (mUpdatedRows)
    {
      if (isFieldUpdated(paramInt))
      {
        byte[] arrayOfByte = (byte[])getUpdatedField(paramInt);
        return arrayOfByte;
      }
      return mWindow.getBlob(mPos, paramInt);
    }
  }
  
  public double getDouble(int paramInt)
  {
    checkPosition();
    synchronized (mUpdatedRows)
    {
      if (isFieldUpdated(paramInt))
      {
        double d = ((Number)getUpdatedField(paramInt)).doubleValue();
        return d;
      }
      return mWindow.getDouble(mPos, paramInt);
    }
  }
  
  public float getFloat(int paramInt)
  {
    checkPosition();
    synchronized (mUpdatedRows)
    {
      if (isFieldUpdated(paramInt))
      {
        float f = ((Number)getUpdatedField(paramInt)).floatValue();
        return f;
      }
      return mWindow.getFloat(mPos, paramInt);
    }
  }
  
  public int getInt(int paramInt)
  {
    checkPosition();
    synchronized (mUpdatedRows)
    {
      if (isFieldUpdated(paramInt))
      {
        paramInt = ((Number)getUpdatedField(paramInt)).intValue();
        return paramInt;
      }
      return mWindow.getInt(mPos, paramInt);
    }
  }
  
  public long getLong(int paramInt)
  {
    checkPosition();
    synchronized (mUpdatedRows)
    {
      if (isFieldUpdated(paramInt))
      {
        long l = ((Number)getUpdatedField(paramInt)).longValue();
        return l;
      }
      return mWindow.getLong(mPos, paramInt);
    }
  }
  
  public short getShort(int paramInt)
  {
    checkPosition();
    synchronized (mUpdatedRows)
    {
      if (isFieldUpdated(paramInt))
      {
        short s = ((Number)getUpdatedField(paramInt)).shortValue();
        return s;
      }
      return mWindow.getShort(mPos, paramInt);
    }
  }
  
  public String getString(int paramInt)
  {
    checkPosition();
    synchronized (mUpdatedRows)
    {
      if (isFieldUpdated(paramInt))
      {
        String str = (String)getUpdatedField(paramInt);
        return str;
      }
      return mWindow.getString(mPos, paramInt);
    }
  }
  
  public int getType(int paramInt)
  {
    checkPosition();
    return mWindow.getType(mPos, paramInt);
  }
  
  public CursorWindow getWindow()
  {
    return mWindow;
  }
  
  public boolean hasWindow()
  {
    return mWindow != null;
  }
  
  public boolean isBlob(int paramInt)
  {
    checkPosition();
    for (;;)
    {
      synchronized (mUpdatedRows)
      {
        if (isFieldUpdated(paramInt))
        {
          Object localObject1 = getUpdatedField(paramInt);
          if (localObject1 != null)
          {
            if (!(localObject1 instanceof byte[])) {
              break label73;
            }
            break label68;
            return bool;
          }
        }
        else
        {
          return mWindow.isBlob(mPos, paramInt);
        }
      }
      label68:
      boolean bool = true;
      continue;
      label73:
      bool = false;
    }
  }
  
  public boolean isFloat(int paramInt)
  {
    checkPosition();
    for (;;)
    {
      synchronized (mUpdatedRows)
      {
        if (isFieldUpdated(paramInt))
        {
          Object localObject1 = getUpdatedField(paramInt);
          if (localObject1 == null) {
            break label81;
          }
          if (!(localObject1 instanceof Float))
          {
            if (!(localObject1 instanceof Double)) {
              break label81;
            }
            break label76;
            return bool;
          }
        }
        else
        {
          return mWindow.isFloat(mPos, paramInt);
        }
      }
      label76:
      boolean bool = true;
      continue;
      label81:
      bool = false;
    }
  }
  
  public boolean isLong(int paramInt)
  {
    checkPosition();
    for (;;)
    {
      synchronized (mUpdatedRows)
      {
        if (isFieldUpdated(paramInt))
        {
          Object localObject1 = getUpdatedField(paramInt);
          if (localObject1 == null) {
            break label81;
          }
          if (!(localObject1 instanceof Integer))
          {
            if (!(localObject1 instanceof Long)) {
              break label81;
            }
            break label76;
            return bool;
          }
        }
        else
        {
          return mWindow.isLong(mPos, paramInt);
        }
      }
      label76:
      boolean bool = true;
      continue;
      label81:
      bool = false;
    }
  }
  
  public boolean isNull(int paramInt)
  {
    checkPosition();
    for (;;)
    {
      synchronized (mUpdatedRows)
      {
        if (isFieldUpdated(paramInt))
        {
          if (getUpdatedField(paramInt) == null)
          {
            bool = true;
            return bool;
          }
        }
        else {
          return mWindow.isNull(mPos, paramInt);
        }
      }
      boolean bool = false;
    }
  }
  
  public boolean isString(int paramInt)
  {
    checkPosition();
    for (;;)
    {
      synchronized (mUpdatedRows)
      {
        if (isFieldUpdated(paramInt))
        {
          Object localObject1 = getUpdatedField(paramInt);
          if (localObject1 != null)
          {
            if (!(localObject1 instanceof String)) {
              break label73;
            }
            break label68;
            return bool;
          }
        }
        else
        {
          return mWindow.isString(mPos, paramInt);
        }
      }
      label68:
      boolean bool = true;
      continue;
      label73:
      bool = false;
    }
  }
  
  public void setWindow(CursorWindow paramCursorWindow)
  {
    if (mWindow != null) {
      mWindow.close();
    }
    mWindow = paramCursorWindow;
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.AbstractWindowedCursor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */