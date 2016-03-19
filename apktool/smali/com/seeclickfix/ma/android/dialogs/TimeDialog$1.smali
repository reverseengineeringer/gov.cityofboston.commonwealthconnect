.class Lcom/seeclickfix/ma/android/dialogs/TimeDialog$1;
.super Ljava/lang/Object;
.source "TimeDialog.java"

# interfaces
.implements Lnet/simonvt/timepicker/TimePicker$OnTimeChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/dialogs/TimeDialog;)V
    .locals 0

    .prologue
    .line 146
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog$1;->this$0:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimeChanged(Lnet/simonvt/timepicker/TimePicker;II)V
    .locals 1
    .param p1, "view"    # Lnet/simonvt/timepicker/TimePicker;
    .param p2, "hourOfDay"    # I
    .param p3, "minute"    # I

    .prologue
    .line 150
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog$1;->this$0:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    # setter for: Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mHour:I
    invoke-static {v0, p2}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->access$002(Lcom/seeclickfix/ma/android/dialogs/TimeDialog;I)I

    .line 151
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/TimeDialog$1;->this$0:Lcom/seeclickfix/ma/android/dialogs/TimeDialog;

    # setter for: Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->mMinute:I
    invoke-static {v0, p3}, Lcom/seeclickfix/ma/android/dialogs/TimeDialog;->access$102(Lcom/seeclickfix/ma/android/dialogs/TimeDialog;I)I

    .line 152
    return-void
.end method
