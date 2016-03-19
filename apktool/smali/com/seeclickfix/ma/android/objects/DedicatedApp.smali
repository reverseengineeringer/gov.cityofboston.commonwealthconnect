.class public Lcom/seeclickfix/ma/android/objects/DedicatedApp;
.super Ljava/lang/Object;
.source "DedicatedApp.java"


# instance fields
.field private accuracyLabelText:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "accuracy_label_text"
    .end annotation
.end field

.field private allowedZoneIds:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "allowed_zone_ids"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private appId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "app_id"
    .end annotation
.end field

.field private call311HeaderTitle:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "call_311_header_title"
    .end annotation
.end field

.field private call311Message:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "call_311_message"
    .end annotation
.end field

.field private call311Number:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "call_311_number"
    .end annotation
.end field

.field private defaultGeoConfigUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "default_geo_config_url"
    .end annotation
.end field

.field private defaultZoneId:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "default_zone_id"
    .end annotation
.end field

.field private disclaimerText:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "disclaimer_text"
    .end annotation
.end field

.field private geoAwareBranding:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "geo_aware_branding"
    .end annotation
.end field

.field private isDedicatedApp:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "is_dedicated_app"
    .end annotation
.end field

.field private options:Lcom/seeclickfix/ma/android/objects/app/AppOptions;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "options"
    .end annotation
.end field

.field private reportAlertBodyText:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "report_alert_body_text"
    .end annotation
.end field

.field private reportAlertButtonText:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "report_alert_button_text"
    .end annotation
.end field

.field private reportAlertButtonUri:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "report_alert_button_uri"
    .end annotation
.end field

.field private reportAlertMessage:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "report_alert_message"
    .end annotation
.end field

.field private title:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "title"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/app/AppOptions;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->options:Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->geoAwareBranding:Z

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->isDedicatedApp:Z

    .line 71
    const/4 v0, -0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->defaultZoneId:I

    return-void
.end method


# virtual methods
.method public getAccuracyLabelText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->accuracyLabelText:Ljava/lang/String;

    return-object v0
.end method

.method public getAllowedIdsString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 165
    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->allowedZoneIds:Ljava/util/List;

    const-string/jumbo v2, ","

    invoke-static {v1, v2}, Lorg/apache/commons/lang3/StringUtils;->join(Ljava/lang/Iterable;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 167
    .local v0, "allowedZones":Ljava/lang/String;
    return-object v0
.end method

.method public getAllowedZoneIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 233
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->allowedZoneIds:Ljava/util/List;

    return-object v0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->appId:Ljava/lang/String;

    return-object v0
.end method

.method public getCall311HeaderTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->call311HeaderTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getCall311Message()Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->call311Message:Ljava/lang/String;

    return-object v0
.end method

.method public getCall311Number()Ljava/lang/String;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->call311Number:Ljava/lang/String;

    return-object v0
.end method

.method public getDefaultGeoConfigUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->defaultGeoConfigUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getDefaultZoneId()I
    .locals 1

    .prologue
    .line 153
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->defaultZoneId:I

    return v0
.end method

.method public getDisclaimerText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->disclaimerText:Ljava/lang/String;

    return-object v0
.end method

.method public getIsDedicatedApp()Z
    .locals 1

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->isDedicatedApp:Z

    return v0
.end method

.method public getIssueFilter()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 261
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;-><init>(Lcom/seeclickfix/ma/android/objects/DedicatedApp;)V

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/issue/IssueFilter;->get()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getNumZones()I
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->allowedZoneIds:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->allowedZoneIds:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->options:Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    return-object v0
.end method

.method public getReportAlertBodyText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->reportAlertBodyText:Ljava/lang/String;

    return-object v0
.end method

.method public getReportAlertButtonText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->reportAlertButtonText:Ljava/lang/String;

    return-object v0
.end method

.method public getReportAlertButtonUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->reportAlertButtonUri:Ljava/lang/String;

    return-object v0
.end method

.method public getReportAlertMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->reportAlertMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->title:Ljava/lang/String;

    return-object v0
.end method

.method public setAllowedZoneIds(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 221
    .local p1, "allowedZoneIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->allowedZoneIds:Ljava/util/List;

    .line 222
    return-void
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->appId:Ljava/lang/String;

    .line 206
    return-void
.end method

.method public setDefaultGeoConfigUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "defaultGeoConfigUrl"    # Ljava/lang/String;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->defaultGeoConfigUrl:Ljava/lang/String;

    .line 210
    return-void
.end method

.method public setDefaultZoneId(I)V
    .locals 0
    .param p1, "defaultZoneId"    # I

    .prologue
    .line 225
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->defaultZoneId:I

    .line 226
    return-void
.end method

.method public setGeoAwareBranding(Z)V
    .locals 0
    .param p1, "geoAwareBranding"    # Z

    .prologue
    .line 217
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->geoAwareBranding:Z

    .line 218
    return-void
.end method

.method public setIsDedicatedApp(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 143
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->isDedicatedApp:Z

    .line 144
    return-void
.end method

.method public setOptions(Lcom/seeclickfix/ma/android/objects/app/AppOptions;)V
    .locals 0
    .param p1, "options"    # Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    .prologue
    .line 213
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->options:Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    .line 214
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 201
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->title:Ljava/lang/String;

    .line 202
    return-void
.end method
