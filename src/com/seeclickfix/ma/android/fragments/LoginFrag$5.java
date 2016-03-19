package com.seeclickfix.ma.android.fragments;

import android.os.AsyncTask;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import com.seeclickfix.ma.android.net.LoginRequest;
import com.seeclickfix.ma.android.objects.user.AuthUser;

class LoginFrag$5
  extends AsyncTask<String, Void, AuthUser>
{
  LoginFrag$5(LoginFrag paramLoginFrag) {}
  
  protected AuthUser doInBackground(String... paramVarArgs)
  {
    return new LoginRequest(paramVarArgs[0], paramVarArgs[1], LoginFrag.access$200(this$0)).authenticate();
  }
  
  protected void onPostExecute(AuthUser paramAuthUser)
  {
    if (this$0.getActivity() == null) {
      return;
    }
    ((ProgressBar)LoginFrag.access$300(this$0).findViewById(2131361966)).setVisibility(8);
    if (paramAuthUser.isAuthenticated())
    {
      this$0.success(paramAuthUser);
      return;
    }
    this$0.fail(paramAuthUser);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.LoginFrag.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */