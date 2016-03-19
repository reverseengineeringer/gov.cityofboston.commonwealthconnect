package com.seeclickfix.ma.android.api;

import com.seeclickfix.ma.android.objects.report.Question;
import java.util.List;
import retrofit.Callback;
import retrofit.http.GET;
import retrofit.http.Path;

public abstract interface SCFService$APIv1
{
  @GET("/api/request_types/{request_type_id}/request_type_questions")
  public abstract void requestTypeQuestions(@Path("request_type_id") String paramString, Callback<List<Question>> paramCallback);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.APIv1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */