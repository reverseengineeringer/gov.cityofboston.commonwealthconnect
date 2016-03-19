.class public Lcom/seeclickfix/ma/android/auth/ProfileController;
.super Ljava/lang/Object;
.source "ProfileController.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ProfileController"

.field private static instance:Lcom/seeclickfix/ma/android/auth/ProfileController;


# instance fields
.field private avatarBitmap:Landroid/graphics/Bitmap;

.field private c:Landroid/content/Context;

.field private container:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

.field errorListener:Lcom/android/volley/Response$ErrorListener;

.field listener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private mUser:Lcom/seeclickfix/ma/android/objects/user/User;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Lcom/seeclickfix/ma/android/auth/ProfileController$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/auth/ProfileController$1;-><init>(Lcom/seeclickfix/ma/android/auth/ProfileController;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->listener:Lcom/android/volley/Response$Listener;

    .line 97
    new-instance v0, Lcom/seeclickfix/ma/android/auth/ProfileController$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/auth/ProfileController$2;-><init>(Lcom/seeclickfix/ma/android/auth/ProfileController;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 46
    :try_start_0
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/squareup/otto/Bus;->register(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    :goto_0
    return-void

    .line 47
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/auth/ProfileController;)Lcom/seeclickfix/ma/android/objects/user/User;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/auth/ProfileController;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    return-object v0
.end method

.method static synthetic access$002(Lcom/seeclickfix/ma/android/auth/ProfileController;Lcom/seeclickfix/ma/android/objects/user/User;)Lcom/seeclickfix/ma/android/objects/user/User;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/auth/ProfileController;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/objects/user/User;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    return-object p1
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/auth/ProfileController;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/auth/ProfileController;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->c:Landroid/content/Context;

    return-object v0
.end method

.method public static getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/seeclickfix/ma/android/auth/ProfileController;->instance:Lcom/seeclickfix/ma/android/auth/ProfileController;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lcom/seeclickfix/ma/android/auth/ProfileController;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/auth/ProfileController;-><init>()V

    sput-object v0, Lcom/seeclickfix/ma/android/auth/ProfileController;->instance:Lcom/seeclickfix/ma/android/auth/ProfileController;

    .line 58
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/auth/ProfileController;->instance:Lcom/seeclickfix/ma/android/auth/ProfileController;

    return-object v0
.end method

.method public static resetAvatar()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 188
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;

    move-result-object v0

    iput-object v1, v0, Lcom/seeclickfix/ma/android/auth/ProfileController;->avatarBitmap:Landroid/graphics/Bitmap;

    .line 189
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/ProfileController;->getInstance()Lcom/seeclickfix/ma/android/auth/ProfileController;

    move-result-object v0

    iput-object v1, v0, Lcom/seeclickfix/ma/android/auth/ProfileController;->container:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    .line 190
    return-void
.end method


# virtual methods
.method public clearUser(Landroid/content/Context;)V
    .locals 2
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 120
    iput-object v1, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    .line 121
    const-string/jumbo v0, "user_profile_json"

    invoke-static {v0, v1, p1}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 122
    return-void
.end method

.method public getUserIfAvail(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/user/User;
    .locals 5
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 126
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    if-nez v3, :cond_0

    .line 128
    :try_start_0
    const-string/jumbo v3, "user_profile_json"

    const/4 v4, 0x0

    invoke-static {v3, v4, p1}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getString(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "jsonString":Ljava/lang/String;
    new-instance v1, Lcom/seeclickfix/ma/android/net/DeserializeResponse;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;-><init>()V

    .line 132
    .local v1, "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/User;>;"
    const-class v3, Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/net/DeserializeResponse;->getJavaObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v0

    .line 134
    .local v0, "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/User;>;"
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/user/User;

    iput-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    .end local v0    # "deserializedArray":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/user/User;>;"
    .end local v1    # "deserializer":Lcom/seeclickfix/ma/android/net/DeserializeResponse;, "Lcom/seeclickfix/ma/android/net/DeserializeResponse<Lcom/seeclickfix/ma/android/objects/user/User;>;"
    .end local v2    # "jsonString":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    return-object v3

    .line 135
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public loadUserProfile(Lcom/seeclickfix/ma/android/objects/user/AuthUser;Landroid/content/Context;)V
    .locals 4
    .param p1, "authUser"    # Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 65
    iput-object p2, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->c:Landroid/content/Context;

    .line 66
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/GetUserProfileTask;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/user/AuthUser;->getUserID()I

    move-result v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->listener:Lcom/android/volley/Response$Listener;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->errorListener:Lcom/android/volley/Response$ErrorListener;

    invoke-direct {v0, p2, v1, v2, v3}, Lcom/seeclickfix/ma/android/tasks/GetUserProfileTask;-><init>(Landroid/content/Context;ILcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetUserProfileTask;->execute()V

    .line 67
    return-void
.end method

.method public produceLoginState()Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;
    .locals 2
    .annotation runtime Lcom/squareup/otto/Produce;
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    if-nez v0, :cond_0

    .line 112
    const/4 v0, 0x0

    .line 114
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;-><init>(Lcom/seeclickfix/ma/android/objects/user/User;)V

    goto :goto_0
.end method

.method public setUserAvatar(Landroid/content/Context;Landroid/widget/ImageView;I)V
    .locals 5
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "imageView"    # Landroid/widget/ImageView;
    .param p3, "defaultResId"    # I

    .prologue
    .line 148
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    if-eqz v3, :cond_0

    .line 150
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->avatarBitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_3

    .line 151
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 153
    .local v0, "currentDrawable":Landroid/graphics/drawable/BitmapDrawable;
    if-nez v0, :cond_1

    .line 154
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->avatarBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 185
    .end local v0    # "currentDrawable":Landroid/graphics/drawable/BitmapDrawable;
    :cond_0
    :goto_0
    return-void

    .line 156
    .restart local v0    # "currentDrawable":Landroid/graphics/drawable/BitmapDrawable;
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    if-nez v3, :cond_2

    .line 157
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->avatarBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 159
    :cond_2
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    iget-object v4, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->avatarBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 163
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->avatarBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 166
    .end local v0    # "currentDrawable":Landroid/graphics/drawable/BitmapDrawable;
    :cond_3
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->container:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->container:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v3}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    if-nez v3, :cond_6

    .line 167
    :cond_4
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/user/User;->getAvatarSquareImage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 168
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getBaseUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->mUser:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/user/User;->getAvatarSquareImage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 169
    .local v2, "userAvatarSquareURL":Ljava/lang/String;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getImageLoader()Lcom/android/volley/toolbox/ImageLoader;

    move-result-object v1

    .line 171
    .local v1, "loader":Lcom/android/volley/toolbox/ImageLoader;
    invoke-static {p2, p3, p3}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object v3

    iput-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->container:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    goto :goto_0

    .line 174
    .end local v1    # "loader":Lcom/android/volley/toolbox/ImageLoader;
    .end local v2    # "userAvatarSquareURL":Ljava/lang/String;
    :cond_5
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 177
    :cond_6
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->container:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v3}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 179
    iget-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->container:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v3}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/seeclickfix/ma/android/auth/ProfileController;->avatarBitmap:Landroid/graphics/Bitmap;

    goto :goto_0
.end method
