.class public Lcom/seeclickfix/ma/android/objects/loc/City;
.super Ljava/lang/Object;
.source "City.java"


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "cities"
.end annotation


# instance fields
.field public id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        allowGeneratedIdInsert = true
        columnName = "_id"
        generatedId = true
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "name"
    .end annotation
.end field

.field public population:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "population"
    .end annotation
.end field

.field public state:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        columnName = "state"
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
