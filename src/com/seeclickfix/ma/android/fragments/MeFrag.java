package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.auth.LoginStateController;
import com.seeclickfix.ma.android.auth.ProfileController;
import com.seeclickfix.ma.android.events.AuthRequiredEvent;
import com.seeclickfix.ma.android.events.LoginEvent;
import com.seeclickfix.ma.android.events.UserProfileLoadedEvent;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.objects.user.User;
import com.squareup.otto.Subscribe;

public class MeFrag
  extends BaseFrag
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "MeFrag";
  private Button accountBtn;
  private View.OnClickListener accountBtnListener;
  private Bundle args;
  private ImageView avatar;
  private Context c;
  private TextView closedNumView;
  private TextView closedTextView;
  private TextView commentsNumView;
  private TextView commentsTextView;
  private ImageLoader.ImageContainer container;
  private TextView followsNumView;
  private TextView followsTextView;
  private boolean isLoggedIn;
  private User mUser;
  private PageParams pageParams;
  private TextView reportsNumView;
  private TextView reportsTextView;
  private TextView userNameTextView;
  private TextView votesNumView;
  private TextView votesTextView;
  
  private void attachListeners()
  {
    accountBtn.setOnClickListener(accountBtnListener);
  }
  
  private void handleArgs()
  {
    try
    {
      args = getArguments();
      pageParams = ((PageParams)args.getParcelable("page_params"));
      pageParams.setActionExtra(null);
      return;
    }
    catch (Exception localException) {}
  }
  
  private void resetViews()
  {
    ((TextView)rootFrag.findViewById(2131361973)).setText(2131493051);
    ((TextView)rootFrag.findViewById(2131361974)).setText(" ");
    TextView localTextView = (TextView)rootFrag.findViewById(2131361987);
    localTextView.setText(2131493052);
    localTextView.setVisibility(0);
    accountBtn.setText(2131493045);
    avatar.setImageResource(2130837797);
    ((ViewGroup)rootFrag.findViewById(2131361975)).setVisibility(8);
  }
  
  private void setContent()
  {
    isLoggedIn = AuthManager.isAuthenticated();
    if (isLoggedIn)
    {
      AuthUser localAuthUser = currentUser();
      userNameTextView.setText(localAuthUser.getDisplayName());
      ((TextView)rootFrag.findViewById(2131361974)).setText(localAuthUser.getEmail());
      ((TextView)rootFrag.findViewById(2131361987)).setText(getString(2131493044, new Object[] { localAuthUser.getEmail() }));
      accountBtn.setText(2131493046);
      setProfileContent();
    }
  }
  
  private void setProfileContent()
  {
    if (mUser == null) {
      mUser = ProfileController.getInstance().getUserIfAvail(c);
    }
    if (mUser != null)
    {
      userNameTextView.setText(mUser.getName());
      ((ViewGroup)rootFrag.findViewById(2131361975)).setVisibility(0);
      reportsNumView.setText(String.valueOf(mUser.getReportedIssueCount()));
      closedNumView.setText(String.valueOf(mUser.getClosedIssueCount()));
      commentsNumView.setText(String.valueOf(mUser.getCommentCount()));
      votesNumView.setText(String.valueOf(mUser.getVotedIssueCount()));
      followsNumView.setText(String.valueOf(mUser.getFollowedIssueCount()));
      ProfileController.getInstance().setUserAvatar(c, avatar, 2130837797);
      getSherlockActivity().getSupportActionBar().setTitle(mUser.getName());
      pageParams.setDisplayName(mUser.getName());
    }
  }
  
  private void setReferences()
  {
    accountBtn = ((Button)rootFrag.findViewById(2131361988));
    avatar = ((ImageView)rootFrag.findViewById(2131361972));
    userNameTextView = ((TextView)rootFrag.findViewById(2131361973));
    reportsTextView = ((TextView)rootFrag.findViewById(2131361977));
    closedTextView = ((TextView)rootFrag.findViewById(2131361979));
    commentsTextView = ((TextView)rootFrag.findViewById(2131361981));
    votesTextView = ((TextView)rootFrag.findViewById(2131361983));
    followsTextView = ((TextView)rootFrag.findViewById(2131361985));
    reportsNumView = ((TextView)rootFrag.findViewById(2131361976));
    closedNumView = ((TextView)rootFrag.findViewById(2131361978));
    commentsNumView = ((TextView)rootFrag.findViewById(2131361980));
    votesNumView = ((TextView)rootFrag.findViewById(2131361982));
    followsNumView = ((TextView)rootFrag.findViewById(2131361984));
  }
  
  private void setupListeners()
  {
    accountBtnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (!isLoggedIn)
        {
          pageParams.setActionExtra("com.seeclickfix.actions.SHOW_ME_FRAG");
          MeFrag.postEvent(new AuthRequiredEvent(pageParams));
          return;
        }
        logout();
      }
    };
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  protected void logout()
  {
    AuthManager.logout(getActivity().getApplicationContext());
    LoginStateController.getInstance().resetLoginState();
    isLoggedIn = false;
    resetViews();
    ProfileController.resetAvatar();
    getSherlockActivity().getSupportActionBar().setTitle(2131493051);
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    c = getActivity().getApplicationContext();
    handleArgs();
    setReferences();
    setupListeners();
    attachListeners();
    setHasOptionsMenu(true);
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenu.clear();
    paramMenuInflater.inflate(2131623938, paramMenu);
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903088, paramViewGroup, false));
    return rootFrag;
  }
  
  @Subscribe
  public void onLoginEvent(LoginEvent paramLoginEvent)
  {
    try
    {
      ProfileController.getInstance().loadUserProfile(paramLoginEvent.getUser(), getActivity().getApplicationContext());
      return;
    }
    catch (Exception paramLoginEvent) {}
  }
  
  public void onPause()
  {
    unSubscribeFromEventBus();
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    subscribeToEventBus();
    setContent();
    if (AuthManager.isAuthenticated()) {
      ProfileController.getInstance().loadUserProfile(currentUser(), c);
    }
  }
  
  @Subscribe
  public void onUserProfileEvent(UserProfileLoadedEvent paramUserProfileLoadedEvent)
  {
    if (paramUserProfileLoadedEvent != null)
    {
      isLoggedIn = true;
      mUser = paramUserProfileLoadedEvent.getUser();
      setProfileContent();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.MeFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */