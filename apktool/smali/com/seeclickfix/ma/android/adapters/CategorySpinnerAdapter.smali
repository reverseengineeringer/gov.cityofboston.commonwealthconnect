.class public Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;
.super Landroid/widget/BaseAdapter;
.source "CategorySpinnerAdapter.java"

# interfaces
.implements Landroid/widget/SpinnerAdapter;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "CategorySpinnerAdapter"


# instance fields
.field private c:Landroid/content/Context;

.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->c:Landroid/content/Context;

    .line 33
    return-void
.end method

.method private getBlankView(Lcom/seeclickfix/ma/android/objects/report/RequestType;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p1, "requestType"    # Lcom/seeclickfix/ma/android/objects/report/RequestType;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 141
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f03005d

    invoke-static {v0, v1, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 142
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 143
    return-object p2
.end method

.method private getClickableView(Lcom/seeclickfix/ma/android/objects/report/RequestType;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "requestType"    # Lcom/seeclickfix/ma/android/objects/report/RequestType;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 157
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f03005b

    invoke-static {v2, v3, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 158
    const/4 v2, 0x1

    invoke-virtual {p2, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 160
    const v2, 0x7f0a016e

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 161
    .local v1, "text":Landroid/widget/TextView;
    const v2, 0x7f0a016d

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 162
    .local v0, "header":Landroid/widget/TextView;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getHeaderTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    return-object p2
.end method

.method private getNormalView(Lcom/seeclickfix/ma/android/objects/report/RequestType;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "requestType"    # Lcom/seeclickfix/ma/android/objects/report/RequestType;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 147
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f03005c

    invoke-static {v1, v2, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 148
    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 150
    const v1, 0x7f0a016e

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 151
    .local v0, "text":Landroid/widget/TextView;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    return-object p2
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 119
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 121
    .local v0, "requestType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getViewType()Ljava/lang/String;

    move-result-object v2

    const/4 v1, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 131
    invoke-direct {p0, v0, p2, p3}, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->getNormalView(Lcom/seeclickfix/ma/android/objects/report/RequestType;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 135
    :goto_1
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 137
    return-object p2

    .line 121
    :sswitch_0
    const-string/jumbo v3, "req_type_blank_view"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v3, "req_type_button_view"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v3, "req_type_normal_view"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    .line 124
    :pswitch_0
    invoke-direct {p0, v0, p2, p3}, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->getBlankView(Lcom/seeclickfix/ma/android/objects/report/RequestType;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 125
    goto :goto_1

    .line 127
    :pswitch_1
    invoke-direct {p0, v0, p2, p3}, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->getClickableView(Lcom/seeclickfix/ma/android/objects/report/RequestType;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 128
    goto :goto_1

    .line 121
    :sswitch_data_0
    .sparse-switch
        0x94e9b8e -> :sswitch_1
        0x629c4ef9 -> :sswitch_2
        0x74560734 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 52
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 57
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public getList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    return-object v0
.end method

.method public getSelectionById(Ljava/lang/String;)I
    .locals 3
    .param p1, "requestTypeId"    # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 178
    .local v1, "reqType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getApiId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 181
    iget-object v2, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v2

    .line 185
    .end local v1    # "reqType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 96
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 97
    .local v0, "data":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    if-nez p2, :cond_0

    .line 98
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f03005c

    invoke-static {v2, v3, p3}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 101
    :cond_0
    const v2, 0x7f0a016e

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 104
    .local v1, "text":Landroid/widget/TextView;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 107
    return-object p2
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 79
    const/4 v0, 0x0

    .line 81
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->list:Ljava/util/List;

    .line 42
    return-void
.end method
