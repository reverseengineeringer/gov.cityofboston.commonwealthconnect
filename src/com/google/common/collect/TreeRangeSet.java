package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;
import javax.annotation.Nullable;

@Beta
@GwtIncompatible("uses NavigableMap")
public class TreeRangeSet<C extends Comparable<?>>
  extends AbstractRangeSet<C>
{
  private transient Set<Range<C>> asRanges;
  private transient RangeSet<C> complement;
  @VisibleForTesting
  final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;
  
  private TreeRangeSet(NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
  {
    rangesByLowerBound = paramNavigableMap;
  }
  
  public static <C extends Comparable<?>> TreeRangeSet<C> create()
  {
    return new TreeRangeSet(new TreeMap());
  }
  
  public static <C extends Comparable<?>> TreeRangeSet<C> create(RangeSet<C> paramRangeSet)
  {
    TreeRangeSet localTreeRangeSet = create();
    localTreeRangeSet.addAll(paramRangeSet);
    return localTreeRangeSet;
  }
  
  @Nullable
  private Range<C> rangeEnclosing(Range<C> paramRange)
  {
    Preconditions.checkNotNull(paramRange);
    Map.Entry localEntry = rangesByLowerBound.floorEntry(lowerBound);
    if ((localEntry != null) && (((Range)localEntry.getValue()).encloses(paramRange))) {
      return (Range)localEntry.getValue();
    }
    return null;
  }
  
  private void replaceRangeWithSameLowerBound(Range<C> paramRange)
  {
    if (paramRange.isEmpty())
    {
      rangesByLowerBound.remove(lowerBound);
      return;
    }
    rangesByLowerBound.put(lowerBound, paramRange);
  }
  
  public void add(Range<C> paramRange)
  {
    Preconditions.checkNotNull(paramRange);
    if (paramRange.isEmpty()) {
      return;
    }
    Object localObject3 = lowerBound;
    Object localObject2 = upperBound;
    Object localObject4 = rangesByLowerBound.lowerEntry(localObject3);
    Object localObject1 = localObject3;
    paramRange = (Range<C>)localObject2;
    if (localObject4 != null)
    {
      localObject4 = (Range)((Map.Entry)localObject4).getValue();
      localObject1 = localObject3;
      paramRange = (Range<C>)localObject2;
      if (upperBound.compareTo((Cut)localObject3) >= 0)
      {
        paramRange = (Range<C>)localObject2;
        if (upperBound.compareTo((Cut)localObject2) >= 0) {
          paramRange = upperBound;
        }
        localObject1 = lowerBound;
      }
    }
    localObject3 = rangesByLowerBound.floorEntry(paramRange);
    localObject2 = paramRange;
    if (localObject3 != null)
    {
      localObject3 = (Range)((Map.Entry)localObject3).getValue();
      localObject2 = paramRange;
      if (upperBound.compareTo(paramRange) >= 0) {
        localObject2 = upperBound;
      }
    }
    rangesByLowerBound.subMap(localObject1, localObject2).clear();
    replaceRangeWithSameLowerBound(Range.create((Cut)localObject1, (Cut)localObject2));
  }
  
  public Set<Range<C>> asRanges()
  {
    Set localSet = asRanges;
    Object localObject = localSet;
    if (localSet == null)
    {
      localObject = new AsRanges();
      asRanges = ((Set)localObject);
    }
    return (Set<Range<C>>)localObject;
  }
  
  public RangeSet<C> complement()
  {
    RangeSet localRangeSet = complement;
    Object localObject = localRangeSet;
    if (localRangeSet == null)
    {
      localObject = new Complement();
      complement = ((RangeSet)localObject);
    }
    return (RangeSet<C>)localObject;
  }
  
  public boolean encloses(Range<C> paramRange)
  {
    Preconditions.checkNotNull(paramRange);
    Map.Entry localEntry = rangesByLowerBound.floorEntry(lowerBound);
    return (localEntry != null) && (((Range)localEntry.getValue()).encloses(paramRange));
  }
  
  @Nullable
  public Range<C> rangeContaining(C paramC)
  {
    Preconditions.checkNotNull(paramC);
    Map.Entry localEntry = rangesByLowerBound.floorEntry(Cut.belowValue(paramC));
    if ((localEntry != null) && (((Range)localEntry.getValue()).contains(paramC))) {
      return (Range)localEntry.getValue();
    }
    return null;
  }
  
  public void remove(Range<C> paramRange)
  {
    Preconditions.checkNotNull(paramRange);
    if (paramRange.isEmpty()) {
      return;
    }
    Object localObject = rangesByLowerBound.lowerEntry(lowerBound);
    if (localObject != null)
    {
      localObject = (Range)((Map.Entry)localObject).getValue();
      if (upperBound.compareTo(lowerBound) >= 0)
      {
        if ((paramRange.hasUpperBound()) && (upperBound.compareTo(upperBound) >= 0)) {
          replaceRangeWithSameLowerBound(Range.create(upperBound, upperBound));
        }
        replaceRangeWithSameLowerBound(Range.create(lowerBound, lowerBound));
      }
    }
    localObject = rangesByLowerBound.floorEntry(upperBound);
    if (localObject != null)
    {
      localObject = (Range)((Map.Entry)localObject).getValue();
      if ((paramRange.hasUpperBound()) && (upperBound.compareTo(upperBound) >= 0)) {
        replaceRangeWithSameLowerBound(Range.create(upperBound, upperBound));
      }
    }
    rangesByLowerBound.subMap(lowerBound, upperBound).clear();
  }
  
  public Range<C> span()
  {
    Map.Entry localEntry1 = rangesByLowerBound.firstEntry();
    Map.Entry localEntry2 = rangesByLowerBound.lastEntry();
    if (localEntry1 == null) {
      throw new NoSuchElementException();
    }
    return Range.create(getValuelowerBound, getValueupperBound);
  }
  
  public RangeSet<C> subRangeSet(Range<C> paramRange)
  {
    if (paramRange.equals(Range.all())) {
      return this;
    }
    return new SubRangeSet(paramRange);
  }
  
  final class AsRanges
    extends ForwardingCollection<Range<C>>
    implements Set<Range<C>>
  {
    AsRanges() {}
    
    protected Collection<Range<C>> delegate()
    {
      return rangesByLowerBound.values();
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      return Sets.equalsImpl(this, paramObject);
    }
    
    public int hashCode()
    {
      return Sets.hashCodeImpl(this);
    }
  }
  
  private final class Complement
    extends TreeRangeSet<C>
  {
    Complement()
    {
      super(null);
    }
    
    public void add(Range<C> paramRange)
    {
      TreeRangeSet.this.remove(paramRange);
    }
    
    public RangeSet<C> complement()
    {
      return TreeRangeSet.this;
    }
    
    public boolean contains(C paramC)
    {
      return !TreeRangeSet.this.contains(paramC);
    }
    
    public void remove(Range<C> paramRange)
    {
      TreeRangeSet.this.add(paramRange);
    }
  }
  
  private static final class ComplementRangesByLowerBound<C extends Comparable<?>>
    extends AbstractNavigableMap<Cut<C>, Range<C>>
  {
    private final Range<Cut<C>> complementLowerBoundWindow;
    private final NavigableMap<Cut<C>, Range<C>> positiveRangesByLowerBound;
    private final NavigableMap<Cut<C>, Range<C>> positiveRangesByUpperBound;
    
    ComplementRangesByLowerBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
    {
      this(paramNavigableMap, Range.all());
    }
    
    private ComplementRangesByLowerBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap, Range<Cut<C>> paramRange)
    {
      positiveRangesByLowerBound = paramNavigableMap;
      positiveRangesByUpperBound = new TreeRangeSet.RangesByUpperBound(paramNavigableMap);
      complementLowerBoundWindow = paramRange;
    }
    
    private NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> paramRange)
    {
      if (!complementLowerBoundWindow.isConnected(paramRange)) {
        return ImmutableSortedMap.of();
      }
      paramRange = paramRange.intersection(complementLowerBoundWindow);
      return new ComplementRangesByLowerBound(positiveRangesByLowerBound, paramRange);
    }
    
    public Comparator<? super Cut<C>> comparator()
    {
      return Ordering.natural();
    }
    
    public boolean containsKey(Object paramObject)
    {
      return get(paramObject) != null;
    }
    
    Iterator<Map.Entry<Cut<C>, Range<C>>> descendingEntryIterator()
    {
      Cut localCut;
      boolean bool;
      label46:
      final PeekingIterator localPeekingIterator;
      if (complementLowerBoundWindow.hasUpperBound())
      {
        localCut = (Cut)complementLowerBoundWindow.upperEndpoint();
        if ((!complementLowerBoundWindow.hasUpperBound()) || (complementLowerBoundWindow.upperBoundType() != BoundType.CLOSED)) {
          break label143;
        }
        bool = true;
        localPeekingIterator = Iterators.peekingIterator(positiveRangesByUpperBound.headMap(localCut, bool).descendingMap().values().iterator());
        if (!localPeekingIterator.hasNext()) {
          break label176;
        }
        if (peekupperBound != Cut.aboveAll()) {
          break label148;
        }
        localCut = nextlowerBound;
      }
      for (;;)
      {
        new AbstractIterator()
        {
          Cut<C> nextComplementRangeUpperBound = val$firstComplementRangeUpperBound;
          
          protected Map.Entry<Cut<C>, Range<C>> computeNext()
          {
            if (nextComplementRangeUpperBound == Cut.belowAll()) {
              return (Map.Entry)endOfData();
            }
            Range localRange1;
            if (localPeekingIterator.hasNext())
            {
              localRange1 = (Range)localPeekingIterator.next();
              Range localRange2 = Range.create(upperBound, nextComplementRangeUpperBound);
              nextComplementRangeUpperBound = lowerBound;
              if (complementLowerBoundWindow.lowerBound.isLessThan(lowerBound)) {
                return Maps.immutableEntry(lowerBound, localRange2);
              }
            }
            else if (complementLowerBoundWindow.lowerBound.isLessThan(Cut.belowAll()))
            {
              localRange1 = Range.create(Cut.belowAll(), nextComplementRangeUpperBound);
              nextComplementRangeUpperBound = Cut.belowAll();
              return Maps.immutableEntry(Cut.belowAll(), localRange1);
            }
            return (Map.Entry)endOfData();
          }
        };
        localCut = Cut.aboveAll();
        break;
        label143:
        bool = false;
        break label46;
        label148:
        localCut = (Cut)positiveRangesByLowerBound.higherKey(peekupperBound);
        continue;
        label176:
        if ((!complementLowerBoundWindow.contains(Cut.belowAll())) || (positiveRangesByLowerBound.containsKey(Cut.belowAll()))) {
          return Iterators.emptyIterator();
        }
        localCut = (Cut)positiveRangesByLowerBound.higherKey(Cut.belowAll());
      }
    }
    
    Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator()
    {
      final Object localObject2;
      boolean bool;
      if (complementLowerBoundWindow.hasLowerBound())
      {
        localObject1 = positiveRangesByUpperBound;
        localObject2 = complementLowerBoundWindow.lowerEndpoint();
        if (complementLowerBoundWindow.lowerBoundType() == BoundType.CLOSED)
        {
          bool = true;
          localObject1 = ((NavigableMap)localObject1).tailMap(localObject2, bool).values();
          label52:
          localObject2 = Iterators.peekingIterator(((Collection)localObject1).iterator());
          if ((!complementLowerBoundWindow.contains(Cut.belowAll())) || ((((PeekingIterator)localObject2).hasNext()) && (peeklowerBound == Cut.belowAll()))) {
            break label135;
          }
        }
      }
      for (final Object localObject1 = Cut.belowAll();; localObject1 = nextupperBound)
      {
        new AbstractIterator()
        {
          Cut<C> nextComplementRangeLowerBound = localObject1;
          
          protected Map.Entry<Cut<C>, Range<C>> computeNext()
          {
            if ((complementLowerBoundWindow.upperBound.isLessThan(nextComplementRangeLowerBound)) || (nextComplementRangeLowerBound == Cut.aboveAll())) {
              return (Map.Entry)endOfData();
            }
            Range localRange2;
            Range localRange1;
            if (localObject2.hasNext())
            {
              localRange2 = (Range)localObject2.next();
              localRange1 = Range.create(nextComplementRangeLowerBound, lowerBound);
            }
            for (nextComplementRangeLowerBound = upperBound;; nextComplementRangeLowerBound = Cut.aboveAll())
            {
              return Maps.immutableEntry(lowerBound, localRange1);
              localRange1 = Range.create(nextComplementRangeLowerBound, Cut.aboveAll());
            }
          }
        };
        bool = false;
        break;
        localObject1 = positiveRangesByUpperBound.values();
        break label52;
        label135:
        if (!((PeekingIterator)localObject2).hasNext()) {
          break label160;
        }
      }
      label160:
      return Iterators.emptyIterator();
    }
    
    @Nullable
    public Range<C> get(Object paramObject)
    {
      if ((paramObject instanceof Cut)) {
        try
        {
          paramObject = (Cut)paramObject;
          Map.Entry localEntry = tailMap((Cut)paramObject, true).firstEntry();
          if ((localEntry != null) && (((Cut)localEntry.getKey()).equals(paramObject)))
          {
            paramObject = (Range)localEntry.getValue();
            return (Range<C>)paramObject;
          }
        }
        catch (ClassCastException paramObject)
        {
          return null;
        }
      }
      return null;
    }
    
    public NavigableMap<Cut<C>, Range<C>> headMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.upTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }
    
    public int size()
    {
      return Iterators.size(entryIterator());
    }
    
    public NavigableMap<Cut<C>, Range<C>> subMap(Cut<C> paramCut1, boolean paramBoolean1, Cut<C> paramCut2, boolean paramBoolean2)
    {
      return subMap(Range.range(paramCut1, BoundType.forBoolean(paramBoolean1), paramCut2, BoundType.forBoolean(paramBoolean2)));
    }
    
    public NavigableMap<Cut<C>, Range<C>> tailMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.downTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }
  }
  
  @VisibleForTesting
  static final class RangesByUpperBound<C extends Comparable<?>>
    extends AbstractNavigableMap<Cut<C>, Range<C>>
  {
    private final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;
    private final Range<Cut<C>> upperBoundWindow;
    
    RangesByUpperBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
    {
      rangesByLowerBound = paramNavigableMap;
      upperBoundWindow = Range.all();
    }
    
    private RangesByUpperBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap, Range<Cut<C>> paramRange)
    {
      rangesByLowerBound = paramNavigableMap;
      upperBoundWindow = paramRange;
    }
    
    private NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> paramRange)
    {
      if (paramRange.isConnected(upperBoundWindow)) {
        return new RangesByUpperBound(rangesByLowerBound, paramRange.intersection(upperBoundWindow));
      }
      return ImmutableSortedMap.of();
    }
    
    public Comparator<? super Cut<C>> comparator()
    {
      return Ordering.natural();
    }
    
    public boolean containsKey(@Nullable Object paramObject)
    {
      return get(paramObject) != null;
    }
    
    Iterator<Map.Entry<Cut<C>, Range<C>>> descendingEntryIterator()
    {
      if (upperBoundWindow.hasUpperBound()) {}
      for (final Object localObject = rangesByLowerBound.headMap(upperBoundWindow.upperEndpoint(), false).descendingMap().values();; localObject = rangesByLowerBound.descendingMap().values())
      {
        localObject = Iterators.peekingIterator(((Collection)localObject).iterator());
        if ((((PeekingIterator)localObject).hasNext()) && (upperBoundWindow.upperBound.isLessThan(peekupperBound))) {
          ((PeekingIterator)localObject).next();
        }
        new AbstractIterator()
        {
          protected Map.Entry<Cut<C>, Range<C>> computeNext()
          {
            if (!localObject.hasNext()) {
              return (Map.Entry)endOfData();
            }
            Range localRange = (Range)localObject.next();
            if (upperBoundWindow.lowerBound.isLessThan(upperBound)) {
              return Maps.immutableEntry(upperBound, localRange);
            }
            return (Map.Entry)endOfData();
          }
        };
      }
    }
    
    Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator()
    {
      final Object localObject;
      if (!upperBoundWindow.hasLowerBound()) {
        localObject = rangesByLowerBound.values().iterator();
      }
      for (;;)
      {
        new AbstractIterator()
        {
          protected Map.Entry<Cut<C>, Range<C>> computeNext()
          {
            if (!localObject.hasNext()) {
              return (Map.Entry)endOfData();
            }
            Range localRange = (Range)localObject.next();
            if (upperBoundWindow.upperBound.isLessThan(upperBound)) {
              return (Map.Entry)endOfData();
            }
            return Maps.immutableEntry(upperBound, localRange);
          }
        };
        localObject = rangesByLowerBound.lowerEntry(upperBoundWindow.lowerEndpoint());
        if (localObject == null) {
          localObject = rangesByLowerBound.values().iterator();
        } else if (upperBoundWindow.lowerBound.isLessThan(getValueupperBound)) {
          localObject = rangesByLowerBound.tailMap(((Map.Entry)localObject).getKey(), true).values().iterator();
        } else {
          localObject = rangesByLowerBound.tailMap(upperBoundWindow.lowerEndpoint(), true).values().iterator();
        }
      }
    }
    
    public Range<C> get(@Nullable Object paramObject)
    {
      if ((paramObject instanceof Cut)) {
        try
        {
          paramObject = (Cut)paramObject;
          if (!upperBoundWindow.contains((Comparable)paramObject)) {
            return null;
          }
          Map.Entry localEntry = rangesByLowerBound.lowerEntry(paramObject);
          if ((localEntry != null) && (getValueupperBound.equals(paramObject)))
          {
            paramObject = (Range)localEntry.getValue();
            return (Range<C>)paramObject;
          }
        }
        catch (ClassCastException paramObject)
        {
          return null;
        }
      }
      return null;
    }
    
    public NavigableMap<Cut<C>, Range<C>> headMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.upTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }
    
    public boolean isEmpty()
    {
      if (upperBoundWindow.equals(Range.all())) {
        return rangesByLowerBound.isEmpty();
      }
      return !entryIterator().hasNext();
    }
    
    public int size()
    {
      if (upperBoundWindow.equals(Range.all())) {
        return rangesByLowerBound.size();
      }
      return Iterators.size(entryIterator());
    }
    
    public NavigableMap<Cut<C>, Range<C>> subMap(Cut<C> paramCut1, boolean paramBoolean1, Cut<C> paramCut2, boolean paramBoolean2)
    {
      return subMap(Range.range(paramCut1, BoundType.forBoolean(paramBoolean1), paramCut2, BoundType.forBoolean(paramBoolean2)));
    }
    
    public NavigableMap<Cut<C>, Range<C>> tailMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.downTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }
  }
  
  private final class SubRangeSet
    extends TreeRangeSet<C>
  {
    private final Range<C> restriction;
    
    SubRangeSet()
    {
      super(null);
      restriction = localRange;
    }
    
    public void add(Range<C> paramRange)
    {
      Preconditions.checkArgument(restriction.encloses(paramRange), "Cannot add range %s to subRangeSet(%s)", new Object[] { paramRange, restriction });
      super.add(paramRange);
    }
    
    public void clear()
    {
      TreeRangeSet.this.remove(restriction);
    }
    
    public boolean contains(C paramC)
    {
      return (restriction.contains(paramC)) && (TreeRangeSet.this.contains(paramC));
    }
    
    public boolean encloses(Range<C> paramRange)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if (!restriction.isEmpty())
      {
        bool1 = bool2;
        if (restriction.encloses(paramRange))
        {
          paramRange = TreeRangeSet.this.rangeEnclosing(paramRange);
          bool1 = bool2;
          if (paramRange != null)
          {
            bool1 = bool2;
            if (!paramRange.intersection(restriction).isEmpty()) {
              bool1 = true;
            }
          }
        }
      }
      return bool1;
    }
    
    @Nullable
    public Range<C> rangeContaining(C paramC)
    {
      if (!restriction.contains(paramC)) {}
      do
      {
        return null;
        paramC = TreeRangeSet.this.rangeContaining(paramC);
      } while (paramC == null);
      return paramC.intersection(restriction);
    }
    
    public void remove(Range<C> paramRange)
    {
      if (paramRange.isConnected(restriction)) {
        TreeRangeSet.this.remove(paramRange.intersection(restriction));
      }
    }
    
    public RangeSet<C> subRangeSet(Range<C> paramRange)
    {
      if (paramRange.encloses(restriction)) {
        return this;
      }
      if (paramRange.isConnected(restriction)) {
        return new SubRangeSet(this, restriction.intersection(paramRange));
      }
      return ImmutableRangeSet.of();
    }
  }
  
  private static final class SubRangeSetRangesByLowerBound<C extends Comparable<?>>
    extends AbstractNavigableMap<Cut<C>, Range<C>>
  {
    private final Range<Cut<C>> lowerBoundWindow;
    private final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;
    private final NavigableMap<Cut<C>, Range<C>> rangesByUpperBound;
    private final Range<C> restriction;
    
    private SubRangeSetRangesByLowerBound(Range<Cut<C>> paramRange, Range<C> paramRange1, NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
    {
      lowerBoundWindow = ((Range)Preconditions.checkNotNull(paramRange));
      restriction = ((Range)Preconditions.checkNotNull(paramRange1));
      rangesByLowerBound = ((NavigableMap)Preconditions.checkNotNull(paramNavigableMap));
      rangesByUpperBound = new TreeRangeSet.RangesByUpperBound(paramNavigableMap);
    }
    
    private NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> paramRange)
    {
      if (!paramRange.isConnected(lowerBoundWindow)) {
        return ImmutableSortedMap.of();
      }
      return new SubRangeSetRangesByLowerBound(lowerBoundWindow.intersection(paramRange), restriction, rangesByLowerBound);
    }
    
    public Comparator<? super Cut<C>> comparator()
    {
      return Ordering.natural();
    }
    
    public boolean containsKey(@Nullable Object paramObject)
    {
      return get(paramObject) != null;
    }
    
    Iterator<Map.Entry<Cut<C>, Range<C>>> descendingEntryIterator()
    {
      if (restriction.isEmpty()) {
        return Iterators.emptyIterator();
      }
      Cut localCut = (Cut)Ordering.natural().min(lowerBoundWindow.upperBound, Cut.belowValue(restriction.upperBound));
      NavigableMap localNavigableMap = rangesByLowerBound;
      Comparable localComparable = localCut.endpoint();
      if (localCut.typeAsUpperBound() == BoundType.CLOSED) {}
      for (boolean bool = true;; bool = false) {
        new AbstractIterator()
        {
          protected Map.Entry<Cut<C>, Range<C>> computeNext()
          {
            if (!val$completeRangeItr.hasNext()) {
              return (Map.Entry)endOfData();
            }
            Range localRange = (Range)val$completeRangeItr.next();
            if (restriction.lowerBound.compareTo(upperBound) >= 0) {
              return (Map.Entry)endOfData();
            }
            localRange = localRange.intersection(restriction);
            if (lowerBoundWindow.contains(lowerBound)) {
              return Maps.immutableEntry(lowerBound, localRange);
            }
            return (Map.Entry)endOfData();
          }
        };
      }
    }
    
    Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator()
    {
      boolean bool = false;
      if (restriction.isEmpty()) {
        return Iterators.emptyIterator();
      }
      if (lowerBoundWindow.upperBound.isLessThan(restriction.lowerBound)) {
        return Iterators.emptyIterator();
      }
      if (lowerBoundWindow.lowerBound.isLessThan(restriction.lowerBound)) {}
      Comparable localComparable;
      for (final Object localObject = rangesByUpperBound.tailMap(restriction.lowerBound, false).values().iterator();; localObject = ((NavigableMap)localObject).tailMap(localComparable, bool).values().iterator())
      {
        new AbstractIterator()
        {
          protected Map.Entry<Cut<C>, Range<C>> computeNext()
          {
            if (!localObject.hasNext()) {
              return (Map.Entry)endOfData();
            }
            Range localRange = (Range)localObject.next();
            if (val$upperBoundOnLowerBounds.isLessThan(lowerBound)) {
              return (Map.Entry)endOfData();
            }
            localRange = localRange.intersection(restriction);
            return Maps.immutableEntry(lowerBound, localRange);
          }
        };
        localObject = rangesByLowerBound;
        localComparable = lowerBoundWindow.lowerBound.endpoint();
        if (lowerBoundWindow.lowerBoundType() == BoundType.CLOSED) {
          bool = true;
        }
      }
    }
    
    @Nullable
    public Range<C> get(@Nullable Object paramObject)
    {
      if ((paramObject instanceof Cut)) {
        try
        {
          paramObject = (Cut)paramObject;
          if ((lowerBoundWindow.contains((Comparable)paramObject)) && (((Cut)paramObject).compareTo(restriction.lowerBound) >= 0))
          {
            if (((Cut)paramObject).compareTo(restriction.upperBound) >= 0) {
              return null;
            }
            if (((Cut)paramObject).equals(restriction.lowerBound))
            {
              paramObject = (Range)Maps.valueOrNull(rangesByLowerBound.floorEntry(paramObject));
              if ((paramObject != null) && (upperBound.compareTo(restriction.lowerBound) > 0)) {
                return ((Range)paramObject).intersection(restriction);
              }
            }
            else
            {
              paramObject = (Range)rangesByLowerBound.get(paramObject);
              if (paramObject != null)
              {
                paramObject = ((Range)paramObject).intersection(restriction);
                return (Range<C>)paramObject;
              }
            }
          }
        }
        catch (ClassCastException paramObject) {}
      }
      return null;
    }
    
    public NavigableMap<Cut<C>, Range<C>> headMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.upTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }
    
    public int size()
    {
      return Iterators.size(entryIterator());
    }
    
    public NavigableMap<Cut<C>, Range<C>> subMap(Cut<C> paramCut1, boolean paramBoolean1, Cut<C> paramCut2, boolean paramBoolean2)
    {
      return subMap(Range.range(paramCut1, BoundType.forBoolean(paramBoolean1), paramCut2, BoundType.forBoolean(paramBoolean2)));
    }
    
    public NavigableMap<Cut<C>, Range<C>> tailMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.downTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */