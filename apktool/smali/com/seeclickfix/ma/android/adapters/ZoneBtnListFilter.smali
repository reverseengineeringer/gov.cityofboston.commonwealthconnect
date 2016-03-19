.class public Lcom/seeclickfix/ma/android/adapters/ZoneBtnListFilter;
.super Ljava/lang/Object;
.source "ZoneBtnListFilter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convert(Ljava/util/List;Landroid/content/Context;)Ljava/util/List;
    .locals 6
    .param p1, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            ">;",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            ">;"
        }
    .end annotation

    .prologue
    .local p0, "apiList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    const/4 v5, 0x6

    .line 26
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .local v1, "convertedList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    .line 30
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_2

    .line 31
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;

    .line 33
    .local v0, "btn":Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;
    if-ge v2, v5, :cond_1

    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/adapters/ZoneBtnListFilter;->isNeededBtn(Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 34
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 35
    :cond_1
    if-lt v2, v5, :cond_0

    .line 36
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 42
    .end local v0    # "btn":Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;
    :cond_2
    return-object v1
.end method

.method private static isNeededBtn(Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;Landroid/content/Context;)Z
    .locals 4
    .param p0, "btn"    # Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->isDedicatedApp(Landroid/content/Context;)Z

    move-result v0

    .line 47
    .local v0, "isDedicated":Z
    const-string/jumbo v2, "scf://report"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    .line 49
    .local v1, "isReportBtn":Z
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
