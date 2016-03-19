package com.seeclickfix.ma.android.api;

import com.seeclickfix.ma.android.objects.SimpleMultiMap;
import com.seeclickfix.ma.android.objects.apiv2.IssueV2;
import com.seeclickfix.ma.android.objects.report.RequestType;
import java.util.HashMap;
import java.util.Map;
import retrofit.Callback;
import retrofit.http.DELETE;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.GET;
import retrofit.http.Multipart;
import retrofit.http.POST;
import retrofit.http.Part;
import retrofit.http.PartMap;
import retrofit.http.Path;
import retrofit.mime.TypedFile;
import retrofit.mime.TypedOutput;
import retrofit.mime.TypedString;

public abstract interface SCFService$APIv2
{
  @Multipart
  @POST("/api/v2/issues/{issue_id}/acknowledge")
  public abstract void acknowledgeIssue(@Path("issue_id") int paramInt, @PartMap Map<String, TypedOutput> paramMap, Callback<SCFService.IssueActionReceipt> paramCallback);
  
  @Multipart
  @POST("/api/v2/issues/{issue_id}/close")
  public abstract void closeIssue(@Path("issue_id") int paramInt, @PartMap Map<String, TypedOutput> paramMap, Callback<SCFService.IssueActionReceipt> paramCallback);
  
  @Multipart
  @POST("/api/v2/issues/{issue_id}/comments")
  public abstract void commentOnIssue(@Path("issue_id") int paramInt, @Part("comment") TypedString paramTypedString1, @Part("image") TypedFile paramTypedFile1, @Part("video") TypedFile paramTypedFile2, @Part("youtube_url") TypedString paramTypedString2, Callback<SCFService.IssueActionReceipt> paramCallback);
  
  @Multipart
  @POST("/api/v2/issues")
  public abstract void createIssue(@Part("answers[issue_image]") TypedFile paramTypedFile, @PartMap SimpleMultiMap<String, String> paramSimpleMultiMap, Callback<IssueV2> paramCallback);
  
  @FormUrlEncoded
  @POST("/api/v2/comments/{comment_id}/flag")
  public abstract void flagComment(@Path("comment_id") String paramString1, @Field("message") String paramString2, Callback<HashMap<String, String>> paramCallback);
  
  @FormUrlEncoded
  @POST("/api/v2/issues/{issue_id}/flag")
  public abstract void flagIssue(@Path("issue_id") String paramString1, @Field("message") String paramString2, Callback<HashMap<String, String>> paramCallback);
  
  @POST("/api/v2/issues/{issue_id}/follow")
  public abstract void followIssue(@Path("issue_id") int paramInt, Callback<SCFService.IssueActionReceipt> paramCallback);
  
  @GET("/api/v2/issues/{id}")
  public abstract void issue(@Path("id") int paramInt, Callback<IssueV2> paramCallback);
  
  @GET("/api/v2/issues/{id}?details=true")
  public abstract void issueDetails(@Path("id") int paramInt, Callback<IssueV2> paramCallback);
  
  @Multipart
  @POST("/api/v2/issues/{issue_id}/open")
  public abstract void openIssue(@Path("issue_id") int paramInt, @PartMap Map<String, TypedOutput> paramMap, Callback<SCFService.IssueActionReceipt> paramCallback);
  
  @GET("/api/v2/request_types/{request_type_id}")
  public abstract void requestType(@Path("request_type_id") String paramString, Callback<RequestType> paramCallback);
  
  @DELETE("/api/v2/issues/{issue_id}/vote")
  public abstract void revokeVoteForIssue(@Path("issue_id") int paramInt, Callback<SCFService.IssueActionReceipt> paramCallback);
  
  @POST("/api/v2/issues/{issue_id}/vote")
  public abstract void voteForIssue(@Path("issue_id") int paramInt, Callback<SCFService.IssueActionReceipt> paramCallback);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.APIv2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */