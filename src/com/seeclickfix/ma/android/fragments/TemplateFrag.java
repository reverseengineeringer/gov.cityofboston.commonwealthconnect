package com.seeclickfix.ma.android.fragments;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;

public class TemplateFrag
  extends BaseFrag
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "...";
  private Context c;
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    c = getActivity().getApplicationContext();
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903061, paramViewGroup, false));
    return rootFrag;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
  }
  
  public void onDetach()
  {
    super.onDetach();
  }
  
  public void onResume()
  {
    super.onResume();
  }
  
  public void onStart()
  {
    super.onStart();
  }
  
  public void onStop()
  {
    super.onStop();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.TemplateFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */