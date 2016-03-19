.class public Lcom/seeclickfix/ma/android/objects/app/AppOptions;
.super Ljava/lang/Object;
.source "AppOptions.java"


# instance fields
.field public blockActionOnClosedIssues:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "block_action_on_closed_issues"
    .end annotation
.end field

.field public blockOtherCategory:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "block_other_category"
    .end annotation
.end field

.field public helpLink:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "help_link"
    .end annotation
.end field

.field public hideNonDedicatedRequestTypes:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "hide_non_dedicated_request_types"
    .end annotation
.end field

.field public loginOnStartup:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "login_on_app_startup"
    .end annotation
.end field

.field public promptForFeedback:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "prompt_for_feedback"
    .end annotation
.end field

.field public showIntegrationId:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "show_integration_id_on_issues"
    .end annotation
.end field

.field public showOnlyCustomerIssues:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "show_only_customer_issues"
    .end annotation
.end field

.field public suppressDescriptionField:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "suppress_description_field"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->promptForFeedback:Z

    .line 13
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->blockActionOnClosedIssues:Z

    .line 16
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->showIntegrationId:Z

    .line 19
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->loginOnStartup:Z

    .line 22
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->showOnlyCustomerIssues:Z

    .line 25
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->blockOtherCategory:Z

    .line 28
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->suppressDescriptionField:Z

    .line 31
    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->hideNonDedicatedRequestTypes:Z

    return-void
.end method
