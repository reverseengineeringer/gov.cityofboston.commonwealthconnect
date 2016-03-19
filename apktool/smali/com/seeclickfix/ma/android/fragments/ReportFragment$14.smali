.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$14;
.super Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
.source "ReportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;->geocode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/seeclickfix/ma/android/location/SimpleLocation;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V
    .locals 0

    .prologue
    .line 928
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$14;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V
    .locals 2
    .param p1, "code"    # Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    .prologue
    .line 938
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$14;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 939
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$14;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->processSimpleLocations(Ljava/util/List;)V

    .line 940
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 928
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$14;->onSuccess(Ljava/util/List;)V

    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/location/SimpleLocation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 932
    .local p1, "response":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/location/SimpleLocation;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$14;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 933
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$14;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->processSimpleLocations(Ljava/util/List;)V

    .line 934
    return-void
.end method
