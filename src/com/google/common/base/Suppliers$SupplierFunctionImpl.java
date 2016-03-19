package com.google.common.base;

 enum Suppliers$SupplierFunctionImpl
  implements Suppliers.SupplierFunction<Object>
{
  INSTANCE;
  
  private Suppliers$SupplierFunctionImpl() {}
  
  public Object apply(Supplier<Object> paramSupplier)
  {
    return paramSupplier.get();
  }
  
  public String toString()
  {
    return "Suppliers.supplierFunction()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Suppliers.SupplierFunctionImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */