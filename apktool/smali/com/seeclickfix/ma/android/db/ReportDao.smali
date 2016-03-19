.class public Lcom/seeclickfix/ma/android/db/ReportDao;
.super Lcom/j256/ormlite/dao/BaseDaoImpl;
.source "ReportDao.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/j256/ormlite/dao/BaseDaoImpl",
        "<",
        "Lcom/seeclickfix/ma/android/objects/report/Report;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)V
    .locals 0
    .param p1, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/support/ConnectionSource;",
            "Ljava/lang/Class",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Report;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 12
    .local p2, "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/seeclickfix/ma/android/objects/report/Report;>;"
    invoke-direct {p0, p1, p2}, Lcom/j256/ormlite/dao/BaseDaoImpl;-><init>(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)V

    .line 13
    return-void
.end method
