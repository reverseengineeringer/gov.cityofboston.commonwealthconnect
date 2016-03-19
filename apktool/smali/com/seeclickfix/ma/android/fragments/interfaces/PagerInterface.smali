.class public interface abstract Lcom/seeclickfix/ma/android/fragments/interfaces/PagerInterface;
.super Ljava/lang/Object;
.source "PagerInterface.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;


# virtual methods
.method public abstract clearFooterContainer()V
.end method

.method public abstract getButtonContainer()Landroid/view/ViewGroup;
.end method

.method public abstract getFooterContainer()Landroid/view/ViewGroup;
.end method

.method public abstract setCurrentPage(I)V
.end method

.method public abstract setPageByPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
.end method

.method public abstract showCustomButton(Landroid/view/View;)V
.end method

.method public abstract showCustomFooter(Landroid/view/ViewGroup;)V
.end method
