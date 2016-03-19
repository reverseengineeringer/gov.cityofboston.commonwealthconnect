package com.seeclickfix.ma.android.activities;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class WebviewActivity
  extends Activity
{
  @SuppressLint({"SetJavaScriptEnabled"})
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    paramBundle = new WebView(this);
    String str = getIntent().getStringExtra("webview_uri");
    new WebViewClient();
    WebSettings localWebSettings = paramBundle.getSettings();
    localWebSettings.setJavaScriptEnabled(true);
    localWebSettings.setAllowFileAccess(false);
    localWebSettings.setBuiltInZoomControls(true);
    localWebSettings.setSaveFormData(false);
    paramBundle.getSettings().setLoadWithOverviewMode(true);
    paramBundle.getSettings().setUseWideViewPort(true);
    setContentView(paramBundle);
    paramBundle.loadUrl(str);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.activities.WebviewActivity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */