package com.seeclickfix.ma.android.fragments;

import android.os.AsyncTask;
import com.seeclickfix.ma.android.net.ForgotPasswordRequest;
import com.seeclickfix.ma.android.views.ToastFactory;

class LoginFrag$4
  extends AsyncTask<String, Void, String>
{
  LoginFrag$4(LoginFrag paramLoginFrag, String paramString) {}
  
  protected String doInBackground(String... paramVarArgs)
  {
    return new ForgotPasswordRequest(paramVarArgs[0], LoginFrag.access$200(this$0)).sendEmail();
  }
  
  protected void onPostExecute(String paramString)
  {
    if (this$0.getActivity() == null) {
      return;
    }
    ToastFactory.showCenteredShortToast(this$0.getActivity(), this$0.resultForgotPassword(paramString, val$emailString));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.LoginFrag.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */