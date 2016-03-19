package com.seeclickfix.ma.android.fragments;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.seeclickfix.ma.android.auth.LoginStateController;
import com.seeclickfix.ma.android.dagger.GraphProvider;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.HomeButtonsInterface;
import com.seeclickfix.ma.android.fragments.interfaces.OnBackKeyListener;
import com.seeclickfix.ma.android.net.ForgotPasswordRequest;
import com.seeclickfix.ma.android.net.LoginRequest;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.util.FormUtil;
import com.seeclickfix.ma.android.views.ToastFactory;
import dagger.ObjectGraph;
import javax.inject.Inject;

public class LoginFrag
  extends BaseFrag
  implements OnBackKeyListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "LoginFrag";
  private Context c;
  TextView.OnEditorActionListener doneListener = new TextView.OnEditorActionListener()
  {
    public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
    {
      if (paramAnonymousInt == 6)
      {
        FormUtil.hideKeyboard(paramAnonymousTextView);
        LoginFrag.this.doLogin();
        return true;
      }
      return false;
    }
  };
  private TextView forgotPwdBtn;
  private Button loginBtn;
  @Inject
  AccountManager mAccountManager;
  @InjectView(2131361969)
  Button skipButton;
  
  private void doForgotPassword()
  {
    final String str = ((AutoCompleteTextView)rootFrag.findViewById(2131361962)).getText().toString();
    if (str.equals(""))
    {
      ToastFactory.showCenteredShortToast(getActivity(), 2131493031);
      return;
    }
    new AsyncTask()
    {
      protected String doInBackground(String... paramAnonymousVarArgs)
      {
        return new ForgotPasswordRequest(paramAnonymousVarArgs[0], c).sendEmail();
      }
      
      protected void onPostExecute(String paramAnonymousString)
      {
        if (getActivity() == null) {
          return;
        }
        ToastFactory.showCenteredShortToast(getActivity(), resultForgotPassword(paramAnonymousString, str));
      }
    }.execute(new String[] { str });
  }
  
  private void doLogin()
  {
    ((ProgressBar)rootFrag.findViewById(2131361966)).setVisibility(0);
    loginBtn.setVisibility(8);
    Object localObject2 = (AutoCompleteTextView)rootFrag.findViewById(2131361962);
    Object localObject1 = (EditText)rootFrag.findViewById(2131361963);
    localObject2 = ((AutoCompleteTextView)localObject2).getText().toString();
    localObject1 = ((EditText)localObject1).getText().toString();
    ((TextView)rootFrag.findViewById(2131361967)).setVisibility(8);
    new AsyncTask()
    {
      protected AuthUser doInBackground(String... paramAnonymousVarArgs)
      {
        return new LoginRequest(paramAnonymousVarArgs[0], paramAnonymousVarArgs[1], c).authenticate();
      }
      
      protected void onPostExecute(AuthUser paramAnonymousAuthUser)
      {
        if (getActivity() == null) {
          return;
        }
        ((ProgressBar)rootFrag.findViewById(2131361966)).setVisibility(8);
        if (paramAnonymousAuthUser.isAuthenticated())
        {
          success(paramAnonymousAuthUser);
          return;
        }
        fail(paramAnonymousAuthUser);
      }
    }.execute(new String[] { localObject2, localObject1 });
  }
  
  private boolean mustHandleResume(PageParams paramPageParams)
  {
    paramPageParams = paramPageParams.getActionExtra();
    return (!"com.seeclickfix.actions.STARTUP_LOGIN_PROMPT".equals(paramPageParams)) && (!"com.seeclickfix.actions.SHOW_ME_FRAG".equals(paramPageParams));
  }
  
  private void setupAutoComplete()
  {
    AutoCompleteTextView localAutoCompleteTextView = (AutoCompleteTextView)rootFrag.findViewById(2131361962);
    Account[] arrayOfAccount = mAccountManager.getAccounts();
    String[] arrayOfString = new String[arrayOfAccount.length];
    int i = 0;
    while (i < arrayOfAccount.length)
    {
      arrayOfString[i] = name;
      i += 1;
    }
    localAutoCompleteTextView.setAdapter(new ArrayAdapter(getActivity(), 17367050, arrayOfString));
    localAutoCompleteTextView.setThreshold(1);
  }
  
  protected void fail(AuthUser paramAuthUser)
  {
    TextView localTextView = (TextView)rootFrag.findViewById(2131361967);
    localTextView.setVisibility(0);
    localTextView.setText(paramAuthUser.getResponse());
    loginBtn.setVisibility(0);
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    c = getActivity().getApplicationContext();
    ((GraphProvider)getActivity()).getObjectGraph().inject(this);
  }
  
  public PageParams onBackKey()
  {
    LoginStateController.getInstance().resetLoginState();
    return null;
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903087, paramViewGroup, false));
    ButterKnife.inject(this, rootFrag);
    return rootFrag;
  }
  
  public void onResume()
  {
    super.onResume();
    PageParams localPageParams = (PageParams)getArguments().getParcelable("page_params");
    ((Button)rootFrag.findViewById(2131361968)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ((HomeButtonsInterface)getActivity()).onClickButton(15, null);
      }
    });
    getSherlockActivity().getSupportActionBar().setTitle(2131493035);
    loginBtn = ((Button)rootFrag.findViewById(2131361964));
    loginBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        FormUtil.hideKeyboard(paramAnonymousView);
        LoginFrag.this.doLogin();
      }
    });
    loginBtn.setVisibility(0);
    forgotPwdBtn = ((TextView)rootFrag.findViewById(2131361965));
    forgotPwdBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        FormUtil.hideKeyboard(paramAnonymousView);
        LoginFrag.this.doForgotPassword();
      }
    });
    ((EditText)rootFrag.findViewById(2131361963)).setOnEditorActionListener(doneListener);
    setupAutoComplete();
    if ("com.seeclickfix.actions.STARTUP_LOGIN_PROMPT".equals(localPageParams.getActionExtra())) {
      skipButton.setVisibility(0);
    }
  }
  
  protected String resultForgotPassword(String paramString1, String paramString2)
  {
    if (new JsonParser().parse(paramString1).getAsJsonObject().get("success").getAsBoolean()) {
      return getString(2131493032);
    }
    return getString(2131493030, new Object[] { paramString2 });
  }
  
  @OnClick({2131361969})
  void skipLogin()
  {
    LoginStateController.getInstance().dispatchLoginSkipEvent();
  }
  
  protected void success(AuthUser paramAuthUser)
  {
    ToastFactory.showCenteredShortToast(getActivity(), 2131493037);
    LoginStateController localLoginStateController = LoginStateController.getInstance();
    PageParams localPageParams = localLoginStateController.getOnAuthCompleteParams();
    if ((localPageParams == null) || (mustHandleResume(localPageParams))) {
      getActivity().getSupportFragmentManager().popBackStack();
    }
    localLoginStateController.dispatchLoginEvent(paramAuthUser);
  }
  
  public boolean willHandleBackKey()
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.LoginFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */