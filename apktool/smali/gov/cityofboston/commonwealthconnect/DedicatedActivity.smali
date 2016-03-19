.class public Lgov/cityofboston/commonwealthconnect/DedicatedActivity;
.super Lcom/seeclickfix/ma/android/SeeclickfixActivity;
.source "DedicatedActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lgov/cityofboston/commonwealthconnect/DedicatedActivity$DedicatedActivityModule;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;-><init>()V

    .line 129
    return-void
.end method


# virtual methods
.method public getActivityModules()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    invoke-super {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getActivityModules()Ljava/util/List;

    move-result-object v0

    .line 35
    .local v0, "modules":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v1, Lgov/cityofboston/commonwealthconnect/DedicatedActivity$DedicatedActivityModule;

    invoke-direct {v1}, Lgov/cityofboston/commonwealthconnect/DedicatedActivity$DedicatedActivityModule;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    return-object v0
.end method

.method public onAuthRequiredEvent(Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 90
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onAuthRequiredEvent(Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;)V

    .line 91
    return-void
.end method

.method public onFlagContentEvent(Lcom/seeclickfix/ma/android/events/FlagContentEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/FlagContentEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 41
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onFlagContentEvent(Lcom/seeclickfix/ma/android/events/FlagContentEvent;)V

    .line 42
    return-void
.end method

.method public onGooglePlayErrorEvent(Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 76
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onGooglePlayErrorEvent(Lcom/seeclickfix/ma/android/events/GooglePlayErrorEvent;)V

    .line 77
    return-void
.end method

.method public onIssueCreatedEvent(Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 111
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onIssueCreatedEvent(Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;)V

    .line 112
    return-void
.end method

.method public onIssueFailureEvent(Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 125
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onIssueFailureEvent(Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;)V

    .line 126
    return-void
.end method

.method public onLocationNotEnabledEvent(Lcom/seeclickfix/ma/android/events/LocationNotEnabledEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LocationNotEnabledEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 62
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onLocationNotEnabledEvent(Lcom/seeclickfix/ma/android/events/LocationNotEnabledEvent;)V

    .line 63
    return-void
.end method

.method public onLoginEvent(Lcom/seeclickfix/ma/android/events/LoginEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LoginEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 48
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onLoginEvent(Lcom/seeclickfix/ma/android/events/LoginEvent;)V

    .line 49
    return-void
.end method

.method public onLoginSkipEvent(Lcom/seeclickfix/ma/android/events/LoginSkipEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LoginSkipEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 55
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onLoginSkipEvent(Lcom/seeclickfix/ma/android/events/LoginSkipEvent;)V

    .line 56
    return-void
.end method

.method public onLogoutEvent(Lcom/seeclickfix/ma/android/events/LogoutEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LogoutEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 83
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onLogoutEvent(Lcom/seeclickfix/ma/android/events/LogoutEvent;)V

    .line 84
    return-void
.end method

.method public onShowReportEvent(Lcom/seeclickfix/ma/android/events/ShowReportEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/ShowReportEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 69
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onShowReportEvent(Lcom/seeclickfix/ma/android/events/ShowReportEvent;)V

    .line 70
    return-void
.end method

.method public onSplashContinueEvent(Lcom/seeclickfix/ma/android/events/SplashContinueEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/SplashContinueEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 97
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onSplashContinueEvent(Lcom/seeclickfix/ma/android/events/SplashContinueEvent;)V

    .line 98
    return-void
.end method

.method public onUnboxingContinueEvent(Lcom/seeclickfix/ma/android/events/UnboxingContinueEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/UnboxingContinueEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 104
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onUnboxingContinueEvent(Lcom/seeclickfix/ma/android/events/UnboxingContinueEvent;)V

    .line 105
    return-void
.end method

.method public onUserProfileEvent(Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 118
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onUserProfileEvent(Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;)V

    .line 119
    return-void
.end method
