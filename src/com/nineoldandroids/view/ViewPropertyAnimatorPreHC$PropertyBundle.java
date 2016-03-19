package com.nineoldandroids.view;

import java.util.ArrayList;

class ViewPropertyAnimatorPreHC$PropertyBundle
{
  ArrayList<ViewPropertyAnimatorPreHC.NameValuesHolder> mNameValuesHolder;
  int mPropertyMask;
  
  ViewPropertyAnimatorPreHC$PropertyBundle(int paramInt, ArrayList<ViewPropertyAnimatorPreHC.NameValuesHolder> paramArrayList)
  {
    mPropertyMask = paramInt;
    mNameValuesHolder = paramArrayList;
  }
  
  boolean cancel(int paramInt)
  {
    if (((mPropertyMask & paramInt) != 0) && (mNameValuesHolder != null))
    {
      int j = mNameValuesHolder.size();
      int i = 0;
      while (i < j)
      {
        if (mNameValuesHolder.get(i)).mNameConstant == paramInt)
        {
          mNameValuesHolder.remove(i);
          mPropertyMask &= (paramInt ^ 0xFFFFFFFF);
          return true;
        }
        i += 1;
      }
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.view.ViewPropertyAnimatorPreHC.PropertyBundle
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */