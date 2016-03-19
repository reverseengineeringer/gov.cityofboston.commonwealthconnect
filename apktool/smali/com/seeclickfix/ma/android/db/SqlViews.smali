.class public Lcom/seeclickfix/ma/android/db/SqlViews;
.super Ljava/lang/Object;
.source "SqlViews.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/db/SqlViews$Tables;
    }
.end annotation


# static fields
.field public static final issuesByPlaceSQLString:Ljava/lang/String; = "CREATE VIEW IF NOT EXISTS issues_by_place AS SELECT DISTINCT i.id as id,i.user_id as user_id,i.address as address,i.description as description,i.lat as lat,i.lng as lng,i.anonymize_reporter as anonymize_reporter,i.summary as summary,i.num_comments as num_comments,i.bitly as bitly,i.slug as slug,i.rating as rating,i.status as status,i.type as type,i.updated_at as updated_at,i.updated_at_raw as updated_at_raw,i.comment_count_excluding_activity as comment_count_excluding_activity,i.following as following,i.icon_square as icon_square,i.photo_large_url as photo_large_url,i.photo_small_url as photo_small_url,i.photo_square_url as photo_square_url,i.minutes_since_created as minutes_since_created,i.voted_before as voted_before,i.created_at_epoch as created_at_epoch,i.created_at as created_at,i.reporter_display as reporter_display,p.id as place_id FROM issues i, places p, issue_place_join j WHERE j.place_id = p.id AND j.issue_id = i.id"


# instance fields
.field issueByPlaceRowMapper:Lcom/j256/ormlite/dao/RawRowMapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/RawRowMapper",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lcom/seeclickfix/ma/android/db/SqlViews$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/db/SqlViews$1;-><init>(Lcom/seeclickfix/ma/android/db/SqlViews;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/db/SqlViews;->issueByPlaceRowMapper:Lcom/j256/ormlite/dao/RawRowMapper;

    return-void
.end method
