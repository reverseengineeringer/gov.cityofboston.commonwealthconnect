.class public Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;
.super Ljava/lang/Object;
.source "MobileButtonsWithDefaults.java"


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "mobile_buttons"
.end annotation


# static fields
.field public static final REPORT_URI:Ljava/lang/String; = "scf://report"


# instance fields
.field private action:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private enhancedWatchArea:Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        foreign = true
        foreignAutoCreate = true
        foreignAutoRefresh = true
    .end annotation
.end field

.field private icon:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "icon_name"
    .end annotation

    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private transient id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        allowGeneratedIdInsert = true
        generatedId = true
    .end annotation
.end field

.field private label:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private uri:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->action:Ljava/lang/String;

    return-object v0
.end method

.method public getEnhancedWatchArea()Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->enhancedWatchArea:Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    return-object v0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->icon:Ljava/lang/String;

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->label:Ljava/lang/String;

    return-object v0
.end method

.method public getUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public setAction(Ljava/lang/String;)V
    .locals 0
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->action:Ljava/lang/String;

    .line 75
    return-void
.end method

.method public setEnhancedWatchArea(Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;)V
    .locals 0
    .param p1, "enhancedWatchArea"    # Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->enhancedWatchArea:Lcom/seeclickfix/ma/android/objects/zone/EnhancedWatchAreas;

    .line 95
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 0
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->icon:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->label:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->uri:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "MobileButtonsWithDefaults [label="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", icon="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->icon:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", action="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->action:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", uri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
