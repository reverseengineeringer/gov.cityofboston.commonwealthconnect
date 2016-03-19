package com.seeclickfix.ma.android.objects.apiv2;

import com.google.gson.annotations.SerializedName;
import java.util.Map;

public class Comment
{
  private String comment;
  private User commenter;
  @SerializedName("created_at")
  private String createdAt;
  private int id;
  private IssueInfo issue;
  private Map<String, String> media;
  @SerializedName("updated_at")
  private String updatedAt;
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.apiv2.Comment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */