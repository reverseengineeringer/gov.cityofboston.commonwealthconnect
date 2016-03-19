.class public Lcom/seeclickfix/ma/android/activities/WebviewActivity;
.super Landroid/app/Activity;
.source "WebviewActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    invoke-virtual {p0, v6}, Lcom/seeclickfix/ma/android/activities/WebviewActivity;->requestWindowFeature(I)Z

    .line 20
    new-instance v3, Landroid/webkit/WebView;

    invoke-direct {v3, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 22
    .local v3, "webview":Landroid/webkit/WebView;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/activities/WebviewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "webview_uri"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 26
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Landroid/webkit/WebViewClient;

    invoke-direct {v2}, Landroid/webkit/WebViewClient;-><init>()V

    .line 29
    .local v2, "webClient":Landroid/webkit/WebViewClient;
    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 34
    .local v0, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 40
    invoke-virtual {v0, v7}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 45
    invoke-virtual {v0, v6}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 47
    invoke-virtual {v0, v7}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 51
    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 52
    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 54
    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/activities/WebviewActivity;->setContentView(Landroid/view/View;)V

    .line 55
    invoke-virtual {v3, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 57
    return-void
.end method
