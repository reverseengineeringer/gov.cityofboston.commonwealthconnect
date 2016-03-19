package com.seeclickfix.ma.android.objects;

import com.j256.ormlite.dao.ForeignCollection;
import java.util.List;

public class CollectionHelper<E>
{
  private static final boolean D = false;
  public static final String DB_COLLECTION = "DB_COLLECTION";
  private static final boolean GLOBAL_DEBUG = false;
  public static final String LIST = "LIST";
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "CollectionHelper";
  private String lastUpdatedCollection;
  
  private String checkForData(List<E> paramList, ForeignCollection<E> paramForeignCollection)
  {
    Object localObject2 = null;
    Object localObject1;
    if ((paramList.isEmpty()) && (!paramForeignCollection.isEmpty())) {
      localObject1 = "DB_COLLECTION";
    }
    do
    {
      do
      {
        return (String)localObject1;
        localObject1 = localObject2;
      } while (paramList.isEmpty());
      localObject1 = localObject2;
    } while (!paramForeignCollection.isEmpty());
    return "LIST";
  }
  
  public void update(ForeignCollection<E> paramForeignCollection, List<E> paramList, String paramString)
  {
    if ((lastUpdatedCollection == null) && (paramString == null))
    {
      lastUpdatedCollection = checkForData(paramList, paramForeignCollection);
      if (lastUpdatedCollection != null) {
        break label37;
      }
    }
    label37:
    do
    {
      return;
      lastUpdatedCollection = paramString;
      break;
      if (lastUpdatedCollection.equals("DB_COLLECTION"))
      {
        paramList.clear();
        paramList.addAll(paramForeignCollection);
        return;
      }
    } while (!lastUpdatedCollection.equals("LIST"));
    paramForeignCollection.clear();
    paramForeignCollection.addAll(paramList);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.CollectionHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */