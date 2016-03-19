package com.seeclickfix.ma.android.objects.user;

import android.content.res.Resources;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class UserError
{
  @Expose
  @SerializedName("accept_terms")
  private List<String> acceptTerms = new ArrayList();
  @Expose
  private List<String> email = new ArrayList();
  @Expose
  @SerializedName("emails.base")
  private List<String> emailsBase = new ArrayList();
  @Expose
  private List<String> name = new ArrayList();
  @Expose
  private List<String> password = new ArrayList();
  @Expose
  @SerializedName("password_confirmation")
  private List<String> passwordConfirmation = new ArrayList();
  
  private void appendArrayToStringBuilder(String paramString, List<String> paramList, StringBuilder paramStringBuilder)
  {
    if ((paramList != null) && (paramList.size() > 0))
    {
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        String str = (String)paramList.next();
        if (paramString != null)
        {
          paramStringBuilder.append(paramString);
          paramStringBuilder.append(" ");
        }
        paramStringBuilder.append(str);
        paramStringBuilder.append("\n");
      }
    }
  }
  
  public List<String> getAcceptTerms()
  {
    return acceptTerms;
  }
  
  public String getAllErrors(String paramString, Resources paramResources)
  {
    String str1 = paramResources.getString(2131493093);
    String str2 = paramResources.getString(2131493033);
    String str3 = paramResources.getString(2131493033);
    String str4 = paramResources.getString(2131493027);
    paramResources = paramResources.getString(2131493021);
    StringBuilder localStringBuilder = new StringBuilder();
    appendArrayToStringBuilder(str1, acceptTerms, localStringBuilder);
    appendArrayToStringBuilder(str2, password, localStringBuilder);
    appendArrayToStringBuilder(str3, passwordConfirmation, localStringBuilder);
    appendArrayToStringBuilder(str4, email, localStringBuilder);
    appendArrayToStringBuilder(paramResources, name, localStringBuilder);
    appendArrayToStringBuilder(null, emailsBase, localStringBuilder);
    paramResources = localStringBuilder.toString();
    if (paramResources != null) {
      return paramResources;
    }
    return paramString;
  }
  
  public List<String> getEmail()
  {
    return email;
  }
  
  public List<String> getEmailsBase()
  {
    return emailsBase;
  }
  
  public List<String> getName()
  {
    return name;
  }
  
  public List<String> getPassword()
  {
    return password;
  }
  
  public List<String> getPasswordConfirmation()
  {
    return passwordConfirmation;
  }
  
  public void setAcceptTerms(List<String> paramList)
  {
    acceptTerms = paramList;
  }
  
  public void setEmail(List<String> paramList)
  {
    email = paramList;
  }
  
  public void setEmailsBase(List<String> paramList)
  {
    emailsBase = paramList;
  }
  
  public void setName(List<String> paramList)
  {
    name = paramList;
  }
  
  public void setPassword(List<String> paramList)
  {
    password = paramList;
  }
  
  public void setPasswordConfirmation(List<String> paramList)
  {
    passwordConfirmation = paramList;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.user.UserError
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */