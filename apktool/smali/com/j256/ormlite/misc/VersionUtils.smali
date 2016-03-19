.class public Lcom/j256/ormlite/misc/VersionUtils;
.super Ljava/lang/Object;
.source "VersionUtils.java"


# static fields
.field private static final CORE_VERSION:Ljava/lang/String; = "VERSION__4.47__"

.field private static coreVersion:Ljava/lang/String;

.field private static logger:Lcom/j256/ormlite/logger/Logger;

.field private static thrownOnErrors:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-boolean v0, Lcom/j256/ormlite/misc/VersionUtils;->thrownOnErrors:Z

    .line 17
    const-string/jumbo v0, "VERSION__4.47__"

    sput-object v0, Lcom/j256/ormlite/misc/VersionUtils;->coreVersion:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    return-void
.end method

.method public static final checkCoreVersusAndroidVersions(Ljava/lang/String;)V
    .locals 3
    .param p0, "androidVersion"    # Ljava/lang/String;

    .prologue
    .line 34
    const-string/jumbo v0, "core"

    sget-object v1, Lcom/j256/ormlite/misc/VersionUtils;->coreVersion:Ljava/lang/String;

    const-string/jumbo v2, "android"

    invoke-static {v0, v1, v2, p0}, Lcom/j256/ormlite/misc/VersionUtils;->logVersionWarnings(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method public static final checkCoreVersusJdbcVersions(Ljava/lang/String;)V
    .locals 3
    .param p0, "jdbcVersion"    # Ljava/lang/String;

    .prologue
    .line 27
    const-string/jumbo v0, "core"

    sget-object v1, Lcom/j256/ormlite/misc/VersionUtils;->coreVersion:Ljava/lang/String;

    const-string/jumbo v2, "jdbc"

    invoke-static {v0, v1, v2, p0}, Lcom/j256/ormlite/misc/VersionUtils;->logVersionWarnings(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    return-void
.end method

.method public static getCoreVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/j256/ormlite/misc/VersionUtils;->coreVersion:Ljava/lang/String;

    return-object v0
.end method

.method private static getLogger()Lcom/j256/ormlite/logger/Logger;
    .locals 1

    .prologue
    .line 79
    sget-object v0, Lcom/j256/ormlite/misc/VersionUtils;->logger:Lcom/j256/ormlite/logger/Logger;

    if-nez v0, :cond_0

    .line 80
    const-class v0, Lcom/j256/ormlite/misc/VersionUtils;

    invoke-static {v0}, Lcom/j256/ormlite/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    sput-object v0, Lcom/j256/ormlite/misc/VersionUtils;->logger:Lcom/j256/ormlite/logger/Logger;

    .line 82
    :cond_0
    sget-object v0, Lcom/j256/ormlite/misc/VersionUtils;->logger:Lcom/j256/ormlite/logger/Logger;

    return-object v0
.end method

.method private static logVersionWarnings(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p0, "label1"    # Ljava/lang/String;
    .param p1, "version1"    # Ljava/lang/String;
    .param p2, "label2"    # Ljava/lang/String;
    .param p3, "version2"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 52
    if-nez p1, :cond_1

    .line 53
    if-eqz p3, :cond_0

    .line 54
    const-string/jumbo v0, "Unknown version"

    const-string/jumbo v1, " for {}, version for {} is \'{}\'"

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p0, v2, v3

    aput-object p2, v2, v4

    aput-object p3, v2, v5

    invoke-static {v7, v0, v1, v2}, Lcom/j256/ormlite/misc/VersionUtils;->warning(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 66
    :cond_0
    :goto_0
    return-void

    .line 58
    :cond_1
    if-nez p3, :cond_2

    .line 59
    const-string/jumbo v0, "Unknown version"

    const-string/jumbo v1, " for {}, version for {} is \'{}\'"

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p2, v2, v3

    aput-object p0, v2, v4

    aput-object p1, v2, v5

    invoke-static {v7, v0, v1, v2}, Lcom/j256/ormlite/misc/VersionUtils;->warning(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 61
    :cond_2
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 62
    const-string/jumbo v0, "Mismatched versions"

    const-string/jumbo v1, ": {} is \'{}\', while {} is \'{}\'"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v3

    aput-object p1, v2, v4

    aput-object p2, v2, v5

    aput-object p3, v2, v6

    invoke-static {v7, v0, v1, v2}, Lcom/j256/ormlite/misc/VersionUtils;->warning(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method static setThrownOnErrors(Z)V
    .locals 0
    .param p0, "thrownOnErrors"    # Z

    .prologue
    .line 45
    sput-boolean p0, Lcom/j256/ormlite/misc/VersionUtils;->thrownOnErrors:Z

    .line 46
    return-void
.end method

.method private static warning(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 3
    .param p0, "th"    # Ljava/lang/Throwable;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 69
    invoke-static {}, Lcom/j256/ormlite/misc/VersionUtils;->getLogger()Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1, p3}, Lcom/j256/ormlite/logger/Logger;->warn(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 70
    sget-boolean v0, Lcom/j256/ormlite/misc/VersionUtils;->thrownOnErrors:Z

    if-eqz v0, :cond_0

    .line 71
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "See error log for details:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_0
    return-void
.end method
