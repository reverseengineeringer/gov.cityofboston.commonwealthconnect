package com.j256.ormlite.dao;

class BaseDaoImpl$DaoConfigArray
{
  private BaseDaoImpl<?, ?>[] daoArray = new BaseDaoImpl[10];
  private int daoArrayC = 0;
  
  public void addDao(BaseDaoImpl<?, ?> paramBaseDaoImpl)
  {
    if (daoArrayC == daoArray.length)
    {
      arrayOfBaseDaoImpl = new BaseDaoImpl[daoArray.length * 2];
      i = 0;
      while (i < daoArray.length)
      {
        arrayOfBaseDaoImpl[i] = daoArray[i];
        daoArray[i] = null;
        i += 1;
      }
      daoArray = arrayOfBaseDaoImpl;
    }
    BaseDaoImpl[] arrayOfBaseDaoImpl = daoArray;
    int i = daoArrayC;
    daoArrayC = (i + 1);
    arrayOfBaseDaoImpl[i] = paramBaseDaoImpl;
  }
  
  public void clear()
  {
    int i = 0;
    while (i < daoArrayC)
    {
      daoArray[i] = null;
      i += 1;
    }
    daoArrayC = 0;
  }
  
  public BaseDaoImpl<?, ?> get(int paramInt)
  {
    return daoArray[paramInt];
  }
  
  public int size()
  {
    return daoArrayC;
  }
}

/* Location:
 * Qualified Name:     com.j256.ormlite.dao.BaseDaoImpl.DaoConfigArray
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */