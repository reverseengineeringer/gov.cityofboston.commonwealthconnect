.class synthetic Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;
.super Ljava/lang/Object;
.source "BaseFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$ActionBarState:[I

.field static final synthetic $SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$FragState:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 324
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->values()[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$ActionBarState:[I

    :try_start_0
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$ActionBarState:[I

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_0
    :try_start_1
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$ActionBarState:[I

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->INACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_1
    :try_start_2
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$ActionBarState:[I

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->HIDDEN:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    .line 253
    :goto_2
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->values()[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$FragState:[I

    :try_start_3
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$FragState:[I

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    :goto_3
    :try_start_4
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$FragState:[I

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_4
    :try_start_5
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$3;->$SwitchMap$com$seeclickfix$ma$android$fragments$base$BaseFrag$FragState:[I

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_5
    return-void

    :catch_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    goto :goto_4

    :catch_2
    move-exception v0

    goto :goto_3

    .line 324
    :catch_3
    move-exception v0

    goto :goto_2

    :catch_4
    move-exception v0

    goto :goto_1

    :catch_5
    move-exception v0

    goto :goto_0
.end method
