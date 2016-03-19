.class public Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;
.super Landroid/support/v4/app/FragmentPagerAdapter;
.source "UnboxingPagerAdapter.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "FragPageAdapter"


# instance fields
.field private final MAX_FRAGS:I

.field frags:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field numFrags:I


# direct methods
.method public constructor <init>(Landroid/support/v4/app/Fragment;)V
    .locals 1
    .param p1, "f"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 32
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v4/app/FragmentPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;->numFrags:I

    .line 26
    const/4 v0, 0x3

    iput v0, p0, Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;->MAX_FRAGS:I

    .line 33
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x3

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 5
    .param p1, "position"    # I

    .prologue
    .line 39
    const/4 v1, 0x0

    .line 40
    .local v1, "f":Landroid/support/v4/app/Fragment;
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;->newInstance()Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 41
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 42
    .local v0, "args":Landroid/os/Bundle;
    const/4 v2, 0x0

    .line 44
    .local v2, "layoutID":I
    packed-switch p1, :pswitch_data_0

    .line 58
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "position is inalid"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 46
    :pswitch_0
    const v2, 0x7f03003a

    .line 62
    :goto_0
    const-string/jumbo v3, "unboxing_layout_id"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 64
    invoke-virtual {v1, v0}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 66
    iget v3, p0, Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;->numFrags:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/seeclickfix/ma/android/adapters/UnboxingPagerAdapter;->numFrags:I

    .line 67
    return-object v1

    .line 49
    :pswitch_1
    const v2, 0x7f03003b

    .line 50
    goto :goto_0

    .line 52
    :pswitch_2
    const v2, 0x7f03003c

    .line 53
    goto :goto_0

    .line 44
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
