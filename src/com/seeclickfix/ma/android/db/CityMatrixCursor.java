package com.seeclickfix.ma.android.db;

import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.PreparedQuery;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.SelectArg;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.objects.loc.City;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

public class CityMatrixCursor
  extends MatrixCursor
{
  public static final String[] COLUMNS = { "_id", "suggest_text_1", "suggest_text_2", "suggest_icon_1", "suggest_intent_action", "suggest_intent_data" };
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final long MAX_RESULTS = 5L;
  private static final String TAG = "SCFAPP_CityMatrixCursor";
  private final Context c;
  private Dao<City, Integer> dao;
  private PreparedQuery<City> preparedQuery;
  private SelectArg queryArg;
  
  public CityMatrixCursor(String[] paramArrayOfString, Context paramContext)
  {
    super(COLUMNS);
    c = paramContext;
    paramArrayOfString = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    queryArg = new SelectArg();
    try
    {
      dao = paramArrayOfString.getCityDao();
      preparedQuery = dao.queryBuilder().limit(Long.valueOf(5L)).distinct().where().like("name", queryArg).prepare();
      return;
    }
    catch (SQLException paramArrayOfString) {}
  }
  
  private void convertAndAddRows(List<City> paramList)
  {
    int i = 0;
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      City localCity = (City)paramList.next();
      addRow(new Object[] { Integer.valueOf(i), name, state, Integer.valueOf(2130837838), "com.seeclickfix.actions.SEARCH_SELECTION", Integer.valueOf(id) });
      i += 1;
    }
  }
  
  private List<City> getPermissions(String paramString)
  {
    try
    {
      queryArg.setValue("%" + paramString + "%");
      paramString = dao.query(preparedQuery);
      return paramString;
    }
    catch (SQLException paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  public Cursor getSearchSuggestionCursor(String paramString)
  {
    convertAndAddRows(getPermissions(paramString));
    return this;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.CityMatrixCursor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */