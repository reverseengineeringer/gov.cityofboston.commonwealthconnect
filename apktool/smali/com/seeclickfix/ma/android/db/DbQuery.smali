.class public interface abstract Lcom/seeclickfix/ma/android/db/DbQuery;
.super Ljava/lang/Object;
.source "DbQuery.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract getPreparedQuery(Landroid/content/Context;)Lcom/j256/ormlite/stmt/PreparedQuery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<TT;>;"
        }
    .end annotation
.end method

.method public abstract getRawQuery(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract setPreparedQuery(Lcom/j256/ormlite/stmt/PreparedQuery;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/stmt/PreparedQuery",
            "<TT;>;)V"
        }
    .end annotation
.end method
