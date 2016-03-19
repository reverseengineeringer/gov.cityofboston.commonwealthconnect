.class Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;
.super Ljava/lang/Thread;
.source "CityLoadingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/services/CityLoadingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadCityThread"
.end annotation


# instance fields
.field private ctx:Landroid/content/Context;

.field final synthetic this$0:Lcom/seeclickfix/ma/android/services/CityLoadingService;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/services/CityLoadingService;Landroid/content/Context;)V
    .locals 0
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;->this$0:Lcom/seeclickfix/ma/android/services/CityLoadingService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 76
    iput-object p2, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;->ctx:Landroid/content/Context;

    .line 77
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;->this$0:Lcom/seeclickfix/ma/android/services/CityLoadingService;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;->ctx:Landroid/content/Context;

    # invokes: Lcom/seeclickfix/ma/android/services/CityLoadingService;->readSql(Landroid/content/Context;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->access$000(Lcom/seeclickfix/ma/android/services/CityLoadingService;Landroid/content/Context;)V

    .line 83
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/CityLoadingService$LoadCityThread;->this$0:Lcom/seeclickfix/ma/android/services/CityLoadingService;

    # invokes: Lcom/seeclickfix/ma/android/services/CityLoadingService;->executeInserts()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/services/CityLoadingService;->access$100(Lcom/seeclickfix/ma/android/services/CityLoadingService;)V

    .line 84
    return-void
.end method
