.class public Lcom/seeclickfix/ma/android/style/StyleUtil;
.super Ljava/lang/Object;
.source "StyleUtil.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "StyleUtil"

.field private static face:Landroid/graphics/Typeface;

.field private static faceBold:Landroid/graphics/Typeface;

.field private static logoface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendNotPublicString(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 6
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 294
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v2, 0x7f0c0108

    invoke-virtual {p2, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 296
    .local v1, "nonPubStr":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    .line 297
    .local v4, "colorNormal":I
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f08001e

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    .local v5, "colorNonPub":I
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    .line 299
    invoke-static/range {v0 .. v5}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setTwoColorsTextStrings(Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;II)V

    .line 300
    return-void
.end method

.method public static appendReqAndNotPub(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 8
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 303
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v3, 0x7f0c0125

    invoke-virtual {p2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 304
    .local v1, "reqStr":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v3, 0x7f0c0108

    invoke-virtual {p2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 306
    .local v2, "nonPubStr":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v5

    .line 307
    .local v5, "colorNormal":I
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f08001e

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    .line 308
    .local v7, "colorNonPub":I
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f080037

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    .local v6, "colorRequired":I
    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    .line 310
    invoke-static/range {v0 .. v7}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setThreeColorsTextStrings(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;III)V

    .line 311
    return-void
.end method

.method public static appendRequiredString(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 6
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 284
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v2, 0x7f0c0125

    invoke-virtual {p2, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 286
    .local v1, "reqStr":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    .line 287
    .local v4, "colorNormal":I
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f080037

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    .local v5, "colorRequired":I
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    .line 289
    invoke-static/range {v0 .. v5}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setTwoColorsTextStrings(Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;II)V

    .line 290
    return-void
.end method

.method public static final getLogoTypeFace(Landroid/content/Context;)Landroid/graphics/Typeface;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 57
    sget-object v0, Lcom/seeclickfix/ma/android/style/StyleUtil;->logoface:Landroid/graphics/Typeface;

    if-nez v0, :cond_0

    .line 58
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string/jumbo v1, "AvantGaurdGothicDemi.otf"

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/style/StyleUtil;->logoface:Landroid/graphics/Typeface;

    .line 60
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/style/StyleUtil;->logoface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public static final getTypeFace(Landroid/content/Context;)Landroid/graphics/Typeface;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 50
    sget-object v0, Lcom/seeclickfix/ma/android/style/StyleUtil;->face:Landroid/graphics/Typeface;

    if-nez v0, :cond_0

    .line 51
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string/jumbo v1, "OpenSansSemibold.ttf"

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/style/StyleUtil;->face:Landroid/graphics/Typeface;

    .line 53
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/style/StyleUtil;->face:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public static final getTypeFaceBold(Landroid/content/Context;)Landroid/graphics/Typeface;
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 64
    sget-object v0, Lcom/seeclickfix/ma/android/style/StyleUtil;->faceBold:Landroid/graphics/Typeface;

    if-nez v0, :cond_0

    .line 65
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string/jumbo v1, "OpenSansSemibold.ttf"

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/style/StyleUtil;->faceBold:Landroid/graphics/Typeface;

    .line 67
    :cond_0
    sget-object v0, Lcom/seeclickfix/ma/android/style/StyleUtil;->faceBold:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public static setActionBarBasic(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 7
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "actionBarTextView"    # Landroid/widget/TextView;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 73
    :try_start_0
    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 78
    .local v3, "spnstr1":Landroid/text/SpannableString;
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f080020

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    .line 80
    .local v2, "lightgrey":I
    const/4 v4, 0x0

    .line 81
    .local v4, "start":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 83
    .local v1, "len":I
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v5, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v6, 0x12

    invoke-virtual {v3, v5, v4, v1, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 85
    invoke-static {v3}, Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;

    move-result-object v0

    .line 86
    .local v0, "fullString":Landroid/text/SpannableString;
    const/high16 v5, 0x41800000    # 16.0f

    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 87
    sget-object v5, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {p1, v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 89
    invoke-static {p1, p2}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setTypeFace(Landroid/widget/TextView;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .end local v0    # "fullString":Landroid/text/SpannableString;
    .end local v1    # "len":I
    .end local v2    # "lightgrey":I
    .end local v3    # "spnstr1":Landroid/text/SpannableString;
    .end local v4    # "start":I
    :goto_0
    return-void

    .line 90
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public static setActionBarSubBasic(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 9
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "actionBarTextView"    # Landroid/widget/TextView;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 101
    :try_start_0
    new-instance v4, Landroid/text/SpannableString;

    invoke-direct {v4, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 106
    .local v4, "spnstr1":Landroid/text/SpannableString;
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f080030

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    .line 108
    .local v2, "lightgrey":I
    const/4 v5, 0x0

    .line 109
    .local v5, "start":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 111
    .local v1, "len":I
    new-instance v6, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v6, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v7, 0x12

    invoke-virtual {v4, v6, v5, v1, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 113
    invoke-static {v4}, Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;

    move-result-object v0

    .line 114
    .local v0, "fullString":Landroid/text/SpannableString;
    const/high16 v6, 0x41600000    # 14.0f

    invoke-virtual {p1, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 115
    sget-object v6, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {p1, v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 117
    invoke-static {p1, p2}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setTypeFace(Landroid/widget/TextView;Landroid/content/Context;)V

    .line 121
    const/4 v6, 0x2

    invoke-static {v6}, Lcom/seeclickfix/ma/android/util/DisplayUtil;->getPixelsForDp(I)I

    move-result v3

    .line 122
    .local v3, "padding":I
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {p1, v6, v3, v7, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 124
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .end local v0    # "fullString":Landroid/text/SpannableString;
    .end local v1    # "len":I
    .end local v2    # "lightgrey":I
    .end local v3    # "padding":I
    .end local v4    # "spnstr1":Landroid/text/SpannableString;
    .end local v5    # "start":I
    :goto_0
    return-void

    .line 126
    :catch_0
    move-exception v6

    goto :goto_0
.end method

.method public static setActionBarTextColors(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 20
    .param p0, "actionBarTextView"    # Landroid/widget/TextView;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 136
    const v18, 0x7f0c013a

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 137
    .local v15, "str1":Ljava/lang/String;
    const v18, 0x7f0c0016

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 138
    .local v16, "str2":Ljava/lang/String;
    const v18, 0x7f0c007e

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 140
    .local v17, "str3":Ljava/lang/String;
    new-instance v9, Landroid/text/SpannableString;

    invoke-direct {v9, v15}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 141
    .local v9, "spnstr1":Landroid/text/SpannableString;
    new-instance v10, Landroid/text/SpannableString;

    move-object/from16 v0, v16

    invoke-direct {v10, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 142
    .local v10, "spnstr2":Landroid/text/SpannableString;
    new-instance v11, Landroid/text/SpannableString;

    move-object/from16 v0, v17

    invoke-direct {v11, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 147
    .local v11, "spnstr3":Landroid/text/SpannableString;
    const-string/jumbo v18, "#FFEF7F25"

    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    .line 148
    .local v8, "orange":I
    const-string/jumbo v18, "#FF2486B5"

    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    .line 149
    .local v2, "blue":I
    const-string/jumbo v18, "#FF5E5E5E"

    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    .line 151
    .local v3, "darkgrey":I
    const/4 v12, 0x0

    .line 152
    .local v12, "start":I
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v5

    .line 154
    .local v5, "len":I
    const/4 v13, 0x0

    .line 155
    .local v13, "start2":I
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v6

    .line 157
    .local v6, "len2":I
    const/4 v14, 0x0

    .line 158
    .local v14, "start3":I
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v7

    .line 160
    .local v7, "len3":I
    new-instance v18, Landroid/text/style/ForegroundColorSpan;

    move-object/from16 v0, v18

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v19, 0x12

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v9, v0, v12, v5, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 161
    new-instance v18, Landroid/text/style/ForegroundColorSpan;

    move-object/from16 v0, v18

    invoke-direct {v0, v8}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v19, 0x12

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v10, v0, v13, v6, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 162
    new-instance v18, Landroid/text/style/ForegroundColorSpan;

    move-object/from16 v0, v18

    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v19, 0x12

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v11, v0, v14, v7, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 164
    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/CharSequence;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v9, v18, v19

    const/16 v19, 0x1

    aput-object v10, v18, v19

    const/16 v19, 0x2

    aput-object v11, v18, v19

    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;

    move-result-object v4

    .line 166
    .local v4, "fullString":Landroid/text/SpannableString;
    sget-object v18, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 167
    const/high16 v18, 0x41800000    # 16.0f

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 168
    invoke-static/range {p0 .. p1}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setLogoTypeFace(Landroid/widget/TextView;Landroid/content/Context;)V

    .line 169
    return-void
.end method

.method public static setBoldTextStrings(Landroid/text/SpannableString;Landroid/text/SpannableString;Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 6
    .param p0, "spnstr1"    # Landroid/text/SpannableString;
    .param p1, "spnstr2"    # Landroid/text/SpannableString;
    .param p2, "tv"    # Landroid/widget/TextView;
    .param p3, "c"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    .line 227
    const/4 v2, 0x0

    .line 228
    .local v2, "start":I
    invoke-virtual {p0}, Landroid/text/SpannableString;->length()I

    move-result v1

    .line 230
    .local v1, "len":I
    new-instance v3, Landroid/text/style/StyleSpan;

    invoke-direct {v3, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    const/16 v4, 0x21

    invoke-virtual {p0, v3, v2, v1, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 232
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/CharSequence;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    aput-object p1, v3, v5

    invoke-static {v3}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;

    move-result-object v0

    .line 234
    .local v0, "fullString":Landroid/text/SpannableString;
    sget-object v3, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {p2, v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 236
    return-void
.end method

.method public static setLogoTypeFace(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 1
    .param p0, "tv"    # Landroid/widget/TextView;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 45
    invoke-static {p1}, Lcom/seeclickfix/ma/android/style/StyleUtil;->getLogoTypeFace(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 46
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/ViewParent;->recomputeViewAttributes(Landroid/view/View;)V

    .line 47
    return-void
.end method

.method public static setThreeColorsTextStrings(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;III)V
    .locals 13
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "str2"    # Ljava/lang/String;
    .param p2, "str3"    # Ljava/lang/String;
    .param p3, "tv"    # Landroid/widget/TextView;
    .param p4, "c"    # Landroid/content/Context;
    .param p5, "color1"    # I
    .param p6, "color2"    # I
    .param p7, "color3"    # I

    .prologue
    .line 244
    new-instance v5, Landroid/text/SpannableString;

    invoke-direct {v5, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 245
    .local v5, "spnstr1":Landroid/text/SpannableString;
    new-instance v6, Landroid/text/SpannableString;

    invoke-direct {v6, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 246
    .local v6, "spnstr2":Landroid/text/SpannableString;
    new-instance v7, Landroid/text/SpannableString;

    invoke-direct {v7, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 248
    .local v7, "spnstr3":Landroid/text/SpannableString;
    const/4 v8, 0x0

    .line 249
    .local v8, "start":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 251
    .local v2, "len":I
    const/4 v9, 0x0

    .line 252
    .local v9, "start2":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 254
    .local v3, "len2":I
    const/4 v10, 0x0

    .line 255
    .local v10, "start3":I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    .line 257
    .local v4, "len3":I
    new-instance v11, Landroid/text/style/ForegroundColorSpan;

    move/from16 v0, p5

    invoke-direct {v11, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v12, 0x21

    invoke-virtual {v5, v11, v8, v2, v12}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 259
    new-instance v11, Landroid/text/style/ForegroundColorSpan;

    move/from16 v0, p6

    invoke-direct {v11, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v12, 0x21

    invoke-virtual {v6, v11, v9, v3, v12}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 261
    new-instance v11, Landroid/text/style/ForegroundColorSpan;

    move/from16 v0, p7

    invoke-direct {v11, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v12, 0x21

    invoke-virtual {v7, v11, v10, v4, v12}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 263
    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/CharSequence;

    const/4 v12, 0x0

    aput-object v5, v11, v12

    const/4 v12, 0x1

    aput-object v6, v11, v12

    const/4 v12, 0x2

    aput-object v7, v11, v12

    invoke-static {v11}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v11

    invoke-static {v11}, Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;

    move-result-object v1

    .line 265
    .local v1, "fullString":Landroid/text/SpannableString;
    sget-object v11, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    move-object/from16 v0, p3

    invoke-virtual {v0, v1, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 267
    return-void
.end method

.method public static setTwoColorsBoldTextStrings(Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;II)V
    .locals 10
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "str2"    # Ljava/lang/String;
    .param p2, "tv"    # Landroid/widget/TextView;
    .param p3, "c"    # Landroid/content/Context;
    .param p4, "color1"    # I
    .param p5, "color2"    # I

    .prologue
    const/4 v9, 0x1

    const/16 v8, 0x21

    .line 200
    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 201
    .local v3, "spnstr1":Landroid/text/SpannableString;
    new-instance v4, Landroid/text/SpannableString;

    invoke-direct {v4, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 203
    .local v4, "spnstr2":Landroid/text/SpannableString;
    const/4 v5, 0x0

    .line 204
    .local v5, "start":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 206
    .local v1, "len":I
    const/4 v6, 0x0

    .line 207
    .local v6, "start2":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 209
    .local v2, "len2":I
    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v7, p4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v3, v7, v5, v1, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 210
    new-instance v7, Landroid/text/style/StyleSpan;

    invoke-direct {v7, v9}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v3, v7, v5, v1, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 212
    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v7, p5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v4, v7, v6, v2, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 214
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/CharSequence;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    aput-object v4, v7, v9

    invoke-static {v7}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-static {v7}, Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;

    move-result-object v0

    .line 216
    .local v0, "fullString":Landroid/text/SpannableString;
    sget-object v7, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {p2, v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 218
    return-void
.end method

.method public static setTwoColorsTextStrings(Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;II)V
    .locals 9
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "str2"    # Ljava/lang/String;
    .param p2, "tv"    # Landroid/widget/TextView;
    .param p3, "c"    # Landroid/content/Context;
    .param p4, "color1"    # I
    .param p5, "color2"    # I

    .prologue
    const/16 v8, 0x21

    .line 178
    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 179
    .local v3, "spnstr1":Landroid/text/SpannableString;
    new-instance v4, Landroid/text/SpannableString;

    invoke-direct {v4, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 181
    .local v4, "spnstr2":Landroid/text/SpannableString;
    const/4 v5, 0x0

    .line 182
    .local v5, "start":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 184
    .local v1, "len":I
    const/4 v6, 0x0

    .line 185
    .local v6, "start2":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 187
    .local v2, "len2":I
    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v7, p4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v3, v7, v5, v1, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 189
    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v7, p5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v4, v7, v6, v2, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 191
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/CharSequence;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    const/4 v8, 0x1

    aput-object v4, v7, v8

    invoke-static {v7}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-static {v7}, Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;

    move-result-object v0

    .line 193
    .local v0, "fullString":Landroid/text/SpannableString;
    sget-object v7, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {p2, v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 195
    return-void
.end method

.method public static setTypeFace(Landroid/widget/TextView;Landroid/content/Context;)V
    .locals 1
    .param p0, "tv"    # Landroid/widget/TextView;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-static {p1}, Lcom/seeclickfix/ma/android/style/StyleUtil;->getTypeFace(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 41
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/ViewParent;->recomputeViewAttributes(Landroid/view/View;)V

    .line 42
    return-void
.end method
