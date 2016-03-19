package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.os.AsyncTask;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.net.RegistrationRequest;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.objects.user.UserError;
import com.seeclickfix.ma.android.objects.user.UserReg;
import java.util.List;

class RegisterFrag$2
  extends AsyncTask<UserReg, Void, AuthUser>
{
  RegisterFrag$2(RegisterFrag paramRegisterFrag) {}
  
  protected AuthUser doInBackground(UserReg... paramVarArgs)
  {
    if (this$0.getActivity() == null) {
      return null;
    }
    Object localObject = new RegistrationRequest(paramVarArgs[0], RegisterFrag.access$200(this$0));
    paramVarArgs = ((RegistrationRequest)localObject).connect();
    if (((RegistrationRequest)localObject).wasSuccessful()) {
      paramVarArgs = new DeserializeResponse().getJavaObject(paramVarArgs, AuthUser.class);
    }
    try
    {
      paramVarArgs = (AuthUser)paramVarArgs.get(0);
      return paramVarArgs;
    }
    catch (Exception paramVarArgs) {}
    localObject = new AuthUser();
    try
    {
      ((AuthUser)localObject).setResponse(((UserError)new DeserializeResponse().getJavaObject(paramVarArgs, UserError.class).get(0)).getAllErrors(RegisterFrag.access$200(this$0).getString(2131492977), RegisterFrag.access$200(this$0).getResources()));
      return (AuthUser)localObject;
    }
    catch (Exception paramVarArgs)
    {
      ((AuthUser)localObject).setResponse(RegisterFrag.access$200(this$0).getString(2131492977));
      return (AuthUser)localObject;
    }
    return null;
  }
  
  protected void onPostExecute(AuthUser paramAuthUser)
  {
    if (this$0.getActivity() == null) {
      return;
    }
    ((ProgressBar)RegisterFrag.access$300(this$0).findViewById(2131362020)).setVisibility(8);
    if (paramAuthUser == null)
    {
      paramAuthUser = new AuthUser();
      paramAuthUser.setResponse(this$0.getString(2131492981));
      this$0.fail(paramAuthUser);
      return;
    }
    if (paramAuthUser.isAuthenticated())
    {
      this$0.success(paramAuthUser);
      return;
    }
    this$0.fail(paramAuthUser);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.RegisterFrag.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */