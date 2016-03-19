.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V
    .locals 0

    .prologue
    .line 289
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 11
    .param p1, "id"    # I
    .param p2, "args"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v10, 0x0

    .line 296
    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    new-instance v8, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    iget-object v9, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v9}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v9

    invoke-direct {v8, v9, v4, v10}, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    # setter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    invoke-static {v7, v8}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$002(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    .line 298
    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 299
    .local v1, "context":Landroid/content/Context;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/providers/DataProvider;->getSearchCitiesUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v2

    .line 300
    .local v2, "uri":Landroid/net/Uri;
    const/4 v7, 0x4

    new-array v3, v7, [Ljava/lang/String;

    const-string/jumbo v7, "_id"

    aput-object v7, v3, v10

    const/4 v7, 0x1

    const-string/jumbo v8, "name"

    aput-object v8, v3, v7

    const/4 v7, 0x2

    const-string/jumbo v8, "state"

    aput-object v8, v3, v7

    const/4 v7, 0x3

    const-string/jumbo v8, "population"

    aput-object v8, v3, v7

    .line 302
    .local v3, "projection":[Ljava/lang/String;
    const/4 v5, 0x0

    .line 303
    .local v5, "selectionArgs":[Ljava/lang/String;
    const/4 v6, 0x0

    .line 305
    .local v6, "sortOrder":Ljava/lang/String;
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .local v0, "autoCompleteLoader":Landroid/support/v4/content/CursorLoader;
    return-object v0
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 4
    .param p2, "cur"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 312
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 334
    :goto_0
    return-void

    .line 319
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 320
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 321
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/widget/AutoCompleteTextView;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 322
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/widget/AutoCompleteTextView;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->autoCompleteListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    goto :goto_0

    .line 328
    :catch_0
    move-exception v0

    goto :goto_0

    .line 324
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    new-instance v1, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, p2, v3}, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    # setter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$002(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    .line 325
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/widget/AutoCompleteTextView;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 326
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/widget/AutoCompleteTextView;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->autoCompleteListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Landroid/support/v4/content/Loader;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 289
    check-cast p2, Landroid/database/Cursor;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    const/4 v1, 0x0

    .line 338
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 339
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 340
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # setter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$002(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    .line 342
    :cond_0
    return-void
.end method
