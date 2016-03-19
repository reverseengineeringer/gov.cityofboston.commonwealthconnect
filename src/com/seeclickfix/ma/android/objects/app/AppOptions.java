package com.seeclickfix.ma.android.objects.app;

import com.google.gson.annotations.SerializedName;

public class AppOptions
{
  @SerializedName("block_action_on_closed_issues")
  public boolean blockActionOnClosedIssues = false;
  @SerializedName("block_other_category")
  public boolean blockOtherCategory = false;
  @SerializedName("help_link")
  public String helpLink;
  @SerializedName("hide_non_dedicated_request_types")
  public boolean hideNonDedicatedRequestTypes = false;
  @SerializedName("login_on_app_startup")
  public boolean loginOnStartup = false;
  @SerializedName("prompt_for_feedback")
  public boolean promptForFeedback = false;
  @SerializedName("show_integration_id_on_issues")
  public boolean showIntegrationId = false;
  @SerializedName("show_only_customer_issues")
  public boolean showOnlyCustomerIssues = false;
  @SerializedName("suppress_description_field")
  public boolean suppressDescriptionField = false;
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.app.AppOptions
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */