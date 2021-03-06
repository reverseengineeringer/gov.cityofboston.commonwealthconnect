.class Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ActionBarDrawerToggle.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/actionbarsherlock/app/ActionBarDrawerToggle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SlideDrawable"
.end annotation


# instance fields
.field private mOffset:F

.field private mOffsetBy:F

.field private final mTmpRect:Landroid/graphics/Rect;

.field private mWrapped:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "wrapped"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 276
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 274
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mTmpRect:Landroid/graphics/Rect;

    .line 277
    iput-object p1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    .line 278
    return-void
.end method


# virtual methods
.method public clearColorFilter()V
    .locals 1

    .prologue
    .line 340
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 341
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 296
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 297
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 298
    iget v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mOffsetBy:F

    iget-object v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mOffset:F

    neg-float v1, v1

    mul-float/2addr v0, v1

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 299
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 300
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 301
    return-void
.end method

.method public getChangingConfigurations()I
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    return v0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    .prologue
    .line 417
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    return-object v0
.end method

.method public getCurrent()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 397
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 392
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    return v0
.end method

.method public getMinimumHeight()I
    .locals 1

    .prologue
    .line 407
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v0

    return v0
.end method

.method public getMinimumWidth()I
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v0

    return v0
.end method

.method public getOffset()F
    .locals 1

    .prologue
    .line 286
    iget v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mOffset:F

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 370
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .locals 1
    .param p1, "padding"    # Landroid/graphics/Rect;

    .prologue
    .line 412
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result v0

    return v0
.end method

.method public getState()[I
    .locals 1

    .prologue
    .line 355
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    return-object v0
.end method

.method public getTransparentRegion()Landroid/graphics/Region;
    .locals 1

    .prologue
    .line 375
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getTransparentRegion()Landroid/graphics/Region;

    move-result-object v0

    return-object v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 422
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_0

    .line 423
    invoke-virtual {p0}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->invalidateSelf()V

    .line 425
    :cond_0
    return-void
.end method

.method public isStateful()Z
    .locals 1

    .prologue
    .line 345
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 386
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 387
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 388
    return-void
.end method

.method protected onStateChange([I)Z
    .locals 1
    .param p1, "state"    # [I

    .prologue
    .line 380
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 381
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onStateChange([I)Z

    move-result v0

    return v0
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .locals 1
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;
    .param p3, "when"    # J

    .prologue
    .line 429
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_0

    .line 430
    invoke-virtual {p0, p2, p3, p4}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 432
    :cond_0
    return-void
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "alpha"    # I

    .prologue
    .line 325
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 326
    return-void
.end method

.method public setChangingConfigurations(I)V
    .locals 1
    .param p1, "configs"    # I

    .prologue
    .line 305
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 306
    return-void
.end method

.method public setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
    .locals 1
    .param p1, "color"    # I
    .param p2, "mode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 335
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 336
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 330
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 331
    return-void
.end method

.method public setDither(Z)V
    .locals 1
    .param p1, "dither"    # Z

    .prologue
    .line 315
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    .line 316
    return-void
.end method

.method public setFilterBitmap(Z)V
    .locals 1
    .param p1, "filter"    # Z

    .prologue
    .line 320
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 321
    return-void
.end method

.method public setOffset(F)V
    .locals 0
    .param p1, "offset"    # F

    .prologue
    .line 281
    iput p1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mOffset:F

    .line 282
    invoke-virtual {p0}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->invalidateSelf()V

    .line 283
    return-void
.end method

.method public setOffsetBy(F)V
    .locals 0
    .param p1, "offsetBy"    # F

    .prologue
    .line 290
    iput p1, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mOffsetBy:F

    .line 291
    invoke-virtual {p0}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->invalidateSelf()V

    .line 292
    return-void
.end method

.method public setState([I)Z
    .locals 1
    .param p1, "stateSet"    # [I

    .prologue
    .line 350
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    return v0
.end method

.method public setVisible(ZZ)Z
    .locals 1
    .param p1, "visible"    # Z
    .param p2, "restart"    # Z

    .prologue
    .line 365
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v0

    return v0
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 436
    iget-object v0, p0, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->mWrapped:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_0

    .line 437
    invoke-virtual {p0, p2}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle$SlideDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 439
    :cond_0
    return-void
.end method
