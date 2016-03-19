package com.google.common.collect;

class MultimapBuilder$MultimapBuilderWithKeys$6
  extends MultimapBuilder.SetMultimapBuilder<K0, V0>
{
  MultimapBuilder$MultimapBuilderWithKeys$6(MultimapBuilder.MultimapBuilderWithKeys paramMultimapBuilderWithKeys, Class paramClass) {}
  
  public <K extends K0, V extends V0> SetMultimap<K, V> build()
  {
    MultimapBuilder.EnumSetSupplier localEnumSetSupplier = new MultimapBuilder.EnumSetSupplier(val$valueClass);
    return Multimaps.newSetMultimap(this$0.createMap(), localEnumSetSupplier);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.MultimapBuilderWithKeys.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */