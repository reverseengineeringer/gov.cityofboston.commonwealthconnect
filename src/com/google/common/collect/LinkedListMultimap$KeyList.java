package com.google.common.collect;

class LinkedListMultimap$KeyList<K, V>
{
  int count;
  LinkedListMultimap.Node<K, V> head;
  LinkedListMultimap.Node<K, V> tail;
  
  LinkedListMultimap$KeyList(LinkedListMultimap.Node<K, V> paramNode)
  {
    head = paramNode;
    tail = paramNode;
    previousSibling = null;
    nextSibling = null;
    count = 1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedListMultimap.KeyList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */