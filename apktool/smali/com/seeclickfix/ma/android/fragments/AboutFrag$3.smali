.class Lcom/seeclickfix/ma/android/fragments/AboutFrag$3;
.super Ljava/lang/Object;
.source "AboutFrag.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/AboutFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V
    .locals 0

    .prologue
    .line 217
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 221
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-virtual {v0, p3}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->setDevEnvironment(I)V

    .line 222
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
