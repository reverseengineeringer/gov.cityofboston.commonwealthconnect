package com.seeclickfix.ma.android.dialogs;

import android.view.View;
import android.view.View.OnClickListener;

class NamePlaceDialog$3
  implements View.OnClickListener
{
  NamePlaceDialog$3(NamePlaceDialog paramNamePlaceDialog) {}
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    i = this$0.getNameIdByButtonId(i);
    paramView = this$0.getString(i);
    NamePlaceDialog.access$000(this$0, paramView);
    this$0.dismiss();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.NamePlaceDialog.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */