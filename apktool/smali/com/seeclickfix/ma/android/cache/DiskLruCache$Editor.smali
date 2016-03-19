.class public final Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
.super Ljava/lang/Object;
.source "DiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/cache/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Editor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor$FaultHidingOutputStream;
    }
.end annotation


# instance fields
.field private final entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

.field private hasErrors:Z

.field final synthetic this$0:Lcom/seeclickfix/ma/android/cache/DiskLruCache;


# direct methods
.method private constructor <init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)V
    .locals 0
    .param p2, "entry"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .prologue
    .line 782
    iput-object p1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->this$0:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 783
    iput-object p2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    .line 784
    return-void
.end method

.method synthetic constructor <init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    .param p3, "x2"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;

    .prologue
    .line 778
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;-><init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    .prologue
    .line 778
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    .param p1, "x1"    # Z

    .prologue
    .line 778
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->hasErrors:Z

    return p1
.end method


# virtual methods
.method public abort()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 858
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->this$0:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    const/4 v1, 0x0

    # invokes: Lcom/seeclickfix/ma/android/cache/DiskLruCache;->completeEdit(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->access$1900(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)V

    .line 859
    return-void
.end method

.method public commit()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 845
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->hasErrors:Z

    if-eqz v0, :cond_0

    .line 846
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->this$0:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    const/4 v1, 0x0

    # invokes: Lcom/seeclickfix/ma/android/cache/DiskLruCache;->completeEdit(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->access$1900(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)V

    .line 847
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->this$0:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$1100(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->remove(Ljava/lang/String;)Z

    .line 851
    :goto_0
    return-void

    .line 849
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->this$0:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    const/4 v1, 0x1

    # invokes: Lcom/seeclickfix/ma/android/cache/DiskLruCache;->completeEdit(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->access$1900(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Z)V

    goto :goto_0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 807
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->newInputStream(I)Ljava/io/InputStream;

    move-result-object v0

    .line 808
    .local v0, "in":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    # invokes: Lcom/seeclickfix/ma/android/cache/DiskLruCache;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->access$1600(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public newInputStream(I)Ljava/io/InputStream;
    .locals 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 791
    iget-object v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->this$0:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    monitor-enter v1

    .line 792
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$700(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 793
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 799
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 795
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->readable:Z
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$600(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 796
    const/4 v0, 0x0

    monitor-exit v1

    .line 798
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    invoke-virtual {v2, p1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public newOutputStream(I)Ljava/io/OutputStream;
    .locals 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 819
    iget-object v1, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->this$0:Lcom/seeclickfix/ma/android/cache/DiskLruCache;

    monitor-enter v1

    .line 820
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->currentEditor:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->access$700(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 821
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 824
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 823
    :cond_0
    :try_start_1
    new-instance v0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor$FaultHidingOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->entry:Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;

    invoke-virtual {v3, p1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/4 v3, 0x0

    invoke-direct {v0, p0, v2, v3}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor$FaultHidingOutputStream;-><init>(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;Ljava/io/OutputStream;Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;)V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v0
.end method

.method public set(ILjava/lang/String;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 831
    const/4 v0, 0x0

    .line 833
    .local v0, "writer":Ljava/io/Writer;
    :try_start_0
    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v2

    # getter for: Lcom/seeclickfix/ma/android/cache/DiskLruCache;->UTF_8:Ljava/nio/charset/Charset;
    invoke-static {}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->access$1800()Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 834
    .end local v0    # "writer":Ljava/io/Writer;
    .local v1, "writer":Ljava/io/Writer;
    :try_start_1
    invoke-virtual {v1, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 836
    invoke-static {v1}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->closeQuietly(Ljava/io/Closeable;)V

    .line 838
    return-void

    .line 836
    .end local v1    # "writer":Ljava/io/Writer;
    .restart local v0    # "writer":Ljava/io/Writer;
    :catchall_0
    move-exception v2

    :goto_0
    invoke-static {v0}, Lcom/seeclickfix/ma/android/cache/DiskLruCache;->closeQuietly(Ljava/io/Closeable;)V

    throw v2

    .end local v0    # "writer":Ljava/io/Writer;
    .restart local v1    # "writer":Ljava/io/Writer;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "writer":Ljava/io/Writer;
    .restart local v0    # "writer":Ljava/io/Writer;
    goto :goto_0
.end method
