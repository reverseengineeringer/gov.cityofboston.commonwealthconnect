package com.seeclickfix.ma.android.fragments;

import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.seeclickfix.ma.android.db.OrmDbHelper;
import com.seeclickfix.ma.android.views.ToastFactory;

class AboutFrag$4
  implements Runnable
{
  AboutFrag$4(AboutFrag paramAboutFrag) {}
  
  public void run()
  {
    ((OrmDbHelper)OpenHelperManager.getHelper(AboutFrag.access$100(this$0), OrmDbHelper.class)).getWritableDatabase();
    ToastFactory.showCenteredShortToast(AboutFrag.access$100(this$0), "Created new database.");
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.AboutFrag.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */