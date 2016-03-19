.class public final Lcom/seeclickfix/ma/android/cache/DiskLruCache;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;,
        Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;,
        Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    }
.end annotation


# static fields
.field static final ANY_SEQUENCE_NUMBER:J = -0x1L

.field private static final CLEAN:Ljava/lang/String; = "CLEAN"

.field private static final DIRTY:Ljava/lang/String; = "DIRTY"

.field private static final IO_BUFFER_SIZE:I = 0x2000

.field static final JOURNAL_FILE:Ljava/lang/String; = "journal"

.field static final JOURNAL_FILE_TMP:Ljava/lang/String; = "journal.tmp"

.field static final MAGIC:Ljava/lang/String; = "libcore.io.DiskLruCache"

.field private static final READ:Ljava/lang/String; = "READ"

.field private static final REMOVE:Ljava/lang/String; = "REMOVE"

.field private static final UTF_8:Ljava/nio/charset/Charset;

.field static final VERSION_1:Ljava/lang/String; = "1"


# instance fields
.field private final appVersion:I

.field private final cleanupCallable:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final directory:Ljava/io/File;

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private final journalFile:Ljava/io/File;

.field private final journalFileTmp:Ljava/io/File;

.field private journalWriter:Ljava/io/Writer;

.field private final lruEntries:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private final maxSize:J

.field private nextSequenceNumber:J

.field private redundantOpCount:I

.field private size:J

.field private final valueCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 111
    const-string/jumbo v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->UTF_8:Ljava/nio/charset/Charset;

    return-void
.end method

.method private constructor <init>(Ljava/io/File;IIJ)V
    .locals 8
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "appVersion"    # I
    .param p3, "valueCount"    # I
    .param p4, "maxSize"    # J

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 291
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    iput-wide v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J

    .line 162
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {v0, v2, v1, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 171
    iput-wide v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->nextSequenceNumber:J

    .line 272
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v4, 0x3c

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 274
    new-instance v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;-><init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    .line 292
    iput-object p1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->directory:Ljava/io/File;

    .line 293
    iput p2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->appVersion:I

    .line 294
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "journal"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFile:Ljava/io/File;

    .line 295
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "journal.tmp"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFileTmp:Ljava/io/File;

    .line 296
    iput p3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    .line 297
    iput-wide p4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->maxSize:J

    .line 298
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/cache/DiskLruCache;)Ljava/io/Writer;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    .prologue
    .line 100
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/cache/DiskLruCache;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->trimToSize()V

    return-void
.end method

.method static synthetic access$1500(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Ljava/lang/String;J)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    .locals 2
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-direct {p0, p1, p2, p3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1600(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-static {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 100
    sget-object v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->UTF_8:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    .param p2, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->completeEdit(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/cache/DiskLruCache;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    .prologue
    .line 100
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalRebuildRequired()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2100(Lcom/seeclickfix/ma/android/cache/DiskLruCache;)I
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    .prologue
    .line 100
    iget v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    return v0
.end method

.method static synthetic access$2200(Lcom/seeclickfix/ma/android/cache/DiskLruCache;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    .prologue
    .line 100
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/cache/DiskLruCache;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->rebuildJournal()V

    return-void
.end method

.method static synthetic access$402(Lcom/seeclickfix/ma/android/cache/DiskLruCache;I)I
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    .param p1, "x1"    # I

    .prologue
    .line 100
    iput p1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->redundantOpCount:I

    return p1
.end method

.method private checkNotClosed()V
    .locals 2

    .prologue
    .line 670
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    if-nez v0, :cond_0

    .line 671
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "cache is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 673
    :cond_0
    return-void
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .locals 2
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 240
    if-eqz p0, :cond_0

    .line 242
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 243
    :catch_0
    move-exception v0

    .line 244
    .local v0, "rethrown":Ljava/lang/RuntimeException;
    throw v0

    .line 245
    .end local v0    # "rethrown":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private declared-synchronized completeEdit(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)V
    .locals 12
    .param p1, "editor"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    .param p2, "success"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 569
    monitor-enter p0

    :try_start_0
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->access$1400(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    move-result-object v2

    .line 570
    .local v2, "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$700(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v8

    if-eq v8, p1, :cond_0

    .line 571
    new-instance v8, Ljava/lang/IllegalStateException;

    invoke-direct {v8}, Ljava/lang/IllegalStateException;-><init>()V

    throw v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 569
    .end local v2    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8

    .line 575
    .restart local v2    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    :cond_0
    if-eqz p2, :cond_2

    :try_start_1
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$600(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 576
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    if-ge v3, v8, :cond_2

    .line 577
    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_1

    .line 578
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->abort()V

    .line 579
    new-instance v8, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "edit didn\'t create file "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 576
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 584
    .end local v3    # "i":I
    :cond_2
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_1
    iget v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    if-ge v3, v8, :cond_5

    .line 585
    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v1

    .line 586
    .local v1, "dirty":Ljava/io/File;
    if-eqz p2, :cond_4

    .line 587
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 588
    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v0

    .line 589
    .local v0, "clean":Ljava/io/File;
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 590
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1000(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)[J

    move-result-object v8

    aget-wide v6, v8, v3

    .line 591
    .local v6, "oldLength":J
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 592
    .local v4, "newLength":J
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1000(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)[J

    move-result-object v8

    aput-wide v4, v8, v3

    .line 593
    iget-wide v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J

    sub-long/2addr v8, v6

    add-long/2addr v8, v4

    iput-wide v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J

    .line 584
    .end local v0    # "clean":Ljava/io/File;
    .end local v4    # "newLength":J
    .end local v6    # "oldLength":J
    :cond_3
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 596
    :cond_4
    invoke-static {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    goto :goto_2

    .line 600
    .end local v1    # "dirty":Ljava/io/File;
    :cond_5
    iget v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->redundantOpCount:I

    .line 601
    const/4 v8, 0x0

    # setter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v2, v8}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$702(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    .line 602
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$600(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Z

    move-result v8

    or-int/2addr v8, p2

    if-eqz v8, :cond_9

    .line 603
    const/4 v8, 0x1

    # setter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->readable:Z
    invoke-static {v2, v8}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$602(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Z)Z

    .line 604
    iget-object v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "CLEAN "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1100(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getLengths()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 605
    if-eqz p2, :cond_6

    .line 606
    iget-wide v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->nextSequenceNumber:J

    const-wide/16 v10, 0x1

    add-long/2addr v10, v8

    iput-wide v10, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->nextSequenceNumber:J

    # setter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v2, v8, v9}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1202(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;J)J

    .line 613
    :cond_6
    :goto_3
    iget-wide v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J

    iget-wide v10, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->maxSize:J

    cmp-long v8, v8, v10

    if-gtz v8, :cond_7

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalRebuildRequired()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 614
    :cond_7
    iget-object v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->executorService:Ljava/util/concurrent/ExecutorService;

    iget-object v9, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-interface {v8, v9}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 616
    :cond_8
    monitor-exit p0

    return-void

    .line 609
    :cond_9
    :try_start_2
    iget-object v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1100(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 610
    iget-object v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "REMOVE "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1100(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3
.end method

.method private static copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;
    .locals 5
    .param p1, "start"    # I
    .param p2, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;II)[TT;"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "original":[Ljava/lang/Object;, "[TT;"
    array-length v1, p0

    .line 177
    .local v1, "originalLength":I
    if-le p1, p2, :cond_0

    .line 178
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 180
    :cond_0
    if-ltz p1, :cond_1

    if-le p1, v1, :cond_2

    .line 181
    :cond_1
    new-instance v4, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v4

    .line 183
    :cond_2
    sub-int v3, p2, p1

    .line 184
    .local v3, "resultLength":I
    sub-int v4, v1, p1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 185
    .local v0, "copyLength":I
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/Object;

    move-object v2, v4

    check-cast v2, [Ljava/lang/Object;

    .line 187
    .local v2, "result":[Ljava/lang/Object;, "[TT;"
    const/4 v4, 0x0

    invoke-static {p0, p1, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 188
    return-object v2
.end method

.method public static deleteContents(Ljava/io/File;)V
    .locals 8
    .param p0, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 256
    .local v2, "files":[Ljava/io/File;
    if-nez v2, :cond_0

    .line 257
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "not a directory: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 259
    :cond_0
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_3

    aget-object v1, v0, v3

    .line 260
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 261
    invoke-static {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->deleteContents(Ljava/io/File;)V

    .line 263
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v5

    if-nez v5, :cond_2

    .line 264
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "failed to delete file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 259
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 267
    .end local v1    # "file":Ljava/io/File;
    :cond_3
    return-void
.end method

.method private static deleteIfExists(Ljava/io/File;)V
    .locals 1
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 466
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 467
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 469
    :cond_0
    return-void
.end method

.method private declared-synchronized edit(Ljava/lang/String;J)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "expectedSequenceNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 521
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->checkNotClosed()V

    .line 522
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 523
    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .line 524
    .local v1, "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    const-wide/16 v2, -0x1

    cmp-long v2, p2, v2

    if-eqz v2, :cond_1

    if-eqz v1, :cond_0

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1200(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    cmp-long v2, v2, p2

    if-eqz v2, :cond_1

    .line 541
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v0

    .line 528
    :cond_1
    if-nez v1, :cond_3

    .line 529
    :try_start_1
    new-instance v1, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .end local v1    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;-><init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Ljava/lang/String;Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;)V

    .line 530
    .restart local v1    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    :cond_2
    new-instance v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;-><init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;)V

    .line 536
    .local v0, "editor":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    # setter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v1, v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$702(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    .line 539
    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "DIRTY "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 540
    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v2}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 521
    .end local v0    # "editor":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    .end local v1    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 531
    .restart local v1    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    :cond_3
    :try_start_2
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$700(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    if-eqz v2, :cond_2

    goto :goto_0
.end method

.method private static inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 727
    new-instance v0, Ljava/io/InputStreamReader;

    sget-object v1, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private journalRebuildRequired()Z
    .locals 3

    .prologue
    .line 623
    const/16 v0, 0x7d0

    .line 624
    .local v0, "REDUNDANT_OP_COMPACT_THRESHOLD":I
    iget v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->redundantOpCount:I

    const/16 v2, 0x7d0

    if-lt v1, v2, :cond_0

    iget v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->redundantOpCount:I

    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static open(Ljava/io/File;IIJ)Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    .locals 9
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "appVersion"    # I
    .param p2, "valueCount"    # I
    .param p3, "maxSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    const-wide/16 v2, 0x0

    cmp-long v1, p3, v2

    if-gtz v1, :cond_0

    .line 313
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "maxSize <= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 315
    :cond_0
    if-gtz p2, :cond_1

    .line 316
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "valueCount <= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 320
    :cond_1
    new-instance v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;-><init>(Ljava/io/File;IIJ)V

    .line 321
    .local v0, "cache":Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    iget-object v1, v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 323
    :try_start_0
    invoke-direct {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->readJournal()V

    .line 324
    invoke-direct {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->processJournal()V

    .line 325
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/FileWriter;

    iget-object v3, v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFile:Ljava/io/File;

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    const/16 v3, 0x2000

    invoke-direct {v1, v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V

    iput-object v1, v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v6, v0

    .line 339
    .end local v0    # "cache":Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    .local v6, "cache":Ljava/lang/Object;
    :goto_0
    return-object v6

    .line 328
    .end local v6    # "cache":Ljava/lang/Object;
    .restart local v0    # "cache":Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    :catch_0
    move-exception v7

    .line 331
    .local v7, "journalIsCorrupt":Ljava/io/IOException;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->delete()V

    .line 336
    .end local v7    # "journalIsCorrupt":Ljava/io/IOException;
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 337
    new-instance v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    .end local v0    # "cache":Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    move-object v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;-><init>(Ljava/io/File;IIJ)V

    .line 338
    .restart local v0    # "cache":Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    invoke-direct {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->rebuildJournal()V

    move-object v6, v0

    .line 339
    .restart local v6    # "cache":Ljava/lang/Object;
    goto :goto_0
.end method

.method private processJournal()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 407
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 408
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 409
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .line 410
    .local v0, "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$700(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v3

    if-nez v3, :cond_1

    .line 411
    const/4 v2, 0x0

    .local v2, "t":I
    :goto_1
    iget v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_0

    .line 412
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1000(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)[J

    move-result-object v3

    aget-wide v6, v3, v2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J

    .line 411
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 415
    .end local v2    # "t":I
    :cond_1
    const/4 v3, 0x0

    # setter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0, v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$702(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    .line 416
    const/4 v2, 0x0

    .restart local v2    # "t":I
    :goto_2
    iget v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_2

    .line 417
    invoke-virtual {v0, v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 418
    invoke-virtual {v0, v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 416
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 420
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 423
    .end local v0    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    .end local v2    # "t":I
    :cond_3
    return-void
.end method

.method public static readAsciiLine(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 5
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x50

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 220
    .local v2, "result":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 221
    .local v0, "c":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 222
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 223
    :cond_0
    const/16 v3, 0xa

    if-ne v0, v3, :cond_2

    .line 229
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    .line 230
    .local v1, "length":I
    if-lez v1, :cond_1

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0xd

    if-ne v3, v4, :cond_1

    .line 231
    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 233
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 227
    .end local v1    # "length":I
    :cond_2
    int-to-char v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public static readFully(Ljava/io/Reader;)Ljava/lang/String;
    .locals 4
    .param p0, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    :try_start_0
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 197
    .local v2, "writer":Ljava/io/StringWriter;
    const/16 v3, 0x400

    new-array v0, v3, [C

    .line 199
    .local v0, "buffer":[C
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    .local v1, "count":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    .line 200
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/StringWriter;->write([CII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 204
    .end local v0    # "buffer":[C
    .end local v1    # "count":I
    .end local v2    # "writer":Ljava/io/StringWriter;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Ljava/io/Reader;->close()V

    throw v3

    .line 202
    .restart local v0    # "buffer":[C
    .restart local v1    # "count":I
    .restart local v2    # "writer":Ljava/io/StringWriter;
    :cond_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    .line 204
    invoke-virtual {p0}, Ljava/io/Reader;->close()V

    return-object v3
.end method

.method private readJournal()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v7, Ljava/io/FileInputStream;

    iget-object v8, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-direct {v7, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 v8, 0x2000

    invoke-direct {v3, v7, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 345
    .local v3, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->readAsciiLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v4

    .line 346
    .local v4, "magic":Ljava/lang/String;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->readAsciiLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v6

    .line 347
    .local v6, "version":Ljava/lang/String;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->readAsciiLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 348
    .local v0, "appVersionString":Ljava/lang/String;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->readAsciiLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v5

    .line 349
    .local v5, "valueCountString":Ljava/lang/String;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->readAsciiLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    .line 350
    .local v1, "blank":Ljava/lang/String;
    const-string/jumbo v7, "libcore.io.DiskLruCache"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const-string/jumbo v7, "1"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget v7, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->appVersion:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget v7, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const-string/jumbo v7, ""

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 355
    :cond_0
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "unexpected journal header: ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 367
    .end local v0    # "appVersionString":Ljava/lang/String;
    .end local v1    # "blank":Ljava/lang/String;
    .end local v4    # "magic":Ljava/lang/String;
    .end local v5    # "valueCountString":Ljava/lang/String;
    .end local v6    # "version":Ljava/lang/String;
    :catchall_0
    move-exception v7

    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->closeQuietly(Ljava/io/Closeable;)V

    throw v7

    .line 361
    .restart local v0    # "appVersionString":Ljava/lang/String;
    .restart local v1    # "blank":Ljava/lang/String;
    .restart local v4    # "magic":Ljava/lang/String;
    .restart local v5    # "valueCountString":Ljava/lang/String;
    .restart local v6    # "version":Ljava/lang/String;
    :cond_1
    :goto_0
    :try_start_1
    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->readAsciiLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->readJournalLine(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 362
    :catch_0
    move-exception v2

    .line 367
    .local v2, "endOfJournal":Ljava/io/EOFException;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->closeQuietly(Ljava/io/Closeable;)V

    .line 369
    return-void
.end method

.method private readJournalLine(Ljava/lang/String;)V
    .locals 9
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x2

    .line 372
    const-string/jumbo v3, " "

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 373
    .local v2, "parts":[Ljava/lang/String;
    array-length v3, v2

    if-ge v3, v5, :cond_0

    .line 374
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "unexpected journal line: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 377
    :cond_0
    aget-object v1, v2, v8

    .line 378
    .local v1, "key":Ljava/lang/String;
    aget-object v3, v2, v6

    const-string/jumbo v4, "REMOVE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    array-length v3, v2

    if-ne v3, v5, :cond_2

    .line 379
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    :cond_1
    :goto_0
    return-void

    .line 383
    :cond_2
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .line 384
    .local v0, "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    if-nez v0, :cond_3

    .line 385
    new-instance v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .end local v0    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    invoke-direct {v0, p0, v1, v7}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;-><init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Ljava/lang/String;Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;)V

    .line 386
    .restart local v0    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    :cond_3
    aget-object v3, v2, v6

    const-string/jumbo v4, "CLEAN"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    array-length v3, v2

    iget v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    add-int/lit8 v4, v4, 0x2

    if-ne v3, v4, :cond_4

    .line 390
    # setter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->readable:Z
    invoke-static {v0, v8}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$602(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Z)Z

    .line 391
    # setter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0, v7}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$702(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    .line 392
    array-length v3, v2

    invoke-static {v2, v5, v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    # invokes: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->setLengths([Ljava/lang/String;)V
    invoke-static {v0, v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$800(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;[Ljava/lang/String;)V

    goto :goto_0

    .line 393
    :cond_4
    aget-object v3, v2, v6

    const-string/jumbo v4, "DIRTY"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    array-length v3, v2

    if-ne v3, v5, :cond_5

    .line 394
    new-instance v3, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    invoke-direct {v3, p0, v0, v7}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;-><init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;)V

    # setter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0, v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$702(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    goto :goto_0

    .line 395
    :cond_5
    aget-object v3, v2, v6

    const-string/jumbo v4, "READ"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    array-length v3, v2

    if-eq v3, v5, :cond_1

    .line 398
    :cond_6
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "unexpected journal line: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private declared-synchronized rebuildJournal()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 430
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    if-eqz v3, :cond_0

    .line 431
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v3}, Ljava/io/Writer;->close()V

    .line 434
    :cond_0
    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/FileWriter;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    const/16 v4, 0x2000

    invoke-direct {v2, v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V

    .line 435
    .local v2, "writer":Ljava/io/Writer;
    const-string/jumbo v3, "libcore.io.DiskLruCache"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 436
    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 437
    const-string/jumbo v3, "1"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 438
    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 439
    iget v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->appVersion:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 440
    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 441
    iget v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 442
    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 443
    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 445
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .line 446
    .local v0, "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$700(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 447
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "DIRTY "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1100(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 430
    .end local v0    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "writer":Ljava/io/Writer;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 449
    .restart local v0    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "writer":Ljava/io/Writer;
    :cond_1
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "CLEAN "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1100(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getLengths()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 453
    .end local v0    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    :cond_2
    invoke-virtual {v2}, Ljava/io/Writer;->close()V

    .line 454
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFileTmp:Ljava/io/File;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 455
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/FileWriter;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalFile:Ljava/io/File;

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    const/16 v5, 0x2000

    invoke-direct {v3, v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V

    iput-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 456
    monitor-exit p0

    return-void
.end method

.method private trimToSize()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 702
    :goto_0
    iget-wide v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J

    iget-wide v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->maxSize:J

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 704
    iget-object v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 705
    .local v0, "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->remove(Ljava/lang/String;)Z

    goto :goto_0

    .line 707
    .end local v0    # "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;>;"
    :cond_0
    return-void
.end method

.method private validateKey(Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 720
    const-string/jumbo v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "\r"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 721
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "keys must not contain spaces or newlines: \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 724
    :cond_1
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 688
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 699
    :goto_0
    monitor-exit p0

    return-void

    .line 691
    :cond_0
    :try_start_1
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .line 692
    .local v0, "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$700(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 693
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$700(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->abort()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 688
    .end local v0    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 696
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    :try_start_2
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->trimToSize()V

    .line 697
    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v2}, Ljava/io/Writer;->close()V

    .line 698
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 715
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->close()V

    .line 716
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->directory:Ljava/io/File;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->deleteContents(Ljava/io/File;)V

    .line 717
    return-void
.end method

.method public edit(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 517
    const-wide/16 v0, -0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 679
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->checkNotClosed()V

    .line 680
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->trimToSize()V

    .line 681
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 682
    monitor-exit p0

    return-void

    .line 679
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    .locals 10
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 477
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->checkNotClosed()V

    .line 478
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 479
    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 480
    .local v8, "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    if-nez v8, :cond_1

    .line 509
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v1

    .line 484
    :cond_1
    :try_start_1
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->readable:Z
    invoke-static {v8}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$600(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 493
    iget v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    new-array v6, v2, [Ljava/io/InputStream;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 495
    .local v6, "ins":[Ljava/io/InputStream;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    :try_start_2
    iget v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    if-ge v9, v2, :cond_2

    .line 496
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {v8, v9}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    aput-object v2, v6, v9
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 495
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 498
    :catch_0
    move-exception v0

    .line 500
    .local v0, "e":Ljava/io/FileNotFoundException;
    goto :goto_0

    .line 503
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :cond_2
    :try_start_3
    iget v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->redundantOpCount:I

    .line 504
    iget-object v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "READ "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 505
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalRebuildRequired()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 506
    iget-object v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->executorService:Ljava/util/concurrent/ExecutorService;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 509
    :cond_3
    new-instance v1, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v8}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1200(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)J

    move-result-wide v4

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v7}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;-><init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 477
    .end local v6    # "ins":[Ljava/io/InputStream;
    .end local v8    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    .end local v9    # "i":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 548
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 666
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public maxSize()J
    .locals 2

    .prologue
    .line 556
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->maxSize:J

    return-wide v0
.end method

.method public declared-synchronized remove(Ljava/lang/String;)Z
    .locals 8
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 635
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->checkNotClosed()V

    .line 636
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 637
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .line 638
    .local v0, "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    if-eqz v0, :cond_0

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$700(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    if-eqz v3, :cond_1

    .line 639
    :cond_0
    const/4 v3, 0x0

    .line 659
    :goto_0
    monitor-exit p0

    return v3

    .line 642
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    :try_start_1
    iget v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_3

    .line 643
    invoke-virtual {v0, v2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v1

    .line 644
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_2

    .line 645
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "failed to delete "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 635
    .end local v0    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 647
    .restart local v0    # "entry":Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "i":I
    :cond_2
    :try_start_2
    iget-wide v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1000(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)[J

    move-result-object v3

    aget-wide v6, v3, v2

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J

    .line 648
    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1000(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)[J

    move-result-object v3

    const-wide/16 v4, 0x0

    aput-wide v4, v3, v2

    .line 642
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 651
    .end local v1    # "file":Ljava/io/File;
    :cond_3
    iget v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->redundantOpCount:I

    .line 652
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "REMOVE "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 653
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 655
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->journalRebuildRequired()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 656
    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->executorService:Ljava/util/concurrent/ExecutorService;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 659
    :cond_4
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public declared-synchronized size()J
    .locals 2

    .prologue
    .line 565
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->size:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
