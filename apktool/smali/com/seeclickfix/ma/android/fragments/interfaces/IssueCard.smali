.class public interface abstract Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;
.super Ljava/lang/Object;
.source "IssueCard.java"


# virtual methods
.method public abstract recordVote(Lcom/seeclickfix/ma/android/objects/issue/Vote;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
.end method

.method public abstract revokeVote(Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
.end method

.method public abstract updateComment(Lcom/seeclickfix/ma/android/objects/issue/Comment;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
.end method

.method public abstract updateFollow(Lcom/seeclickfix/ma/android/objects/issue/Follow;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
.end method

.method public abstract updateStatus(Lcom/seeclickfix/ma/android/objects/issue/Transition;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
.end method
