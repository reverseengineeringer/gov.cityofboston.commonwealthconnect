package com.seeclickfix.ma.android.adapters;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.LightingColorFilter;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.android.volley.Request.Priority;
import com.android.volley.toolbox.ImageLoader;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.objects.zone.EnhancedWatchAreas;
import com.seeclickfix.ma.android.objects.zone.MobileButtonsWithDefaults;
import com.seeclickfix.ma.android.util.DisplayUtil;
import com.seeclickfix.ma.android.util.DisplayUtil.DENSITY;
import com.seeclickfix.ma.android.views.NetworkButton;
import com.seeclickfix.ma.android.views.ZoneButtonFactory;
import java.util.List;

public class ZoneBtnAdapter
  extends BaseAdapter
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ZoneBtnAdapter";
  private EnhancedWatchAreas area;
  private List<MobileButtonsWithDefaults> btnsParamObjects;
  private Context c;
  private String iconBaseUrl;
  View.OnClickListener localZoneBtnListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      if (zoneBtnListener != null) {
        zoneBtnListener.onClick(paramAnonymousView);
      }
    }
  };
  private ImageLoader mImageLoader;
  private View.OnClickListener zoneBtnListener;
  
  public ZoneBtnAdapter(Context paramContext, EnhancedWatchAreas paramEnhancedWatchAreas, List<MobileButtonsWithDefaults> paramList)
  {
    c = paramContext;
    area = paramEnhancedWatchAreas;
    btnsParamObjects = paramList;
    iconBaseUrl = getIconBaseUrl();
    mImageLoader = VolleyRequestQueue.getInstance(paramContext).getIconLoader();
    mImageLoader.setBatchedResponseDelay(0);
  }
  
  private String getIconBaseUrl()
  {
    DisplayUtil.DENSITY localDENSITY = DisplayUtil.getDensity();
    switch (localDENSITY)
    {
    default: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/36/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/96/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/72/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/48/";
    case ???: 
      return "http://cdn.seeclickfix.com/images/custom_buttons/36/";
    }
    return "http://cdn.seeclickfix.com/images/custom_buttons/28/";
  }
  
  private boolean isReportButton(MobileButtonsWithDefaults paramMobileButtonsWithDefaults)
  {
    return "scf://report".equalsIgnoreCase(paramMobileButtonsWithDefaults.getUri());
  }
  
  public int getCount()
  {
    return btnsParamObjects.size();
  }
  
  public Object getItem(int paramInt)
  {
    return btnsParamObjects.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    MobileButtonsWithDefaults localMobileButtonsWithDefaults = (MobileButtonsWithDefaults)btnsParamObjects.get(paramInt);
    LightingColorFilter localLightingColorFilter;
    if (paramView == null)
    {
      paramView = (NetworkButton)ViewUtil.inflate(c, 2130903064, paramViewGroup);
      paramView = ZoneButtonFactory.create(area, localMobileButtonsWithDefaults, paramView, c);
      paramView.setOnClickListener(localZoneBtnListener);
      paramView.setTag(localMobileButtonsWithDefaults);
      paramViewGroup = localMobileButtonsWithDefaults.getIcon();
      localLightingColorFilter = new LightingColorFilter(c.getResources().getColor(2131230754), 1);
      paramView.setTextColor(c.getResources().getColor(2131230754));
      if (!isReportButton(localMobileButtonsWithDefaults)) {
        break label156;
      }
      paramView.setDefaultImageResId(2130837789);
      paramView.setErrorImageResId(2130837789);
    }
    for (;;)
    {
      paramView.setFilter(localLightingColorFilter);
      return paramView;
      paramView = ZoneButtonFactory.create(area, localMobileButtonsWithDefaults, (NetworkButton)paramView, c);
      break;
      label156:
      if (paramViewGroup != null) {
        paramView.setImageUrl(iconBaseUrl + paramViewGroup, mImageLoader, Request.Priority.IMMEDIATE);
      } else {
        paramView.setImageUrl(null, mImageLoader, Request.Priority.LOW);
      }
    }
  }
  
  public void setZoneButtonListener(View.OnClickListener paramOnClickListener)
  {
    zoneBtnListener = paramOnClickListener;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.ZoneBtnAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */