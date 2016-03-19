package com.seeclickfix.ma.android.adapters;

import android.content.Context;
import android.database.Cursor;
import android.support.v4.widget.CursorAdapter;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FilterQueryProvider;
import android.widget.Filterable;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.j256.ormlite.android.AndroidDatabaseResults;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.CloseableIterator;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.PreparedQuery;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.db.OrmDbHelper;
import com.seeclickfix.ma.android.objects.loc.City;
import com.seeclickfix.ma.android.style.StyleUtil;
import java.sql.SQLException;

public class CityCursorAdapter
  extends CursorAdapter
  implements Filterable
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "CityCursorAdapter";
  private CharSequence constraint;
  private Dao<City, Integer> dao;
  
  public CityCursorAdapter(Context paramContext, Cursor paramCursor, int paramInt)
  {
    super(paramContext, paramCursor, paramInt);
    paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    try
    {
      dao = paramContext.getCityDao();
      return;
    }
    catch (SQLException paramContext) {}
  }
  
  private Cursor getOrmCursor(String paramString)
  {
    try
    {
      paramString = getPreparedQuery(paramString);
      paramString = ((AndroidDatabaseResults)dao.iterator(paramString).getRawResults()).getRawCursor();
      return paramString;
    }
    catch (SQLException paramString) {}
    return null;
  }
  
  private PreparedQuery<City> getPreparedQuery(String paramString)
  {
    try
    {
      QueryBuilder localQueryBuilder = dao.queryBuilder();
      localQueryBuilder.where().like("name", paramString);
      paramString = localQueryBuilder.prepare();
      return paramString;
    }
    catch (SQLException paramString) {}
    return null;
  }
  
  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    TextView localTextView = (TextView)paramView.findViewById(2131362113);
    PreparedQuery localPreparedQuery = getPreparedQuery("");
    Object localObject = null;
    try
    {
      paramCursor = (City)localPreparedQuery.mapRow(new AndroidDatabaseResults(paramCursor, null));
      if (constraint != null)
      {
        int i = Math.min(name.length(), constraint.length());
        StyleUtil.setTwoColorsBoldTextStrings(new String(name.substring(0, i)), new String(name.substring(i) + ", " + state), localTextView, paramContext, -16777216, -12303292);
      }
      paramView.setTag(paramCursor);
      return;
    }
    catch (SQLException paramCursor)
    {
      for (;;)
      {
        paramCursor = (Cursor)localObject;
      }
    }
  }
  
  public FilterQueryProvider getFilterQueryProvider()
  {
    return super.getFilterQueryProvider();
  }
  
  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    return ViewUtil.inflate(paramContext, 2130903122, paramViewGroup);
  }
  
  public Cursor runQueryOnBackgroundThread(CharSequence paramCharSequence)
  {
    constraint = paramCharSequence;
    if (getFilterQueryProvider() != null) {
      return getFilterQueryProvider().runQuery(paramCharSequence);
    }
    String str = "";
    if (paramCharSequence != null) {
      str = paramCharSequence.toString() + "%";
    }
    return getOrmCursor(str);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.CityCursorAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */