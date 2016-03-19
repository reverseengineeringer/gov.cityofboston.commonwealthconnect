.class public Lcom/seeclickfix/ma/android/events/StartActivityEvent;
.super Ljava/lang/Object;
.source "StartActivityEvent.java"


# instance fields
.field private intent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/StartActivityEvent;->intent:Landroid/content/Intent;

    .line 11
    return-void
.end method


# virtual methods
.method public getIntent()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/StartActivityEvent;->intent:Landroid/content/Intent;

    return-object v0
.end method
