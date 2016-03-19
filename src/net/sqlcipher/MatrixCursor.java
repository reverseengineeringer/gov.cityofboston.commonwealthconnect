package net.sqlcipher;

import java.util.ArrayList;
import java.util.Iterator;

public class MatrixCursor
  extends AbstractCursor
{
  private final int columnCount;
  private final String[] columnNames;
  private Object[] data;
  private int rowCount = 0;
  
  public MatrixCursor(String[] paramArrayOfString)
  {
    this(paramArrayOfString, 16);
  }
  
  public MatrixCursor(String[] paramArrayOfString, int paramInt)
  {
    columnNames = paramArrayOfString;
    columnCount = paramArrayOfString.length;
    int i = paramInt;
    if (paramInt < 1) {
      i = 1;
    }
    data = new Object[columnCount * i];
  }
  
  private void addRow(ArrayList<?> paramArrayList, int paramInt)
  {
    int j = paramArrayList.size();
    if (j != columnCount) {
      throw new IllegalArgumentException("columnNames.length = " + columnCount + ", columnValues.size() = " + j);
    }
    rowCount += 1;
    Object[] arrayOfObject = data;
    int i = 0;
    while (i < j)
    {
      arrayOfObject[(paramInt + i)] = paramArrayList.get(i);
      i += 1;
    }
  }
  
  private void ensureCapacity(int paramInt)
  {
    if (paramInt > data.length)
    {
      Object[] arrayOfObject = data;
      int j = data.length * 2;
      int i = j;
      if (j < paramInt) {
        i = paramInt;
      }
      data = new Object[i];
      System.arraycopy(arrayOfObject, 0, data, 0, arrayOfObject.length);
    }
  }
  
  private Object get(int paramInt)
  {
    if ((paramInt < 0) || (paramInt >= columnCount)) {
      throw new CursorIndexOutOfBoundsException("Requested column: " + paramInt + ", # of columns: " + columnCount);
    }
    if (mPos < 0) {
      throw new CursorIndexOutOfBoundsException("Before first row.");
    }
    if (mPos >= rowCount) {
      throw new CursorIndexOutOfBoundsException("After last row.");
    }
    return data[(mPos * columnCount + paramInt)];
  }
  
  public void addRow(Iterable<?> paramIterable)
  {
    int i = rowCount * columnCount;
    int j = i + columnCount;
    ensureCapacity(j);
    if ((paramIterable instanceof ArrayList))
    {
      addRow((ArrayList)paramIterable, i);
      return;
    }
    Object[] arrayOfObject = data;
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext())
    {
      Object localObject = paramIterable.next();
      if (i == j) {
        throw new IllegalArgumentException("columnValues.size() > columnNames.length");
      }
      arrayOfObject[i] = localObject;
      i += 1;
    }
    if (i != j) {
      throw new IllegalArgumentException("columnValues.size() < columnNames.length");
    }
    rowCount += 1;
  }
  
  public void addRow(Object[] paramArrayOfObject)
  {
    if (paramArrayOfObject.length != columnCount) {
      throw new IllegalArgumentException("columnNames.length = " + columnCount + ", columnValues.length = " + paramArrayOfObject.length);
    }
    int i = rowCount;
    rowCount = (i + 1);
    i *= columnCount;
    ensureCapacity(columnCount + i);
    System.arraycopy(paramArrayOfObject, 0, data, i, columnCount);
  }
  
  public String[] getColumnNames()
  {
    return columnNames;
  }
  
  public int getCount()
  {
    return rowCount;
  }
  
  public double getDouble(int paramInt)
  {
    Object localObject = get(paramInt);
    if (localObject == null) {
      return 0.0D;
    }
    if ((localObject instanceof Number)) {
      return ((Number)localObject).doubleValue();
    }
    return Double.parseDouble(localObject.toString());
  }
  
  public float getFloat(int paramInt)
  {
    Object localObject = get(paramInt);
    if (localObject == null) {
      return 0.0F;
    }
    if ((localObject instanceof Number)) {
      return ((Number)localObject).floatValue();
    }
    return Float.parseFloat(localObject.toString());
  }
  
  public int getInt(int paramInt)
  {
    Object localObject = get(paramInt);
    if (localObject == null) {
      return 0;
    }
    if ((localObject instanceof Number)) {
      return ((Number)localObject).intValue();
    }
    return Integer.parseInt(localObject.toString());
  }
  
  public long getLong(int paramInt)
  {
    Object localObject = get(paramInt);
    if (localObject == null) {
      return 0L;
    }
    if ((localObject instanceof Number)) {
      return ((Number)localObject).longValue();
    }
    return Long.parseLong(localObject.toString());
  }
  
  public short getShort(int paramInt)
  {
    Object localObject = get(paramInt);
    if (localObject == null) {
      return 0;
    }
    if ((localObject instanceof Number)) {
      return ((Number)localObject).shortValue();
    }
    return Short.parseShort(localObject.toString());
  }
  
  public String getString(int paramInt)
  {
    Object localObject = get(paramInt);
    if (localObject == null) {
      return null;
    }
    return localObject.toString();
  }
  
  public int getType(int paramInt)
  {
    return DatabaseUtils.getTypeOfObject(get(paramInt));
  }
  
  public boolean isNull(int paramInt)
  {
    return get(paramInt) == null;
  }
  
  public RowBuilder newRow()
  {
    rowCount += 1;
    int i = rowCount * columnCount;
    ensureCapacity(i);
    return new RowBuilder(i - columnCount, i);
  }
  
  public class RowBuilder
  {
    private final int endIndex;
    private int index;
    
    RowBuilder(int paramInt1, int paramInt2)
    {
      index = paramInt1;
      endIndex = paramInt2;
    }
    
    public RowBuilder add(Object paramObject)
    {
      if (index == endIndex) {
        throw new CursorIndexOutOfBoundsException("No more columns left.");
      }
      Object[] arrayOfObject = data;
      int i = index;
      index = (i + 1);
      arrayOfObject[i] = paramObject;
      return this;
    }
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.MatrixCursor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */