.class public Lcom/actionbarsherlock/app/ActionBarDrawerToggle;
.super Ljava/lang/Object;
.source "ActionBarDrawerToggle.java"

# interfaces
.implements Landroid/support/v4/widget/DrawerLayout$DrawerListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;
    }
.end annotation


# static fields
.field private static final ID_HOME:I = 0x102002c

.field private static final THEME_ATTRS:[I


# instance fields
.field private final mActionBar:Lcom/actionbarsherlock/app/ActionBar;

.field private final mCloseDrawerContentDescRes:I

.field private final mContext:Landroid/content/Context;

.field private mDrawerImage:Landroid/graphics/drawable/Drawable;

.field private final mDrawerImageResource:I

.field private mDrawerIndicatorEnabled:Z

.field private final mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

.field private final mOpenDrawerContentDescRes:I

.field private mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

.field private mThemeImage:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 60
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    sget v2, Lcom/actionbarsherlock/R$attr;->homeAsUpIndicator:I

    aput v2, v0, v1

    sput-object v0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->THEME_ATTRS:[I

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/actionbarsherlock/app/ActionBar;Landroid/support/v4/widget/DrawerLayout;III)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "actionBar"    # Lcom/actionbarsherlock/app/ActionBar;
    .param p3, "drawerLayout"    # Landroid/support/v4/widget/DrawerLayout;
    .param p4, "drawerImageRes"    # I
    .param p5, "openDrawerContentDescRes"    # I
    .param p6, "closeDrawerContentDescRes"    # I

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    .line 100
    iput-object p1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mContext:Landroid/content/Context;

    .line 101
    iput-object p2, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mActionBar:Lcom/actionbarsherlock/app/ActionBar;

    .line 102
    iput-object p3, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 103
    iput p4, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerImageResource:I

    .line 104
    iput p5, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mOpenDrawerContentDescRes:I

    .line 105
    iput p6, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mCloseDrawerContentDescRes:I

    .line 107
    invoke-direct {p0}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->getThemeUpIndicator()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mThemeImage:Landroid/graphics/drawable/Drawable;

    .line 108
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerImage:Landroid/graphics/drawable/Drawable;

    .line 109
    new-instance v0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerImage:Landroid/graphics/drawable/Drawable;

    invoke-direct {v0, v1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    .line 110
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    const v1, 0x3eaaaaab

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->setOffsetBy(F)V

    .line 111
    return-void
.end method

.method private getThemeUpIndicator()Landroid/graphics/drawable/Drawable;
    .locals 4

    .prologue
    .line 114
    iget-object v2, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mContext:Landroid/content/Context;

    sget-object v3, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->THEME_ATTRS:[I

    invoke-virtual {v2, v3}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 115
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 116
    .local v1, "result":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 117
    return-object v1
.end method


# virtual methods
.method public isDrawerIndicatorEnabled()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 184
    invoke-direct {p0}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->getThemeUpIndicator()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mThemeImage:Landroid/graphics/drawable/Drawable;

    .line 185
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerImageResource:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerImage:Landroid/graphics/drawable/Drawable;

    .line 186
    invoke-virtual {p0}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->syncState()V

    .line 187
    return-void
.end method

.method public onDrawerClosed(Landroid/view/View;)V
    .locals 2
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 252
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->setOffset(F)V

    .line 253
    iget-boolean v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eqz v0, :cond_0

    .line 254
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mActionBar:Lcom/actionbarsherlock/app/ActionBar;

    iget v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mCloseDrawerContentDescRes:I

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setHomeActionContentDescription(I)V

    .line 256
    :cond_0
    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .locals 2
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->setOffset(F)V

    .line 238
    iget-boolean v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eqz v0, :cond_0

    .line 239
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mActionBar:Lcom/actionbarsherlock/app/ActionBar;

    iget v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mOpenDrawerContentDescRes:I

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setHomeActionContentDescription(I)V

    .line 241
    :cond_0
    return-void
.end method

.method public onDrawerSlide(Landroid/view/View;F)V
    .locals 4
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    const/high16 v2, 0x3f000000    # 0.5f

    .line 219
    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    invoke-virtual {v1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->getOffset()F

    move-result v0

    .line 220
    .local v0, "glyphOffset":F
    cmpl-float v1, p2, v2

    if-lez v1, :cond_0

    .line 221
    const/4 v1, 0x0

    sub-float v2, p2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    mul-float/2addr v1, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 225
    :goto_0
    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    invoke-virtual {v1, v0}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->setOffset(F)V

    .line 226
    return-void

    .line 223
    :cond_0
    mul-float v1, p2, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    goto :goto_0
.end method

.method public onDrawerStateChanged(I)V
    .locals 0
    .param p1, "newState"    # I

    .prologue
    .line 267
    return-void
.end method

.method public onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Lcom/actionbarsherlock/view/MenuItem;

    .prologue
    const v2, 0x800003

    .line 199
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/actionbarsherlock/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerVisible(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 201
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(I)V

    .line 206
    :cond_0
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 203
    :cond_1
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(I)V

    goto :goto_0
.end method

.method public setDrawerIndicatorEnabled(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 154
    iget-boolean v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eq p1, v0, :cond_0

    .line 155
    if-eqz p1, :cond_2

    .line 156
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mActionBar:Lcom/actionbarsherlock/app/ActionBar;

    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setHomeAsUpIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 157
    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mActionBar:Lcom/actionbarsherlock/app/ActionBar;

    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const v2, 0x800003

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mOpenDrawerContentDescRes:I

    :goto_0
    invoke-virtual {v1, v0}, Lcom/actionbarsherlock/app/ActionBar;->setHomeActionContentDescription(I)V

    .line 163
    :goto_1
    iput-boolean p1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    .line 165
    :cond_0
    return-void

    .line 157
    :cond_1
    iget v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mCloseDrawerContentDescRes:I

    goto :goto_0

    .line 160
    :cond_2
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mActionBar:Lcom/actionbarsherlock/app/ActionBar;

    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mThemeImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setHomeAsUpIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 161
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mActionBar:Lcom/actionbarsherlock/app/ActionBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setHomeActionContentDescription(I)V

    goto :goto_1
.end method

.method public syncState()V
    .locals 3

    .prologue
    const v2, 0x800003

    .line 130
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 131
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->setOffset(F)V

    .line 136
    :goto_0
    iget-boolean v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mActionBar:Lcom/actionbarsherlock/app/ActionBar;

    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setHomeAsUpIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 138
    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mActionBar:Lcom/actionbarsherlock/app/ActionBar;

    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mOpenDrawerContentDescRes:I

    :goto_1
    invoke-virtual {v1, v0}, Lcom/actionbarsherlock/app/ActionBar;->setHomeActionContentDescription(I)V

    .line 141
    :cond_0
    return-void

    .line 133
    :cond_1
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mSlider:Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->setOffset(F)V

    goto :goto_0

    .line 138
    :cond_2
    iget v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->mCloseDrawerContentDescRes:I

    goto :goto_1
.end method
