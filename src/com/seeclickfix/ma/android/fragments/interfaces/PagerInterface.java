package com.seeclickfix.ma.android.fragments.interfaces;

import android.view.View;
import android.view.ViewGroup;
import com.seeclickfix.ma.android.objects.loc.Place;

public abstract interface PagerInterface
  extends OnPlaceAddedListener
{
  public abstract void clearFooterContainer();
  
  public abstract ViewGroup getButtonContainer();
  
  public abstract ViewGroup getFooterContainer();
  
  public abstract void setCurrentPage(int paramInt);
  
  public abstract void setPageByPlace(Place paramPlace);
  
  public abstract void showCustomButton(View paramView);
  
  public abstract void showCustomFooter(ViewGroup paramViewGroup);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.interfaces.PagerInterface
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */