package com.google.gson.internal;

class LinkedHashTreeMap$AvlIterator<K, V>
{
  private LinkedHashTreeMap.Node<K, V> stackTop;
  
  public LinkedHashTreeMap.Node<K, V> next()
  {
    LinkedHashTreeMap.Node localNode2 = stackTop;
    if (localNode2 == null) {
      return null;
    }
    Object localObject = parent;
    parent = null;
    for (LinkedHashTreeMap.Node localNode1 = right; localNode1 != null; localNode1 = left)
    {
      parent = ((LinkedHashTreeMap.Node)localObject);
      localObject = localNode1;
    }
    stackTop = ((LinkedHashTreeMap.Node)localObject);
    return localNode2;
  }
  
  void reset(LinkedHashTreeMap.Node<K, V> paramNode)
  {
    LinkedHashTreeMap.Node<K, V> localNode = null;
    while (paramNode != null)
    {
      parent = localNode;
      localNode = paramNode;
      paramNode = left;
    }
    stackTop = localNode;
  }
}

/* Location:
 * Qualified Name:     com.google.gson.internal.LinkedHashTreeMap.AvlIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */