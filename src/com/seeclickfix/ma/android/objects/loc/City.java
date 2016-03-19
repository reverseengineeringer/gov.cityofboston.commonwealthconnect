package com.seeclickfix.ma.android.objects.loc;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

@DatabaseTable(tableName="cities")
public class City
{
  @DatabaseField(allowGeneratedIdInsert=true, columnName="_id", generatedId=true)
  public int id;
  @DatabaseField(columnName="name")
  public String name;
  @DatabaseField(columnName="population")
  public int population;
  @DatabaseField(columnName="state")
  public String state;
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.loc.City
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */