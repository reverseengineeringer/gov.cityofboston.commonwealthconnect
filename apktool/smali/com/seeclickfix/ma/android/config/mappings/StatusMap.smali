.class public Lcom/seeclickfix/ma/android/config/mappings/StatusMap;
.super Ljava/lang/Object;
.source "StatusMap.java"


# static fields
.field public static final ACKNOWLEDGED:Ljava/lang/String; = "Acknowledged"

.field public static final ACTION_ACKNOWLEDGE:Ljava/lang/String; = "Issue Acknowledged"

.field public static final ACTION_CLOSE:Ljava/lang/String; = "Issue Closed"

.field private static final ACTION_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final ACTION_REOPEN:Ljava/lang/String; = "Issue Reopened"

.field public static final ARCHIVED:Ljava/lang/String; = "Archived"

.field public static final CLOSED:Ljava/lang/String; = "Closed"

.field public static final OPEN:Ljava/lang/String; = "Open"

.field private static STATUS_MAP:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static stateMap:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 44
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 46
    .local v0, "map":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "Open"

    const-string/jumbo v2, "Issue Reopened"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string/jumbo v1, "Closed"

    const-string/jumbo v2, "Issue Closed"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    const-string/jumbo v1, "Acknowledged"

    const-string/jumbo v2, "Issue Acknowledged"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sput-object v0, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->ACTION_MAP:Ljava/util/Map;

    .line 55
    new-instance v0, Ljava/util/LinkedHashMap;

    .end local v0    # "map":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 57
    .restart local v0    # "map":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "Issue Reopened"

    const-string/jumbo v2, "Open"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    const-string/jumbo v1, "Issue Closed"

    const-string/jumbo v2, "Closed"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    const-string/jumbo v1, "Issue Acknowledged"

    const-string/jumbo v2, "Acknowledged"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sput-object v0, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->STATUS_MAP:Ljava/util/LinkedHashMap;

    .line 62
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getActionString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 66
    sget-object v0, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->ACTION_MAP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getDisplayForList(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    .local p0, "statusList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/config/mappings/StatusMap$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap$1;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/collect/Lists;->transform(Ljava/util/List;Lcom/google/common/base/Function;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getStateDisplayString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 73
    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStateMap()Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getStateDisplayStrings()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStateMap()Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public static getStateMap()Ljava/util/LinkedHashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 78
    sget-object v2, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->stateMap:Ljava/util/LinkedHashMap;

    if-nez v2, :cond_0

    .line 79
    sget-object v2, Lcom/seeclickfix/ma/android/MyApplication;->instance:Lcom/seeclickfix/ma/android/MyApplication;

    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->res:Landroid/content/res/Resources;

    .line 81
    .local v0, "res":Landroid/content/res/Resources;
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v2, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->stateMap:Ljava/util/LinkedHashMap;

    .line 83
    const v2, 0x7f060005

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 85
    .local v1, "stringArray":[Ljava/lang/String;
    sget-object v2, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->stateMap:Ljava/util/LinkedHashMap;

    const-string/jumbo v3, "Open"

    const/4 v4, 0x0

    aget-object v4, v1, v4

    invoke-virtual {v2, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v2, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->stateMap:Ljava/util/LinkedHashMap;

    const-string/jumbo v3, "Closed"

    const/4 v4, 0x1

    aget-object v4, v1, v4

    invoke-virtual {v2, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v2, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->stateMap:Ljava/util/LinkedHashMap;

    const-string/jumbo v3, "Acknowledged"

    const/4 v4, 0x2

    aget-object v4, v1, v4

    invoke-virtual {v2, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v2, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->stateMap:Ljava/util/LinkedHashMap;

    const-string/jumbo v3, "Archived"

    const/4 v4, 0x3

    aget-object v4, v1, v4

    invoke-virtual {v2, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    :cond_0
    sget-object v2, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->stateMap:Ljava/util/LinkedHashMap;

    return-object v2
.end method

.method public static getStatusStateKeys()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStateMap()Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public static getStatusString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "commentType"    # Ljava/lang/String;

    .prologue
    .line 69
    sget-object v0, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->STATUS_MAP:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static statusListForIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/objects/user/AuthUser;Z)Ljava/util/List;
    .locals 6
    .param p0, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p1, "user"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .param p2, "closedIsFinal"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            "Lcom/seeclickfix/ma/android/objects/user/AuthUser;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    .line 120
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 122
    .local v0, "result":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 124
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_0
    move v4, v2

    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 134
    :goto_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getCanAcknowledge()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 135
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_1

    :cond_1
    move v1, v2

    :goto_2
    packed-switch v1, :pswitch_data_1

    .line 147
    :cond_2
    :goto_3
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v1

    .line 124
    :sswitch_0
    const-string/jumbo v5, "Open"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v1

    goto :goto_0

    :sswitch_1
    const-string/jumbo v5, "Closed"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v3

    goto :goto_0

    .line 126
    :pswitch_0
    const-string/jumbo v4, "Closed"

    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 129
    :pswitch_1
    const-string/jumbo v4, "Open"

    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 135
    :sswitch_2
    const-string/jumbo v3, "Open"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_2

    :sswitch_3
    const-string/jumbo v1, "Acknowledged"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v3

    goto :goto_2

    .line 137
    :pswitch_2
    const-string/jumbo v1, "Acknowledged"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 140
    :pswitch_3
    const-string/jumbo v1, "Closed"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 124
    :sswitch_data_0
    .sparse-switch
        0x259a6a -> :sswitch_0
        0x787acd8c -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 135
    :sswitch_data_1
    .sparse-switch
        -0x47a83a98 -> :sswitch_3
        0x259a6a -> :sswitch_2
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
