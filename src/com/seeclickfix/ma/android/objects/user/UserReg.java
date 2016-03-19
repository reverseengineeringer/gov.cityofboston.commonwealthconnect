package com.seeclickfix.ma.android.objects.user;

import com.google.gson.annotations.SerializedName;

public final class UserReg
{
  private boolean acceptedTerms = false;
  private String avatarImagePath;
  @SerializedName("user[email]")
  private String email;
  @SerializedName("user[name]")
  private String name;
  private String password;
  private String passwordConfirm;
  @SerializedName("user[registration_source]")
  private String registrationSource;
  
  public UserReg() {}
  
  public UserReg(UserReg paramUserReg)
  {
    acceptedTerms = acceptedTerms;
    email = email;
    password = password;
    passwordConfirm = passwordConfirm;
    avatarImagePath = avatarImagePath;
    name = name;
  }
  
  public String getAvatarImagePath()
  {
    return avatarImagePath;
  }
  
  public String getEmail()
  {
    return email;
  }
  
  public String getName()
  {
    return name;
  }
  
  public String getPassword()
  {
    return password;
  }
  
  public String getPasswordConfirm()
  {
    return passwordConfirm;
  }
  
  public boolean isAcceptedTerms()
  {
    return acceptedTerms;
  }
  
  public void setAcceptedTerms(boolean paramBoolean)
  {
    acceptedTerms = paramBoolean;
  }
  
  public void setAvatarImagePath(String paramString)
  {
    avatarImagePath = paramString;
  }
  
  public void setEmail(String paramString)
  {
    email = paramString;
  }
  
  public void setName(String paramString)
  {
    name = paramString;
  }
  
  public void setPassword(String paramString)
  {
    password = paramString;
  }
  
  public void setPasswordConfirm(String paramString)
  {
    passwordConfirm = paramString;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.user.UserReg
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */