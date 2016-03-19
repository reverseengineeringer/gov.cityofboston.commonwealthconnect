package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.Patterns;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.seeclickfix.ma.android.auth.LoginStateController;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.net.RegistrationRequest;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.objects.user.UserError;
import com.seeclickfix.ma.android.objects.user.UserReg;
import com.seeclickfix.ma.android.util.FormUtil;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegisterFrag
  extends BaseFrag
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "RegisterFrag";
  private Context c;
  private CheckBox checkbox;
  TextView.OnEditorActionListener doneListener = new TextView.OnEditorActionListener()
  {
    public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
    {
      if ((paramAnonymousInt == 6) || (paramAnonymousInt == 5))
      {
        FormUtil.hideKeyboard(paramAnonymousTextView);
        return true;
      }
      return false;
    }
  };
  private EditText emailEditText;
  private List<TextView> inputFields;
  private EditText nameEditText;
  private EditText pwd2EditText;
  private EditText pwdEditText;
  private TextView statusText;
  private Button submitBtn;
  View.OnClickListener submitBtnListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      if (RegisterFrag.this.validate())
      {
        FormUtil.hideKeyboard(paramAnonymousView);
        RegisterFrag.this.sendRegistration();
      }
    }
  };
  private UserReg userRegInputObj;
  
  private boolean isValidEmail(String paramString)
  {
    return Patterns.EMAIL_ADDRESS.matcher(paramString).matches();
  }
  
  private void sendRegistration()
  {
    userRegInputObj.setName(nameEditText.getText().toString());
    userRegInputObj.setEmail(emailEditText.getText().toString());
    userRegInputObj.setPassword(pwdEditText.getText().toString());
    userRegInputObj.setPasswordConfirm(pwd2EditText.getText().toString());
    userRegInputObj.setAcceptedTerms(checkbox.isChecked());
    UserReg localUserReg = new UserReg(userRegInputObj);
    ((ProgressBar)rootFrag.findViewById(2131362020)).setVisibility(0);
    submitBtn.setVisibility(8);
    new AsyncTask()
    {
      protected AuthUser doInBackground(UserReg... paramAnonymousVarArgs)
      {
        if (getActivity() == null) {
          return null;
        }
        Object localObject = new RegistrationRequest(paramAnonymousVarArgs[0], c);
        paramAnonymousVarArgs = ((RegistrationRequest)localObject).connect();
        if (((RegistrationRequest)localObject).wasSuccessful()) {
          paramAnonymousVarArgs = new DeserializeResponse().getJavaObject(paramAnonymousVarArgs, AuthUser.class);
        }
        try
        {
          paramAnonymousVarArgs = (AuthUser)paramAnonymousVarArgs.get(0);
          return paramAnonymousVarArgs;
        }
        catch (Exception paramAnonymousVarArgs) {}
        localObject = new AuthUser();
        try
        {
          ((AuthUser)localObject).setResponse(((UserError)new DeserializeResponse().getJavaObject(paramAnonymousVarArgs, UserError.class).get(0)).getAllErrors(c.getString(2131492977), c.getResources()));
          return (AuthUser)localObject;
        }
        catch (Exception paramAnonymousVarArgs)
        {
          ((AuthUser)localObject).setResponse(c.getString(2131492977));
          return (AuthUser)localObject;
        }
        return null;
      }
      
      protected void onPostExecute(AuthUser paramAnonymousAuthUser)
      {
        if (getActivity() == null) {
          return;
        }
        ((ProgressBar)rootFrag.findViewById(2131362020)).setVisibility(8);
        if (paramAnonymousAuthUser == null)
        {
          paramAnonymousAuthUser = new AuthUser();
          paramAnonymousAuthUser.setResponse(getString(2131492981));
          fail(paramAnonymousAuthUser);
          return;
        }
        if (paramAnonymousAuthUser.isAuthenticated())
        {
          success(paramAnonymousAuthUser);
          return;
        }
        fail(paramAnonymousAuthUser);
      }
    }.execute(new UserReg[] { localUserReg });
  }
  
  private void setListeners()
  {
    submitBtn.setOnClickListener(submitBtnListener);
    pwd2EditText.setOnEditorActionListener(doneListener);
  }
  
  private void setReferences()
  {
    checkbox = ((CheckBox)rootFrag.findViewById(2131362017));
    submitBtn = ((Button)rootFrag.findViewById(2131362021));
    pwd2EditText = ((EditText)rootFrag.findViewById(2131362016));
    pwdEditText = ((EditText)rootFrag.findViewById(2131362015));
    emailEditText = ((EditText)rootFrag.findViewById(2131362014));
    nameEditText = ((EditText)rootFrag.findViewById(2131362013));
    statusText = ((TextView)rootFrag.findViewById(2131362019));
    inputFields = new ArrayList();
    inputFields.add(emailEditText);
    inputFields.add(pwdEditText);
    inputFields.add(pwd2EditText);
    inputFields.add(nameEditText);
  }
  
  private void showIncompleteMessage(View paramView)
  {
    statusText.setVisibility(0);
    paramView = getString(2131493090, new Object[] { paramView.getTag() });
    statusText.setText(paramView);
  }
  
  private boolean validate()
  {
    Object localObject1 = inputFields.iterator();
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (TextView)((Iterator)localObject1).next();
      if ((((TextView)localObject2).getText() == null) || (((TextView)localObject2).getText().length() == 0))
      {
        showIncompleteMessage((View)localObject2);
        return false;
      }
    }
    localObject1 = emailEditText.getText().toString();
    Object localObject2 = pwdEditText.getText().toString();
    String str = pwd2EditText.getText().toString();
    if ((((String)localObject2).length() > 40) || (((String)localObject2).length() < 4))
    {
      statusText.setVisibility(0);
      statusText.setText(2131493087);
      return false;
    }
    if (!((String)localObject2).equals(str))
    {
      statusText.setVisibility(0);
      statusText.setText(2131493088);
      return false;
    }
    if (!checkbox.isChecked())
    {
      statusText.setVisibility(0);
      statusText.setText(2131493089);
      return false;
    }
    if (!isValidEmail((String)localObject1))
    {
      statusText.setVisibility(0);
      statusText.setText(2131493086);
      return false;
    }
    statusText.setVisibility(8);
    return true;
  }
  
  protected void fail(AuthUser paramAuthUser)
  {
    statusText.setText(paramAuthUser.getResponse());
    statusText.setVisibility(0);
    submitBtn.setVisibility(0);
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    c = getActivity().getApplicationContext();
    userRegInputObj = new UserReg();
    setReferences();
    setListeners();
    getSherlockActivity().getSupportActionBar().setTitle(2131493091);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903092, paramViewGroup, false));
    return rootFrag;
  }
  
  protected void success(AuthUser paramAuthUser)
  {
    LoginStateController localLoginStateController = LoginStateController.getInstance();
    PageParams localPageParams = localLoginStateController.getOnAuthCompleteParams();
    if ((localPageParams == null) || (localPageParams.getActionExtra() == null) || ((!"com.seeclickfix.actions.STARTUP_LOGIN_PROMPT".equals(localPageParams.getActionExtra())) && (!"com.seeclickfix.actions.SHOW_ME_FRAG".equals(localPageParams.getActionExtra()))))
    {
      int i = getActivity().getSupportFragmentManager().getBackStackEntryCount();
      getActivity().getSupportFragmentManager().getBackStackEntryAt(i - 1);
      getActivity().getSupportFragmentManager().getBackStackEntryAt(i - 2);
      getActivity().getSupportFragmentManager().popBackStackImmediate(i - 2, 1);
    }
    localLoginStateController.dispatchLoginEvent(paramAuthUser);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.RegisterFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */