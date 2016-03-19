.class public Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;
.super Ljava/lang/Object;
.source "EnhancedWatchAreas.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/objects/types/FeedItem;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "enhanced_watch_areas"
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "EnhancedWatchAreas"


# instance fields
.field private apiId:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "api_id"
    .end annotation
.end field

.field private backgroundColor:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h_background_color"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "background_color"
    .end annotation
.end field

.field private buttonColor:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h_button_color"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "button_color"
    .end annotation
.end field

.field private createdAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "created_at"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "created_at"
    .end annotation
.end field

.field private transient dao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private demoCode:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "demo_code"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "demo_code"
    .end annotation
.end field

.field private description:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "description"
    .end annotation
.end field

.field private highlightColor:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h_highlight_color"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "highlight_color"
    .end annotation
.end field

.field private transient id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        allowGeneratedIdInsert = true
        columnName = "id"
        generatedId = true
    .end annotation
.end field

.field private transient index:I

.field private logoURL:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "header_path"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "logo_url"
    .end annotation
.end field

.field private mobileButtonsDb:Lcom/j256/ormlite/dao/ForeignCollection;
    .annotation runtime Lcom/j256/ormlite/field/ForeignCollectionField;
        eager = true
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            ">;"
        }
    .end annotation
.end field

.field private mobileButtonsWithDefaults:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "mobile_buttons_with_defaults"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            ">;"
        }
    .end annotation
.end field

.field private startGradientButtonColor:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h_start_gradient_button_color"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "start_gradient_button_color"
    .end annotation
.end field

.field private textColor:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "h_text_color"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "text_color"
    .end annotation
.end field

.field private title:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "title"
    .end annotation
.end field

.field private updatedAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "updated_at"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "updated_at"
    .end annotation
.end field

.field private zoneWrapper:Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
        foreignAutoCreate = true
        foreignAutoRefresh = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsWithDefaults:Ljava/util/List;

    return-void
.end method

.method private getNewEmpty()Lcom/j256/ormlite/dao/ForeignCollection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/ForeignCollection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            ">;"
        }
    .end annotation

    .prologue
    .line 296
    const/4 v1, 0x0

    .line 298
    .local v1, "collection":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 304
    .local v0, "areaDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Ljava/lang/Integer;>;"
    if-eqz v0, :cond_0

    .line 305
    :try_start_0
    const-string/jumbo v2, "mobileButtonsDb"

    invoke-interface {v0, v2}, Lcom/j256/ormlite/dao/Dao;->getEmptyForeignCollection(Ljava/lang/String;)Lcom/j256/ormlite/dao/ForeignCollection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 311
    :cond_0
    :goto_0
    return-object v1

    .line 307
    :catch_0
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method public color(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p1, "rawColorString"    # Ljava/lang/String;
    .param p2, "defaultColorString"    # Ljava/lang/String;

    .prologue
    .line 194
    :try_start_0
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 196
    :goto_0
    return v1

    .line 195
    :catch_0
    move-exception v0

    .line 196
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    goto :goto_0
.end method

.method public getApiId()I
    .locals 1

    .prologue
    .line 334
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->apiId:I

    return v0
.end method

.method public getBackgroundColor()I
    .locals 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->backgroundColor:Ljava/lang/String;

    const-string/jumbo v1, "#FFFFFF"

    invoke-virtual {p0, v0, v1}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->color(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getButtonColor()I
    .locals 2

    .prologue
    .line 270
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->buttonColor:Ljava/lang/String;

    const-string/jumbo v1, "#f06d1e"

    invoke-virtual {p0, v0, v1}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->color(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getCreatedAt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->createdAt:Ljava/lang/String;

    return-object v0
.end method

.method public getDao()Lcom/j256/ormlite/dao/Dao;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 288
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->dao:Lcom/j256/ormlite/dao/Dao;

    return-object v0
.end method

.method public getDemoCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->demoCode:Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 149
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->id:I

    return v0
.end method

.method public getLogoURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->logoURL:Ljava/lang/String;

    return-object v0
.end method

.method public getMobileButtonsWithDefaults()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            ">;"
        }
    .end annotation

    .prologue
    .line 249
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsDb:Lcom/j256/ormlite/dao/ForeignCollection;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->getNewEmpty()Lcom/j256/ormlite/dao/ForeignCollection;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsDb:Lcom/j256/ormlite/dao/ForeignCollection;

    .line 251
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsWithDefaults:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsDb:Lcom/j256/ormlite/dao/ForeignCollection;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/ForeignCollection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsWithDefaults:Ljava/util/List;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsDb:Lcom/j256/ormlite/dao/ForeignCollection;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 256
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsWithDefaults:Ljava/util/List;

    return-object v0

    .line 249
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsDb:Lcom/j256/ormlite/dao/ForeignCollection;

    goto :goto_0
.end method

.method public getStartGradientButtonColor()I
    .locals 2

    .prologue
    .line 219
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->startGradientButtonColor:Ljava/lang/String;

    const-string/jumbo v1, "#f06d1e"

    invoke-virtual {p0, v0, v1}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->color(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getTextColor()I
    .locals 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->textColor:Ljava/lang/String;

    const-string/jumbo v1, "#000000"

    invoke-virtual {p0, v0, v1}, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->color(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdatedAt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->updatedAt:Ljava/lang/String;

    return-object v0
.end method

.method public getZeroBasedIndex()I
    .locals 1

    .prologue
    .line 324
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->index:I

    return v0
.end method

.method public getZoneWrapper()Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;
    .locals 1

    .prologue
    .line 315
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->zoneWrapper:Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    return-object v0
.end method

.method public setApiId(I)V
    .locals 0
    .param p1, "apiId"    # I

    .prologue
    .line 338
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->apiId:I

    .line 339
    return-void
.end method

.method public setBackgroundColor(Ljava/lang/String;)V
    .locals 0
    .param p1, "backgroundColor"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->backgroundColor:Ljava/lang/String;

    .line 206
    return-void
.end method

.method public setButtonColor(Ljava/lang/String;)V
    .locals 0
    .param p1, "buttonColor"    # Ljava/lang/String;

    .prologue
    .line 274
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->buttonColor:Ljava/lang/String;

    .line 275
    return-void
.end method

.method public setCreatedAt(Ljava/lang/String;)V
    .locals 0
    .param p1, "createdAt"    # Ljava/lang/String;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->createdAt:Ljava/lang/String;

    .line 181
    return-void
.end method

.method public setDao(Lcom/j256/ormlite/dao/Dao;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 292
    .local p1, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->dao:Lcom/j256/ormlite/dao/Dao;

    .line 293
    return-void
.end method

.method public setDemoCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "demoCode"    # Ljava/lang/String;

    .prologue
    .line 244
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->demoCode:Ljava/lang/String;

    .line 245
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->description:Ljava/lang/String;

    .line 172
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 153
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->id:I

    .line 154
    return-void
.end method

.method public setLogoURL(Ljava/lang/String;)V
    .locals 0
    .param p1, "logoURL"    # Ljava/lang/String;

    .prologue
    .line 234
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->logoURL:Ljava/lang/String;

    .line 235
    return-void
.end method

.method public setMobileButtonsWithDefaults(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 263
    .local p1, "mobileButtonsWithDefaults":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsWithDefaults:Ljava/util/List;

    .line 266
    return-void
.end method

.method public setStartGradientButtonColor(Ljava/lang/String;)V
    .locals 0
    .param p1, "startGradientButtonColor"    # Ljava/lang/String;

    .prologue
    .line 224
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->startGradientButtonColor:Ljava/lang/String;

    .line 225
    return-void
.end method

.method public setTextColor(Ljava/lang/String;)V
    .locals 0
    .param p1, "textColor"    # Ljava/lang/String;

    .prologue
    .line 214
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->textColor:Ljava/lang/String;

    .line 215
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->title:Ljava/lang/String;

    .line 163
    return-void
.end method

.method public setUpdatedAt(Ljava/lang/String;)V
    .locals 0
    .param p1, "updatedAt"    # Ljava/lang/String;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->updatedAt:Ljava/lang/String;

    .line 190
    return-void
.end method

.method public setZeroBasedIndex(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 329
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->index:I

    .line 331
    return-void
.end method

.method public setZoneWrapper(Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;)V
    .locals 0
    .param p1, "zoneWrapper"    # Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    .prologue
    .line 319
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->zoneWrapper:Lcom/seeclickfix/ma/android/objects/zone/ZoneWrapper;

    .line 320
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 280
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "EnhancedWatchAreas [id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", title="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", description="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", createdAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->createdAt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", updatedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->updatedAt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", backgroundColor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->backgroundColor:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", textColor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->textColor:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", highlightColor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->highlightColor:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", startGradientButtonColor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->startGradientButtonColor:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", buttonColor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->buttonColor:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", logoURL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->logoURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", demoCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->demoCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", mobileButtonsWithDefaults=\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;->mobileButtonsWithDefaults:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
