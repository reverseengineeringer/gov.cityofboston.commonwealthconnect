.class Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$1;
.super Ljava/lang/Object;
.source "PlacesMapFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)V
    .locals 0

    .prologue
    .line 193
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->save()V

    .line 198
    return-void
.end method
