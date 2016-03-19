package com.seeclickfix.ma.android.providers;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.database.Cursor;
import android.net.Uri;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.db.CityMatrixCursor;

public class DataProvider
  extends ContentProvider
{
  public static final String AUTHORITY = ".providers.DataProvider";
  private static final boolean D = false;
  private static final int GET_CITY = 1;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final int SEARCH_CITIES = 0;
  private static final int SEARCH_SUGGEST = 2;
  public static final String SEARCH_TABLE = "search";
  private static final String TAG = "DataProvider";
  private static CityMatrixCursor matrixCursor = null;
  private static Uri searchCitiesUri;
  private static UriMatcher uriMatcher;
  
  protected static UriMatcher buildUriMatcher(Context paramContext)
  {
    UriMatcher localUriMatcher = new UriMatcher(-1);
    paramContext = getAuthorityUri(paramContext);
    localUriMatcher.addURI(paramContext, "search", 0);
    localUriMatcher.addURI(paramContext, "search/#", 1);
    localUriMatcher.addURI(paramContext, "search_suggest_query", 2);
    localUriMatcher.addURI(paramContext, "search_suggest_query/*", 2);
    return localUriMatcher;
  }
  
  protected static String getAuthorityUri(Context paramContext)
  {
    paramContext = AppBuild.getPackageName(paramContext);
    return paramContext + ".providers.DataProvider";
  }
  
  public static Uri getSearchCitiesUri(Context paramContext)
  {
    searchCitiesUri = Uri.parse("content://" + getAuthorityUri(paramContext) + "/" + "search_suggest_query");
    return searchCitiesUri;
  }
  
  public static void initCursor(Context paramContext)
  {
    matrixCursor = new CityMatrixCursor(null, paramContext);
  }
  
  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    throw new UnsupportedOperationException();
  }
  
  public String getType(Uri paramUri)
  {
    return null;
  }
  
  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean onCreate()
  {
    uriMatcher = buildUriMatcher(getContext());
    return true;
  }
  
  public Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    if (uriMatcher == null) {
      buildUriMatcher(getContext());
    }
    paramArrayOfString1 = new CityMatrixCursor(null, getContext());
    switch (uriMatcher.match(paramUri))
    {
    default: 
      throw new IllegalArgumentException("Unknown Uri: " + paramUri);
    case 2: 
      paramArrayOfString1.getSearchSuggestionCursor(paramUri.getLastPathSegment());
    }
    return paramArrayOfString1;
  }
  
  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.providers.DataProvider
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */