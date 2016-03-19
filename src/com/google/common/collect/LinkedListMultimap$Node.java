package com.google.common.collect;

import javax.annotation.Nullable;

final class LinkedListMultimap$Node<K, V>
  extends AbstractMapEntry<K, V>
{
  final K key;
  Node<K, V> next;
  Node<K, V> nextSibling;
  Node<K, V> previous;
  Node<K, V> previousSibling;
  V value;
  
  LinkedListMultimap$Node(@Nullable K paramK, @Nullable V paramV)
  {
    key = paramK;
    value = paramV;
  }
  
  public K getKey()
  {
    return (K)key;
  }
  
  public V getValue()
  {
    return (V)value;
  }
  
  public V setValue(@Nullable V paramV)
  {
    Object localObject = value;
    value = paramV;
    return (V)localObject;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedListMultimap.Node
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */