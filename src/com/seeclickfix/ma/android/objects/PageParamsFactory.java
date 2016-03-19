package com.seeclickfix.ma.android.objects;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcelable;
import com.seeclickfix.ma.android.fragments.FeedFrag;
import com.seeclickfix.ma.android.fragments.MeFrag;
import com.seeclickfix.ma.android.fragments.PlacesFrag;
import com.seeclickfix.ma.android.fragments.ReportFragment;
import com.seeclickfix.ma.android.objects.loc.Place;

public class PageParamsFactory
{
  public static PageParams getFeedParams(Context paramContext)
  {
    paramContext = paramContext.getResources().getString(2131492982);
    PageParams localPageParams = new PageParams();
    localPageParams.setDisplayName(paramContext);
    localPageParams.setFragClass(FeedFrag.class);
    localPageParams.setTag("FragmentTags.FEED");
    localPageParams.setParcelName("place_bundle");
    localPageParams.setIconResId(2130837742);
    return localPageParams;
  }
  
  public static PageParams getFeedParamsForList(Context paramContext, Place paramPlace, String paramString, int paramInt)
  {
    paramContext = getFeedParams(paramContext);
    paramContext.setActionExtra(paramString);
    paramContext.setParcel(paramPlace);
    paramContext.setScrollPosition(paramInt);
    return paramContext;
  }
  
  public static PageParams getMePageParams(Context paramContext)
  {
    paramContext = paramContext.getResources().getString(2131493051);
    PageParams localPageParams = new PageParams();
    localPageParams.setDisplayName(paramContext);
    localPageParams.setFragClass(MeFrag.class);
    localPageParams.setTag("FragmentTags.ME");
    localPageParams.setMe(true);
    localPageParams.setIconResId(2130837745);
    return localPageParams;
  }
  
  public static PageParams getMyCommentsParams(Context paramContext)
  {
    Object localObject = paramContext.getResources().getString(2131493073);
    paramContext = new PageParams();
    paramContext.setDisplayName((String)localObject);
    paramContext.setFragClass(FeedFrag.class);
    paramContext.setTag("FragmentTags:MY_COMMENTS");
    paramContext.setSubitem(true);
    localObject = new Place();
    ((Place)localObject).setApiId(-3);
    ((Place)localObject).setMyComments(true);
    paramContext.setParcel((Parcelable)localObject);
    return paramContext;
  }
  
  public static PageParams getMyReportParams(Context paramContext)
  {
    Object localObject = paramContext.getResources().getString(2131493074);
    paramContext = new PageParams();
    paramContext.setDisplayName((String)localObject);
    paramContext.setFragClass(FeedFrag.class);
    paramContext.setTag("FragmentTags:MY_REPORTS");
    paramContext.setSubitem(true);
    localObject = new Place();
    ((Place)localObject).setApiId(-2);
    ((Place)localObject).setMyReports(true);
    paramContext.setParcel((Parcelable)localObject);
    return paramContext;
  }
  
  public static PageParams getPlacesParams(Context paramContext)
  {
    paramContext = paramContext.getResources().getString(2131493009);
    PageParams localPageParams = new PageParams();
    localPageParams.setDisplayName(paramContext);
    localPageParams.setFragClass(PlacesFrag.class);
    localPageParams.setTag("FragmentTags.PLACES");
    localPageParams.setIconResId(2130837835);
    return localPageParams;
  }
  
  public static PageParams getReportParams(Context paramContext)
  {
    paramContext = paramContext.getResources().getString(2131493162);
    PageParams localPageParams = new PageParams();
    localPageParams.setDisplayName(paramContext);
    localPageParams.setFragClass(ReportFragment.class);
    localPageParams.setTag("FragmentTags.REPORT");
    localPageParams.setParcelName("report_bundle");
    localPageParams.setIconResId(2130837791);
    return localPageParams;
  }
  
  public static PageParams getReportParamsWithAction(Context paramContext, String paramString)
  {
    paramContext = getReportParams(paramContext);
    paramContext.setActionExtra(paramString);
    return paramContext;
  }
  
  public static PageParams getReportParamsWithParcel(Context paramContext, Parcelable paramParcelable)
  {
    paramContext = getReportParams(paramContext);
    paramContext.setParcel(paramParcelable);
    return paramContext;
  }
  
  public static PageParams getResetParams()
  {
    PageParams localPageParams = new PageParams();
    localPageParams.setActionExtra("com.seeclickfix.actions.RESET_PAGER");
    return localPageParams;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.PageParamsFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */