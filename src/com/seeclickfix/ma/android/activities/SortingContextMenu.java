package com.seeclickfix.ma.android.activities;

import android.app.ListActivity;
import android.content.res.Resources;
import android.os.Bundle;
import android.widget.ArrayAdapter;

public class SortingContextMenu
  extends ListActivity
{
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setListAdapter(new ArrayAdapter(this, 17367043, getResources().getStringArray(2131099649)));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.activities.SortingContextMenu
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */