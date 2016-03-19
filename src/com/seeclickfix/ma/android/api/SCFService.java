package com.seeclickfix.ma.android.api;

import android.content.Context;
import android.content.res.Resources;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.config.locale.LocaleManager;
import com.seeclickfix.ma.android.config.mappings.StatusMap;
import com.seeclickfix.ma.android.fragments.NoticeItem;
import com.seeclickfix.ma.android.objects.SimpleMultiMap;
import com.seeclickfix.ma.android.objects.apiv2.IssueV2;
import com.seeclickfix.ma.android.objects.issue.Comment;
import com.seeclickfix.ma.android.objects.issue.Follow;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.issue.RevokeVote;
import com.seeclickfix.ma.android.objects.issue.Transition;
import com.seeclickfix.ma.android.objects.issue.Vote;
import com.seeclickfix.ma.android.objects.report.Question;
import com.seeclickfix.ma.android.objects.report.RequestType;
import java.net.HttpCookie;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import retrofit.Callback;
import retrofit.RequestInterceptor;
import retrofit.RequestInterceptor.RequestFacade;
import retrofit.RestAdapter;
import retrofit.RestAdapter.Builder;
import retrofit.RestAdapter.LogLevel;
import retrofit.RetrofitError;
import retrofit.client.Response;
import retrofit.converter.GsonConverter;
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

public class SCFService
{
  private static RestAdapter.LogLevel debugLevel = RestAdapter.LogLevel.BASIC;
  
  public static APIv1 createV1Service(Context paramContext)
  {
    Gson localGson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ssZZZZZ").create();
    return (APIv1)new RestAdapter.Builder().setEndpoint(UrlConfig.getEndpoint(paramContext)).setRequestInterceptor(interceptor(paramContext)).setConverter(new GsonConverter(localGson)).setLogLevel(debugLevel).build().create(APIv1.class);
  }
  
  public static APIv2 createV2Service(Context paramContext)
  {
    Gson localGson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ssZZZZZ").create();
    return (APIv2)new RestAdapter.Builder().setEndpoint(UrlConfig.getEndpoint(paramContext)).setRequestInterceptor(interceptor(paramContext)).setConverter(new GsonConverter(localGson)).setLogLevel(debugLevel).build().create(APIv2.class);
  }
  
  public static RequestInterceptor interceptor(Context paramContext)
  {
    new RequestInterceptor()
    {
      public void intercept(RequestInterceptor.RequestFacade paramAnonymousRequestFacade)
      {
        HttpCookie localHttpCookie = new HttpCookie(AppBuild.getCookieName(val$appContext), PrefsUtil.getString("Pref:COOKIE", "", val$appContext));
        localHttpCookie.setVersion(0);
        paramAnonymousRequestFacade.addHeader("User-Agent", AppBuild.getUserAgent(val$appContext));
        paramAnonymousRequestFacade.addHeader("Accept-Language", LocaleManager.getLanguage(val$appContext));
        paramAnonymousRequestFacade.addHeader("Cookie", localHttpCookie.toString());
        paramAnonymousRequestFacade.addHeader("Accept", "application/json");
      }
    };
  }
  
  public static abstract interface APIv1
  {
    @GET("/api/request_types/{request_type_id}/request_type_questions")
    public abstract void requestTypeQuestions(@Path("request_type_id") String paramString, Callback<List<Question>> paramCallback);
  }
  
  public static abstract interface APIv2
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
  
  public static class ChangeStatusEvent
    extends SCFService.IssueActionEvent
  {
    private final String eventType;
    
    public ChangeStatusEvent(Transition paramTransition, SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
    {
      super(paramRetrofitResult);
      eventType = paramTransition.getCommentType();
    }
    
    public String getEventType()
    {
      return eventType;
    }
    
    public String getStatus()
    {
      return StatusMap.getStatusString(getEventType());
    }
  }
  
  public static class ErrorResponse
  {
    public HashMap<String, String[]> errors;
    
    public List<String> errorList()
    {
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = errors.entrySet().iterator();
      while (localIterator.hasNext())
      {
        String[] arrayOfString = (String[])((Map.Entry)localIterator.next()).getValue();
        int j = arrayOfString.length;
        int i = 0;
        while (i < j)
        {
          localArrayList.add(arrayOfString[i]);
          i += 1;
        }
      }
      return localArrayList;
    }
    
    public String toUL()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("<ul>\n");
      Iterator localIterator = errorList().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localStringBuilder.append("<li>");
        localStringBuilder.append(str);
        localStringBuilder.append("\n");
      }
      localStringBuilder.append("</ul>\n");
      return localStringBuilder.toString();
    }
  }
  
  public static class FollowResultEvent
    extends SCFService.IssueActionEvent
  {
    public FollowResultEvent(Follow paramFollow, SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
    {
      super(paramRetrofitResult);
    }
  }
  
  public static class IssueActionEvent
  {
    protected final Comment comment;
    protected final SCFService.RetrofitResult<SCFService.IssueActionReceipt> issueActionResult;
    
    public IssueActionEvent(Comment paramComment, SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
    {
      comment = paramComment;
      issueActionResult = paramRetrofitResult;
    }
    
    public Comment getComment()
    {
      return comment;
    }
    
    public SCFService.RetrofitResult<SCFService.IssueActionReceipt> getIssueActionResult()
    {
      return issueActionResult;
    }
  }
  
  public static class IssueActionReceipt
  {
    public Date createdAt;
    public int follow;
    public SCFService.IssueStub issue;
    public SCFService.Metadata metadata;
    public boolean moderated;
    public int vote;
    
    public String getStatus()
    {
      return issue.status;
    }
    
    public Boolean isModerated()
    {
      if ((moderated) || ((metadata != null) && (metadata.isModerated()))) {}
      for (boolean bool = true;; bool = false) {
        return Boolean.valueOf(bool);
      }
    }
  }
  
  public static class IssueCreatedEvent
  {
    private Issue issue;
    private Response response;
    
    public IssueCreatedEvent(IssueV2 paramIssueV2, Response paramResponse)
    {
      response = paramResponse;
      if (isCreated())
      {
        issue = Issue.fromIssue2(paramIssueV2);
        return;
      }
      issue = null;
    }
    
    public Issue getIssue()
    {
      return issue;
    }
    
    public NoticeItem getNoticeItem()
    {
      if (isAccepted()) {
        return NoticeItem.ACCEPTED();
      }
      return NoticeItem.CREATED();
    }
    
    public Response getResponse()
    {
      return response;
    }
    
    public boolean isAccepted()
    {
      return getResponse().getStatus() == 202;
    }
    
    public boolean isCreated()
    {
      return getResponse().getStatus() == 201;
    }
  }
  
  public static class IssueFailureEvent
  {
    private RetrofitError retrofitError;
    
    public IssueFailureEvent(RetrofitError paramRetrofitError)
    {
      retrofitError = paramRetrofitError;
    }
    
    public NoticeItem getNoticeItem(Context paramContext)
    {
      SCFService.ErrorResponse localErrorResponse = (SCFService.ErrorResponse)getRetrofitError().getBodyAs(SCFService.ErrorResponse.class);
      switch (SCFService.2.$SwitchMap$retrofit$RetrofitError$Kind[getRetrofitError().getKind().ordinal()])
      {
      default: 
        return NoticeItem.APP_ERROR();
      case 1: 
        return NoticeItem.NETWORK_ERROR();
      case 2: 
        if (getRetrofitError().getResponse().getStatus() == 422)
        {
          if (errors.containsKey("duplicate")) {
            return NoticeItem.DUPLICATE();
          }
          return NoticeItem.DECLINED(localErrorResponse.toUL());
        }
        return NoticeItem.HTTP_ERROR(paramContext.getString(2131493144, new Object[] { Integer.valueOf(getRetrofitError().getResponse().getStatus()) }));
      }
      return NoticeItem.PROTOCOL_ERROR();
    }
    
    public RetrofitError getRetrofitError()
    {
      return retrofitError;
    }
  }
  
  public static class IssueStub
  {
    public String rating;
    public String status;
  }
  
  public static class Metadata
  {
    public boolean moderated;
    
    public Metadata(boolean paramBoolean)
    {
      moderated = paramBoolean;
    }
    
    public boolean isModerated()
    {
      return moderated;
    }
    
    public void setModerated(boolean paramBoolean)
    {
      moderated = paramBoolean;
    }
  }
  
  public static class RetrofitResult<Receipt>
  {
    protected SCFService.ErrorResponse _errorBody = null;
    private int _httpStatus = 0;
    protected final Response httpResponse;
    protected final Receipt receipt;
    protected final RetrofitError retrofitError;
    
    public RetrofitResult(Receipt paramReceipt, Response paramResponse)
    {
      this(paramReceipt, paramResponse, null);
    }
    
    public RetrofitResult(Receipt paramReceipt, Response paramResponse, RetrofitError paramRetrofitError)
    {
      receipt = paramReceipt;
      retrofitError = paramRetrofitError;
      httpResponse = paramResponse;
    }
    
    public RetrofitResult(RetrofitError paramRetrofitError)
    {
      this(null, null, paramRetrofitError);
    }
    
    public SCFService.ErrorResponse errorBody()
    {
      if (_errorBody == null) {
        _errorBody = ((SCFService.ErrorResponse)getRetrofitError().getBodyAs(SCFService.ErrorResponse.class));
      }
      return _errorBody;
    }
    
    public NoticeItem fetchNotice()
    {
      if (isError()) {
        switch (SCFService.2.$SwitchMap$retrofit$RetrofitError$Kind[getRetrofitError().getKind().ordinal()])
        {
        default: 
          return NoticeItem.APP_ERROR();
        case 1: 
          return NoticeItem.NETWORK_ERROR();
        case 3: 
          return NoticeItem.PROTOCOL_ERROR();
        }
      }
      switch (httpStatus())
      {
      default: 
        MyApplication localMyApplication = MyApplication.instance;
        return NoticeItem.HTTP_ERROR(MyApplication.res.getString(2131493144, new Object[] { Integer.valueOf(httpStatus()) }));
      case 202: 
        return NoticeItem.COMMENT_ACCEPTED();
      case 204: 
        return NoticeItem.VOTE_REVOKED();
      case 201: 
        return NoticeItem.CREATED();
      case 403: 
        return NoticeItem.FORBIDDEN();
      }
      if (errorBodyerrors.containsKey("duplicate")) {
        return NoticeItem.DUPLICATE();
      }
      return NoticeItem.DECLINED(errorBody().toUL());
    }
    
    public Response getHttpResponse()
    {
      return httpResponse;
    }
    
    public NoticeItem getNotice()
    {
      if ((isSuccess()) && (!isAccepted())) {
        return null;
      }
      return fetchNotice();
    }
    
    public Receipt getReceipt()
    {
      return (Receipt)receipt;
    }
    
    public Response getResponse()
    {
      if (isSuccess()) {
        return getHttpResponse();
      }
      return getRetrofitError().getResponse();
    }
    
    public RetrofitError getRetrofitError()
    {
      return retrofitError;
    }
    
    public boolean hasHttpStatus(int paramInt)
    {
      return httpStatus() == paramInt;
    }
    
    public int httpStatus()
    {
      if (_httpStatus == 0)
      {
        Response localResponse = getResponse();
        if (localResponse != null) {
          _httpStatus = localResponse.getStatus();
        }
      }
      return _httpStatus;
    }
    
    public boolean isAccepted()
    {
      return hasHttpStatus(202);
    }
    
    public boolean isError()
    {
      return !isSuccess();
    }
    
    public boolean isSuccess()
    {
      return (receipt != null) || (getRetrofitError() == null);
    }
  }
  
  public static class RevokeVoteResultEvent
    extends SCFService.IssueActionEvent
  {
    public RevokeVoteResultEvent(RevokeVote paramRevokeVote, SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
    {
      super(paramRetrofitResult);
    }
  }
  
  public static class VoteResultEvent
    extends SCFService.IssueActionEvent
  {
    public VoteResultEvent(Vote paramVote, SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
    {
      super(paramRetrofitResult);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */