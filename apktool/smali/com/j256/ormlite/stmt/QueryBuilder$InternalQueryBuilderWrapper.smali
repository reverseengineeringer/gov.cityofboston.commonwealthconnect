.class public Lcom/j256/ormlite/stmt/QueryBuilder$InternalQueryBuilderWrapper;
.super Ljava/lang/Object;
.source "QueryBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/j256/ormlite/stmt/QueryBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InternalQueryBuilderWrapper"
.end annotation


# instance fields
.field private final queryBuilder:Lcom/j256/ormlite/stmt/QueryBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/stmt/QueryBuilder",
            "<**>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/j256/ormlite/stmt/QueryBuilder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/QueryBuilder",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 814
    .local p1, "queryBuilder":Lcom/j256/ormlite/stmt/QueryBuilder;, "Lcom/j256/ormlite/stmt/QueryBuilder<**>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 815
    iput-object p1, p0, Lcom/j256/ormlite/stmt/QueryBuilder$InternalQueryBuilderWrapper;->queryBuilder:Lcom/j256/ormlite/stmt/QueryBuilder;

    .line 816
    return-void
.end method


# virtual methods
.method public appendStatementString(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Lcom/j256/ormlite/stmt/ArgumentHolder;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 819
    .local p2, "argList":Ljava/util/List;, "Ljava/util/List<Lcom/j256/ormlite/stmt/ArgumentHolder;>;"
    iget-object v0, p0, Lcom/j256/ormlite/stmt/QueryBuilder$InternalQueryBuilderWrapper;->queryBuilder:Lcom/j256/ormlite/stmt/QueryBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/j256/ormlite/stmt/QueryBuilder;->appendStatementString(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 820
    return-void
.end method

.method public getResultFieldTypes()[Lcom/j256/ormlite/field/FieldType;
    .locals 1

    .prologue
    .line 823
    iget-object v0, p0, Lcom/j256/ormlite/stmt/QueryBuilder$InternalQueryBuilderWrapper;->queryBuilder:Lcom/j256/ormlite/stmt/QueryBuilder;

    invoke-virtual {v0}, Lcom/j256/ormlite/stmt/QueryBuilder;->getResultFieldTypes()[Lcom/j256/ormlite/field/FieldType;

    move-result-object v0

    return-object v0
.end method
