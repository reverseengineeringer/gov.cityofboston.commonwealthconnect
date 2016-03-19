package com.seeclickfix.ma.android.adapters;

import android.content.Context;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.auth.ProfileController;
import com.seeclickfix.ma.android.db.OrmDbHelper;
import com.seeclickfix.ma.android.fragments.FeedFrag;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.PageParamsFactory;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.user.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public class MenuAdapter
  extends BaseAdapter
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "MenuAdapter";
  private Context c;
  private ImageLoader.ImageContainer container;
  private List<PageParams> pageParamsList = new ArrayList();
  private User user;
  
  public MenuAdapter(Context paramContext)
  {
    c = paramContext;
    pageParamsList = getPageParams();
  }
  
  private List<PageParams> getPageParams()
  {
    Object localObject = PageParamsFactory.getMePageParams(c);
    PageParams localPageParams1 = PageParamsFactory.getMyReportParams(c);
    PageParams localPageParams2 = PageParamsFactory.getMyCommentsParams(c);
    PageParams localPageParams3 = PageParamsFactory.getReportParams(c);
    PageParams localPageParams4 = PageParamsFactory.getFeedParams(c);
    PageParams localPageParams5 = PageParamsFactory.getPlacesParams(c);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(localObject);
    localArrayList.add(localPageParams1);
    localArrayList.add(localPageParams2);
    localArrayList.add(localPageParams3);
    localArrayList.add(localPageParams4);
    localArrayList.add(localPageParams5);
    localObject = getPagesFromDb();
    if (((List)localObject).size() > 0) {
      localArrayList.addAll((Collection)localObject);
    }
    return localArrayList;
  }
  
  private List<PageParams> getPagesFromDb()
  {
    Object localObject2 = getPlaceDao();
    Object localObject1 = null;
    ArrayList localArrayList = new ArrayList();
    try
    {
      localObject2 = ((Dao)localObject2).queryForEq("selected", Boolean.valueOf(true));
      localObject1 = localObject2;
    }
    catch (Exception localException)
    {
      int i;
      for (;;) {}
    }
    if ((localObject1 != null) && (((List)localObject1).size() > 0))
    {
      i = 3;
      localObject1 = ((List)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (Place)((Iterator)localObject1).next();
        if (((Place)localObject2).getApiId() != -1)
        {
          PageParams localPageParams = new PageParams();
          localPageParams.setDisplayName(((Place)localObject2).getName());
          localPageParams.setFragClass(FeedFrag.class);
          localPageParams.setTag("FragmentTags.ISUSE_LIST" + ((Place)localObject2).getName());
          localPageParams.setParcel((Parcelable)localObject2);
          localPageParams.setParcelName("place_bundle");
          i += 1;
          localPageParams.setPagePosition(i);
          localPageParams.setSubitem(true);
          localArrayList.add(localPageParams);
        }
      }
    }
    return localArrayList;
  }
  
  private Dao<Place, Integer> getPlaceDao()
  {
    Object localObject = (OrmDbHelper)OpenHelperManager.getHelper(c, OrmDbHelper.class);
    try
    {
      localObject = ((OrmDbHelper)localObject).getPlaceDao();
      return (Dao<Place, Integer>)localObject;
    }
    catch (SQLException localSQLException) {}
    return null;
  }
  
  private void resetPositions()
  {
    int i = 0;
    while (i < pageParamsList.size())
    {
      ((PageParams)pageParamsList.get(i)).setPagePosition(i);
      i += 1;
    }
  }
  
  public int addItem(PageParams paramPageParams)
  {
    int i = pageParamsList.size();
    paramPageParams.setPagePosition(i);
    pageParamsList.add(paramPageParams);
    notifyDataSetChanged();
    return i;
  }
  
  public int getCount()
  {
    return pageParamsList.size();
  }
  
  public Object getItem(int paramInt)
  {
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public List<PageParams> getPageParamsList()
  {
    return pageParamsList;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    PageParams localPageParams = (PageParams)pageParamsList.get(paramInt);
    if (localPageParams.isSubitem())
    {
      paramView = ViewUtil.inflate(c, 2130903077, paramViewGroup);
      ((TextView)paramView.findViewById(2131361884)).setText(localPageParams.getDisplayName());
      paramViewGroup = localPageParams;
    }
    for (;;)
    {
      paramView.setTag(paramViewGroup);
      return paramView;
      if (localPageParams.isMe())
      {
        paramView = ViewUtil.inflate(c, 2130903076, paramViewGroup);
        paramViewGroup = (ImageView)paramView.findViewById(2131361883);
        TextView localTextView2 = (TextView)paramView.findViewById(2131361884);
        TextView localTextView1 = (TextView)paramView.findViewById(2131361886);
        if (user != null)
        {
          localTextView2.setText(user.getName());
          localTextView1.setVisibility(0);
          localTextView1.setText(user.getWittyTitle());
          localPageParams.setDisplayName(user.getName());
          ProfileController.getInstance().setUserAvatar(c, paramViewGroup, 2130837745);
          paramViewGroup = localPageParams;
        }
        else
        {
          paramViewGroup.setImageResource(2130837745);
          localTextView2.setText(2131493051);
          paramViewGroup = PageParamsFactory.getMePageParams(c);
          localTextView1.setVisibility(8);
        }
      }
      else
      {
        paramView = ViewUtil.inflate(c, 2130903075, paramViewGroup);
        ((ImageView)paramView.findViewById(2131361883)).setImageResource(localPageParams.getIconResId());
        ((TextView)paramView.findViewById(2131361884)).setText(localPageParams.getDisplayName());
        paramViewGroup = localPageParams;
      }
    }
  }
  
  public void notifyDataSetChanged()
  {
    pageParamsList = getPageParams();
    super.notifyDataSetChanged();
  }
  
  public Object removeItem(PageParams paramPageParams)
  {
    paramPageParams = paramPageParams.getDisplayName();
    Iterator localIterator = pageParamsList.iterator();
    while (localIterator.hasNext())
    {
      PageParams localPageParams = (PageParams)localIterator.next();
      if (localPageParams.getDisplayName().equals(paramPageParams))
      {
        pageParamsList.remove(localPageParams);
        resetPositions();
        notifyDataSetChanged();
        return localPageParams;
      }
    }
    return null;
  }
  
  public void setPageParamsList(List<PageParams> paramList)
  {
    pageParamsList = paramList;
  }
  
  public void setUserProfile(User paramUser)
  {
    user = paramUser;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.MenuAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */