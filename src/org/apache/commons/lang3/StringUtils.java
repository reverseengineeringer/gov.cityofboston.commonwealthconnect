package org.apache.commons.lang3;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils
{
  public static final String CR = "\r";
  public static final String EMPTY = "";
  public static final int INDEX_NOT_FOUND = -1;
  public static final String LF = "\n";
  private static final int PAD_LIMIT = 8192;
  public static final String SPACE = " ";
  private static final Pattern WHITESPACE_PATTERN = Pattern.compile("(?: |\\u00A0|\\s|[\\s&&[^ ]])\\s*");
  
  public static String abbreviate(String paramString, int paramInt)
  {
    return abbreviate(paramString, 0, paramInt);
  }
  
  public static String abbreviate(String paramString, int paramInt1, int paramInt2)
  {
    String str;
    if (paramString == null) {
      str = null;
    }
    do
    {
      return str;
      if (paramInt2 < 4) {
        throw new IllegalArgumentException("Minimum abbreviation width is 4");
      }
      str = paramString;
    } while (paramString.length() <= paramInt2);
    int i = paramInt1;
    if (paramInt1 > paramString.length()) {
      i = paramString.length();
    }
    paramInt1 = i;
    if (paramString.length() - i < paramInt2 - 3) {
      paramInt1 = paramString.length() - (paramInt2 - 3);
    }
    if (paramInt1 <= 4) {
      return paramString.substring(0, paramInt2 - 3) + "...";
    }
    if (paramInt2 < 7) {
      throw new IllegalArgumentException("Minimum abbreviation width with offset is 7");
    }
    if (paramInt1 + paramInt2 - 3 < paramString.length()) {
      return "..." + abbreviate(paramString.substring(paramInt1), paramInt2 - 3);
    }
    return "..." + paramString.substring(paramString.length() - (paramInt2 - 3));
  }
  
  public static String abbreviateMiddle(String paramString1, String paramString2, int paramInt)
  {
    if ((isEmpty(paramString1)) || (isEmpty(paramString2))) {}
    while ((paramInt >= paramString1.length()) || (paramInt < paramString2.length() + 2)) {
      return paramString1;
    }
    int i = paramInt - paramString2.length();
    int j = i / 2;
    int k = paramString1.length();
    int m = i / 2;
    StringBuilder localStringBuilder = new StringBuilder(paramInt);
    localStringBuilder.append(paramString1.substring(0, j + i % 2));
    localStringBuilder.append(paramString2);
    localStringBuilder.append(paramString1.substring(k - m));
    return localStringBuilder.toString();
  }
  
  private static String appendIfMissing(String paramString, CharSequence paramCharSequence, boolean paramBoolean, CharSequence... paramVarArgs)
  {
    if ((paramString == null) || (isEmpty(paramCharSequence)) || (endsWith(paramString, paramCharSequence, paramBoolean))) {
      return paramString;
    }
    if ((paramVarArgs != null) && (paramVarArgs.length > 0))
    {
      int j = paramVarArgs.length;
      int i = 0;
      for (;;)
      {
        if (i >= j) {
          break label66;
        }
        if (endsWith(paramString, paramVarArgs[i], paramBoolean)) {
          break;
        }
        i += 1;
      }
    }
    label66:
    return paramString + paramCharSequence.toString();
  }
  
  public static String appendIfMissing(String paramString, CharSequence paramCharSequence, CharSequence... paramVarArgs)
  {
    return appendIfMissing(paramString, paramCharSequence, false, paramVarArgs);
  }
  
  public static String appendIfMissingIgnoreCase(String paramString, CharSequence paramCharSequence, CharSequence... paramVarArgs)
  {
    return appendIfMissing(paramString, paramCharSequence, true, paramVarArgs);
  }
  
  public static String capitalize(String paramString)
  {
    int i;
    if (paramString != null)
    {
      i = paramString.length();
      if (i != 0) {
        break label15;
      }
    }
    label15:
    char c;
    do
    {
      return paramString;
      c = paramString.charAt(0);
    } while (Character.isTitleCase(c));
    return i + Character.toTitleCase(c) + paramString.substring(1);
  }
  
  public static String center(String paramString, int paramInt)
  {
    return center(paramString, paramInt, ' ');
  }
  
  public static String center(String paramString, int paramInt, char paramChar)
  {
    if ((paramString == null) || (paramInt <= 0)) {}
    int i;
    int j;
    do
    {
      return paramString;
      i = paramString.length();
      j = paramInt - i;
    } while (j <= 0);
    return rightPad(leftPad(paramString, j / 2 + i, paramChar), paramInt, paramChar);
  }
  
  public static String center(String paramString1, int paramInt, String paramString2)
  {
    if ((paramString1 == null) || (paramInt <= 0)) {}
    String str;
    int i;
    int j;
    do
    {
      return paramString1;
      str = paramString2;
      if (isEmpty(paramString2)) {
        str = " ";
      }
      i = paramString1.length();
      j = paramInt - i;
    } while (j <= 0);
    return rightPad(leftPad(paramString1, j / 2 + i, str), paramInt, str);
  }
  
  public static String chomp(String paramString)
  {
    if (isEmpty(paramString)) {}
    int i;
    do
    {
      return paramString;
      if (paramString.length() != 1) {
        break;
      }
      i = paramString.charAt(0);
    } while ((i != 13) && (i != 10));
    return "";
    int j = paramString.length() - 1;
    int k = paramString.charAt(j);
    if (k == 10)
    {
      i = j;
      if (paramString.charAt(j - 1) == '\r') {
        i = j - 1;
      }
    }
    for (;;)
    {
      return paramString.substring(0, i);
      i = j;
      if (k != 13) {
        i = j + 1;
      }
    }
  }
  
  @Deprecated
  public static String chomp(String paramString1, String paramString2)
  {
    return removeEnd(paramString1, paramString2);
  }
  
  public static String chop(String paramString)
  {
    Object localObject;
    if (paramString == null) {
      localObject = null;
    }
    int i;
    String str;
    do
    {
      do
      {
        return (String)localObject;
        i = paramString.length();
        if (i < 2) {
          return "";
        }
        i -= 1;
        str = paramString.substring(0, i);
        localObject = str;
      } while (paramString.charAt(i) != '\n');
      localObject = str;
    } while (str.charAt(i - 1) != '\r');
    return str.substring(0, i - 1);
  }
  
  private static int commonPrefixLength(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    int j = getCommonPrefix(new String[] { paramCharSequence1.toString(), paramCharSequence2.toString() }).length();
    int i = j;
    if (j > 4) {
      i = 4;
    }
    return i;
  }
  
  public static boolean contains(CharSequence paramCharSequence, int paramInt)
  {
    if (isEmpty(paramCharSequence)) {}
    while (CharSequenceUtils.indexOf(paramCharSequence, paramInt, 0) < 0) {
      return false;
    }
    return true;
  }
  
  public static boolean contains(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {}
    while (CharSequenceUtils.indexOf(paramCharSequence1, paramCharSequence2, 0) < 0) {
      return false;
    }
    return true;
  }
  
  public static boolean containsAny(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if (paramCharSequence2 == null) {
      return false;
    }
    return containsAny(paramCharSequence1, CharSequenceUtils.toCharArray(paramCharSequence2));
  }
  
  public static boolean containsAny(CharSequence paramCharSequence, char... paramVarArgs)
  {
    boolean bool2 = true;
    boolean bool1;
    if ((isEmpty(paramCharSequence)) || (ArrayUtils.isEmpty(paramVarArgs)))
    {
      bool1 = false;
      return bool1;
    }
    int k = paramCharSequence.length();
    int m = paramVarArgs.length;
    int i = 0;
    for (;;)
    {
      if (i >= k) {
        break label139;
      }
      char c = paramCharSequence.charAt(i);
      int j = 0;
      for (;;)
      {
        if (j >= m) {
          break label132;
        }
        if (paramVarArgs[j] == c)
        {
          bool1 = bool2;
          if (!Character.isHighSurrogate(c)) {
            break;
          }
          bool1 = bool2;
          if (j == m - 1) {
            break;
          }
          if (i < k - 1)
          {
            bool1 = bool2;
            if (paramVarArgs[(j + 1)] == paramCharSequence.charAt(i + 1)) {
              break;
            }
          }
        }
        j += 1;
      }
      label132:
      i += 1;
    }
    label139:
    return false;
  }
  
  public static boolean containsIgnoreCase(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {}
    for (;;)
    {
      return false;
      int j = paramCharSequence2.length();
      int k = paramCharSequence1.length();
      int i = 0;
      while (i <= k - j)
      {
        if (CharSequenceUtils.regionMatches(paramCharSequence1, true, i, paramCharSequence2, 0, j)) {
          return true;
        }
        i += 1;
      }
    }
  }
  
  public static boolean containsNone(CharSequence paramCharSequence, String paramString)
  {
    if ((paramCharSequence == null) || (paramString == null)) {
      return true;
    }
    return containsNone(paramCharSequence, paramString.toCharArray());
  }
  
  public static boolean containsNone(CharSequence paramCharSequence, char... paramVarArgs)
  {
    boolean bool2 = false;
    boolean bool1;
    if ((paramCharSequence == null) || (paramVarArgs == null))
    {
      bool1 = true;
      return bool1;
    }
    int k = paramCharSequence.length();
    int m = paramVarArgs.length;
    int i = 0;
    for (;;)
    {
      if (i >= k) {
        break label133;
      }
      char c = paramCharSequence.charAt(i);
      int j = 0;
      for (;;)
      {
        if (j >= m) {
          break label126;
        }
        if (paramVarArgs[j] == c)
        {
          bool1 = bool2;
          if (!Character.isHighSurrogate(c)) {
            break;
          }
          bool1 = bool2;
          if (j == m - 1) {
            break;
          }
          if (i < k - 1)
          {
            bool1 = bool2;
            if (paramVarArgs[(j + 1)] == paramCharSequence.charAt(i + 1)) {
              break;
            }
          }
        }
        j += 1;
      }
      label126:
      i += 1;
    }
    label133:
    return true;
  }
  
  public static boolean containsOnly(CharSequence paramCharSequence, String paramString)
  {
    if ((paramCharSequence == null) || (paramString == null)) {
      return false;
    }
    return containsOnly(paramCharSequence, paramString.toCharArray());
  }
  
  public static boolean containsOnly(CharSequence paramCharSequence, char... paramVarArgs)
  {
    boolean bool2 = true;
    boolean bool1;
    if ((paramVarArgs == null) || (paramCharSequence == null)) {
      bool1 = false;
    }
    do
    {
      do
      {
        return bool1;
        bool1 = bool2;
      } while (paramCharSequence.length() == 0);
      if (paramVarArgs.length == 0) {
        return false;
      }
      bool1 = bool2;
    } while (indexOfAnyBut(paramCharSequence, paramVarArgs) == -1);
    return false;
  }
  
  public static boolean containsWhitespace(CharSequence paramCharSequence)
  {
    if (isEmpty(paramCharSequence)) {}
    for (;;)
    {
      return false;
      int j = paramCharSequence.length();
      int i = 0;
      while (i < j)
      {
        if (Character.isWhitespace(paramCharSequence.charAt(i))) {
          return true;
        }
        i += 1;
      }
    }
  }
  
  public static int countMatches(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if ((isEmpty(paramCharSequence1)) || (isEmpty(paramCharSequence2)))
    {
      j = 0;
      return j;
    }
    int i = 0;
    int k;
    for (int j = 0;; j = k + paramCharSequence2.length())
    {
      k = CharSequenceUtils.indexOf(paramCharSequence1, paramCharSequence2, j);
      j = i;
      if (k == -1) {
        break;
      }
      i += 1;
    }
  }
  
  public static <T extends CharSequence> T defaultIfBlank(T paramT1, T paramT2)
  {
    if (isBlank(paramT1)) {
      return paramT2;
    }
    return paramT1;
  }
  
  public static <T extends CharSequence> T defaultIfEmpty(T paramT1, T paramT2)
  {
    if (isEmpty(paramT1)) {
      return paramT2;
    }
    return paramT1;
  }
  
  public static String defaultString(String paramString)
  {
    String str = paramString;
    if (paramString == null) {
      str = "";
    }
    return str;
  }
  
  public static String defaultString(String paramString1, String paramString2)
  {
    if (paramString1 == null) {
      return paramString2;
    }
    return paramString1;
  }
  
  public static String deleteWhitespace(String paramString)
  {
    if (isEmpty(paramString)) {
      return paramString;
    }
    int m = paramString.length();
    char[] arrayOfChar = new char[m];
    int j = 0;
    int i = 0;
    label25:
    if (j < m)
    {
      if (Character.isWhitespace(paramString.charAt(j))) {
        break label82;
      }
      int k = i + 1;
      arrayOfChar[i] = paramString.charAt(j);
      i = k;
    }
    label82:
    for (;;)
    {
      j += 1;
      break label25;
      if (i == m) {
        break;
      }
      return new String(arrayOfChar, 0, i);
    }
  }
  
  public static String difference(String paramString1, String paramString2)
  {
    if (paramString1 == null) {
      return paramString2;
    }
    if (paramString2 == null) {
      return paramString1;
    }
    int i = indexOfDifference(paramString1, paramString2);
    if (i == -1) {
      return "";
    }
    return paramString2.substring(i);
  }
  
  public static boolean endsWith(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    return endsWith(paramCharSequence1, paramCharSequence2, false);
  }
  
  private static boolean endsWith(CharSequence paramCharSequence1, CharSequence paramCharSequence2, boolean paramBoolean)
  {
    boolean bool2 = false;
    boolean bool1;
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null))
    {
      bool1 = bool2;
      if (paramCharSequence1 == null)
      {
        bool1 = bool2;
        if (paramCharSequence2 == null) {
          bool1 = true;
        }
      }
    }
    do
    {
      return bool1;
      bool1 = bool2;
    } while (paramCharSequence2.length() > paramCharSequence1.length());
    return CharSequenceUtils.regionMatches(paramCharSequence1, paramBoolean, paramCharSequence1.length() - paramCharSequence2.length(), paramCharSequence2, 0, paramCharSequence2.length());
  }
  
  public static boolean endsWithAny(CharSequence paramCharSequence, CharSequence... paramVarArgs)
  {
    if ((isEmpty(paramCharSequence)) || (ArrayUtils.isEmpty(paramVarArgs))) {}
    for (;;)
    {
      return false;
      int j = paramVarArgs.length;
      int i = 0;
      while (i < j)
      {
        if (endsWith(paramCharSequence, paramVarArgs[i])) {
          return true;
        }
        i += 1;
      }
    }
  }
  
  public static boolean endsWithIgnoreCase(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    return endsWith(paramCharSequence1, paramCharSequence2, true);
  }
  
  public static boolean equals(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    boolean bool2 = false;
    boolean bool1;
    if (paramCharSequence1 == paramCharSequence2) {
      bool1 = true;
    }
    do
    {
      do
      {
        return bool1;
        bool1 = bool2;
      } while (paramCharSequence1 == null);
      bool1 = bool2;
    } while (paramCharSequence2 == null);
    if (((paramCharSequence1 instanceof String)) && ((paramCharSequence2 instanceof String))) {
      return paramCharSequence1.equals(paramCharSequence2);
    }
    return CharSequenceUtils.regionMatches(paramCharSequence1, false, 0, paramCharSequence2, 0, Math.max(paramCharSequence1.length(), paramCharSequence2.length()));
  }
  
  public static boolean equalsIgnoreCase(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      if (paramCharSequence1 != paramCharSequence2) {}
    }
    while (paramCharSequence1 == paramCharSequence2)
    {
      return true;
      return false;
    }
    if (paramCharSequence1.length() != paramCharSequence2.length()) {
      return false;
    }
    return CharSequenceUtils.regionMatches(paramCharSequence1, true, 0, paramCharSequence2, 0, paramCharSequence1.length());
  }
  
  public static String getCommonPrefix(String... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length == 0)) {
      return "";
    }
    int i = indexOfDifference(paramVarArgs);
    if (i == -1)
    {
      if (paramVarArgs[0] == null) {
        return "";
      }
      return paramVarArgs[0];
    }
    if (i == 0) {
      return "";
    }
    return paramVarArgs[0].substring(0, i);
  }
  
  public static double getJaroWinklerDistance(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      throw new IllegalArgumentException("Strings must not be null");
    }
    double d = score(paramCharSequence1, paramCharSequence2);
    return Math.round((0.1D * commonPrefixLength(paramCharSequence1, paramCharSequence2) * (1.0D - d) + d) * 100.0D) / 100.0D;
  }
  
  public static int getLevenshteinDistance(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      throw new IllegalArgumentException("Strings must not be null");
    }
    int m = paramCharSequence1.length();
    int k = paramCharSequence2.length();
    if (m == 0) {
      return k;
    }
    if (k == 0) {
      return m;
    }
    int j = k;
    int i = m;
    CharSequence localCharSequence2 = paramCharSequence1;
    CharSequence localCharSequence1 = paramCharSequence2;
    if (m > k)
    {
      i = k;
      j = paramCharSequence1.length();
      localCharSequence1 = paramCharSequence1;
      localCharSequence2 = paramCharSequence2;
    }
    paramCharSequence2 = new int[i + 1];
    paramCharSequence1 = new int[i + 1];
    k = 0;
    while (k <= i)
    {
      paramCharSequence2[k] = k;
      k += 1;
    }
    k = 1;
    CharSequence localCharSequence3;
    for (;;)
    {
      localCharSequence3 = paramCharSequence2;
      if (k > j) {
        break;
      }
      int i1 = localCharSequence1.charAt(k - 1);
      paramCharSequence1[0] = k;
      m = 1;
      if (m <= i)
      {
        if (localCharSequence2.charAt(m - 1) == i1) {}
        for (int n = 0;; n = 1)
        {
          paramCharSequence1[m] = Math.min(Math.min(paramCharSequence1[(m - 1)] + 1, localCharSequence3[m] + 1), localCharSequence3[(m - 1)] + n);
          m += 1;
          break;
        }
      }
      paramCharSequence2 = paramCharSequence1;
      paramCharSequence1 = localCharSequence3;
      k += 1;
    }
    return localCharSequence3[i];
  }
  
  public static int getLevenshteinDistance(CharSequence paramCharSequence1, CharSequence paramCharSequence2, int paramInt)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      throw new IllegalArgumentException("Strings must not be null");
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("Threshold must not be negative");
    }
    int m = paramCharSequence1.length();
    int k = paramCharSequence2.length();
    if (m == 0)
    {
      if (k <= paramInt) {
        return k;
      }
      return -1;
    }
    if (k == 0)
    {
      if (m <= paramInt) {
        return m;
      }
      return -1;
    }
    int j = k;
    int i = m;
    CharSequence localCharSequence2 = paramCharSequence1;
    CharSequence localCharSequence1 = paramCharSequence2;
    if (m > k)
    {
      i = k;
      j = paramCharSequence1.length();
      localCharSequence1 = paramCharSequence1;
      localCharSequence2 = paramCharSequence2;
    }
    paramCharSequence2 = new int[i + 1];
    paramCharSequence1 = new int[i + 1];
    m = Math.min(i, paramInt) + 1;
    k = 0;
    while (k < m)
    {
      paramCharSequence2[k] = k;
      k += 1;
    }
    Arrays.fill(paramCharSequence2, m, paramCharSequence2.length, Integer.MAX_VALUE);
    Arrays.fill(paramCharSequence1, Integer.MAX_VALUE);
    k = 1;
    CharSequence localCharSequence3;
    for (;;)
    {
      localCharSequence3 = paramCharSequence2;
      if (k > j) {
        break;
      }
      int i1 = localCharSequence1.charAt(k - 1);
      paramCharSequence1[0] = k;
      int n = Math.max(1, k - paramInt);
      if (k > Integer.MAX_VALUE - paramInt) {}
      for (m = i; n > m; m = Math.min(i, k + paramInt)) {
        return -1;
      }
      if (n > 1) {
        paramCharSequence1[(n - 1)] = Integer.MAX_VALUE;
      }
      if (n <= m)
      {
        if (localCharSequence2.charAt(n - 1) == i1) {
          paramCharSequence1[n] = localCharSequence3[(n - 1)];
        }
        for (;;)
        {
          n += 1;
          break;
          paramCharSequence1[n] = (Math.min(Math.min(paramCharSequence1[(n - 1)], localCharSequence3[n]), localCharSequence3[(n - 1)]) + 1);
        }
      }
      paramCharSequence2 = paramCharSequence1;
      paramCharSequence1 = localCharSequence3;
      k += 1;
    }
    if (localCharSequence3[i] <= paramInt) {
      return localCharSequence3[i];
    }
    return -1;
  }
  
  private static String getSetOfMatchingCharacterWithin(CharSequence paramCharSequence1, CharSequence paramCharSequence2, int paramInt)
  {
    StringBuilder localStringBuilder1 = new StringBuilder();
    StringBuilder localStringBuilder2 = new StringBuilder(paramCharSequence2);
    int i = 0;
    while (i < paramCharSequence1.length())
    {
      char c = paramCharSequence1.charAt(i);
      int k = 0;
      int j = Math.max(0, i - paramInt);
      while ((k == 0) && (j < Math.min(i + paramInt, paramCharSequence2.length())))
      {
        if (localStringBuilder2.charAt(j) == c)
        {
          k = 1;
          localStringBuilder1.append(c);
          localStringBuilder2.setCharAt(j, '*');
        }
        j += 1;
      }
      i += 1;
    }
    return localStringBuilder1.toString();
  }
  
  public static int indexOf(CharSequence paramCharSequence, int paramInt)
  {
    if (isEmpty(paramCharSequence)) {
      return -1;
    }
    return CharSequenceUtils.indexOf(paramCharSequence, paramInt, 0);
  }
  
  public static int indexOf(CharSequence paramCharSequence, int paramInt1, int paramInt2)
  {
    if (isEmpty(paramCharSequence)) {
      return -1;
    }
    return CharSequenceUtils.indexOf(paramCharSequence, paramInt1, paramInt2);
  }
  
  public static int indexOf(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      return -1;
    }
    return CharSequenceUtils.indexOf(paramCharSequence1, paramCharSequence2, 0);
  }
  
  public static int indexOf(CharSequence paramCharSequence1, CharSequence paramCharSequence2, int paramInt)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      return -1;
    }
    return CharSequenceUtils.indexOf(paramCharSequence1, paramCharSequence2, paramInt);
  }
  
  public static int indexOfAny(CharSequence paramCharSequence, String paramString)
  {
    if ((isEmpty(paramCharSequence)) || (isEmpty(paramString))) {
      return -1;
    }
    return indexOfAny(paramCharSequence, paramString.toCharArray());
  }
  
  public static int indexOfAny(CharSequence paramCharSequence, char... paramVarArgs)
  {
    int j;
    if ((isEmpty(paramCharSequence)) || (ArrayUtils.isEmpty(paramVarArgs)))
    {
      j = -1;
      return j;
    }
    int m = paramCharSequence.length();
    int n = paramVarArgs.length;
    int i = 0;
    for (;;)
    {
      if (i >= m) {
        break label136;
      }
      char c = paramCharSequence.charAt(i);
      int k = 0;
      for (;;)
      {
        if (k >= n) {
          break label129;
        }
        if (paramVarArgs[k] == c)
        {
          j = i;
          if (i >= m - 1) {
            break;
          }
          j = i;
          if (k >= n - 1) {
            break;
          }
          j = i;
          if (!Character.isHighSurrogate(c)) {
            break;
          }
          j = i;
          if (paramVarArgs[(k + 1)] == paramCharSequence.charAt(i + 1)) {
            break;
          }
        }
        k += 1;
      }
      label129:
      i += 1;
    }
    label136:
    return -1;
  }
  
  public static int indexOfAny(CharSequence paramCharSequence, CharSequence... paramVarArgs)
  {
    int j;
    if ((paramCharSequence == null) || (paramVarArgs == null)) {
      j = -1;
    }
    int i;
    do
    {
      return j;
      int n = paramVarArgs.length;
      i = Integer.MAX_VALUE;
      j = 0;
      if (j < n)
      {
        CharSequence localCharSequence = paramVarArgs[j];
        int k;
        if (localCharSequence == null) {
          k = i;
        }
        for (;;)
        {
          j += 1;
          i = k;
          break;
          int m = CharSequenceUtils.indexOf(paramCharSequence, localCharSequence, 0);
          k = i;
          if (m != -1)
          {
            k = i;
            if (m < i) {
              k = m;
            }
          }
        }
      }
      j = i;
    } while (i != Integer.MAX_VALUE);
    return -1;
  }
  
  public static int indexOfAnyBut(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    int j;
    if ((isEmpty(paramCharSequence1)) || (isEmpty(paramCharSequence2))) {
      j = -1;
    }
    int i;
    label56:
    do
    {
      return j;
      int k = paramCharSequence1.length();
      i = 0;
      if (i >= k) {
        break label120;
      }
      char c = paramCharSequence1.charAt(i);
      if (CharSequenceUtils.indexOf(paramCharSequence2, c, 0) < 0) {
        break label107;
      }
      j = 1;
      if ((i + 1 >= k) || (!Character.isHighSurrogate(c))) {
        break label113;
      }
      m = paramCharSequence1.charAt(i + 1);
      if (j == 0) {
        break;
      }
      j = i;
    } while (CharSequenceUtils.indexOf(paramCharSequence2, m, 0) < 0);
    label107:
    label113:
    while (j != 0)
    {
      int m;
      i += 1;
      break;
      j = 0;
      break label56;
    }
    return i;
    label120:
    return -1;
  }
  
  public static int indexOfAnyBut(CharSequence paramCharSequence, char... paramVarArgs)
  {
    int j;
    if ((isEmpty(paramCharSequence)) || (ArrayUtils.isEmpty(paramVarArgs)))
    {
      j = -1;
      return j;
    }
    int m = paramCharSequence.length();
    int n = paramVarArgs.length;
    int i = 0;
    label34:
    if (i < m)
    {
      char c = paramCharSequence.charAt(i);
      int k = 0;
      for (;;)
      {
        j = i;
        if (k >= n) {
          break;
        }
        if ((paramVarArgs[k] == c) && ((i >= m - 1) || (k >= n - 1) || (!Character.isHighSurrogate(c)) || (paramVarArgs[(k + 1)] == paramCharSequence.charAt(i + 1))))
        {
          i += 1;
          break label34;
        }
        k += 1;
      }
    }
    return -1;
  }
  
  public static int indexOfDifference(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    int j;
    if (paramCharSequence1 == paramCharSequence2)
    {
      j = -1;
      return j;
    }
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      return 0;
    }
    int i = 0;
    for (;;)
    {
      if ((i >= paramCharSequence1.length()) || (i >= paramCharSequence2.length()) || (paramCharSequence1.charAt(i) != paramCharSequence2.charAt(i)))
      {
        j = i;
        if (i < paramCharSequence2.length()) {
          break;
        }
        j = i;
        if (i < paramCharSequence1.length()) {
          break;
        }
        return -1;
      }
      i += 1;
    }
  }
  
  public static int indexOfDifference(CharSequence... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length <= 1))
    {
      j = -1;
      return j;
    }
    int k = 0;
    int m = 1;
    int i2 = paramVarArgs.length;
    int i = Integer.MAX_VALUE;
    int n = 0;
    int j = 0;
    if (j < i2)
    {
      if (paramVarArgs[j] == null)
      {
        k = 1;
        i = 0;
      }
      for (;;)
      {
        j += 1;
        break;
        m = 0;
        i = Math.min(paramVarArgs[j].length(), i);
        n = Math.max(paramVarArgs[j].length(), n);
      }
    }
    if ((m != 0) || ((n == 0) && (k == 0))) {
      return -1;
    }
    if (i == 0) {
      return 0;
    }
    k = -1;
    j = 0;
    for (;;)
    {
      m = k;
      int i3;
      int i1;
      if (j < i)
      {
        i3 = paramVarArgs[0].charAt(j);
        i1 = 1;
      }
      for (;;)
      {
        m = k;
        if (i1 < i2)
        {
          if (paramVarArgs[i1].charAt(j) != i3) {
            m = j;
          }
        }
        else
        {
          if (m == -1) {
            break label197;
          }
          if (m == -1)
          {
            j = i;
            if (i != n) {
              break;
            }
          }
          return m;
        }
        i1 += 1;
      }
      label197:
      j += 1;
      k = m;
    }
  }
  
  public static int indexOfIgnoreCase(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    return indexOfIgnoreCase(paramCharSequence1, paramCharSequence2, 0);
  }
  
  public static int indexOfIgnoreCase(CharSequence paramCharSequence1, CharSequence paramCharSequence2, int paramInt)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null))
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    int j = paramCharSequence1.length() - paramCharSequence2.length() + 1;
    if (i > j) {
      return -1;
    }
    if (paramCharSequence2.length() == 0) {
      return i;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt >= j) {
        break label90;
      }
      i = paramInt;
      if (CharSequenceUtils.regionMatches(paramCharSequence1, true, paramInt, paramCharSequence2, 0, paramCharSequence2.length())) {
        break;
      }
      paramInt += 1;
    }
    label90:
    return -1;
  }
  
  public static boolean isAllLowerCase(CharSequence paramCharSequence)
  {
    if ((paramCharSequence == null) || (isEmpty(paramCharSequence))) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label47;
      }
      if (!Character.isLowerCase(paramCharSequence.charAt(i))) {
        break;
      }
      i += 1;
    }
    label47:
    return true;
  }
  
  public static boolean isAllUpperCase(CharSequence paramCharSequence)
  {
    if ((paramCharSequence == null) || (isEmpty(paramCharSequence))) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label47;
      }
      if (!Character.isUpperCase(paramCharSequence.charAt(i))) {
        break;
      }
      i += 1;
    }
    label47:
    return true;
  }
  
  public static boolean isAlpha(CharSequence paramCharSequence)
  {
    if (isEmpty(paramCharSequence)) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label43;
      }
      if (!Character.isLetter(paramCharSequence.charAt(i))) {
        break;
      }
      i += 1;
    }
    label43:
    return true;
  }
  
  public static boolean isAlphaSpace(CharSequence paramCharSequence)
  {
    if (paramCharSequence == null) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label52;
      }
      if ((!Character.isLetter(paramCharSequence.charAt(i))) && (paramCharSequence.charAt(i) != ' ')) {
        break;
      }
      i += 1;
    }
    label52:
    return true;
  }
  
  public static boolean isAlphanumeric(CharSequence paramCharSequence)
  {
    if (isEmpty(paramCharSequence)) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label43;
      }
      if (!Character.isLetterOrDigit(paramCharSequence.charAt(i))) {
        break;
      }
      i += 1;
    }
    label43:
    return true;
  }
  
  public static boolean isAlphanumericSpace(CharSequence paramCharSequence)
  {
    if (paramCharSequence == null) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label52;
      }
      if ((!Character.isLetterOrDigit(paramCharSequence.charAt(i))) && (paramCharSequence.charAt(i) != ' ')) {
        break;
      }
      i += 1;
    }
    label52:
    return true;
  }
  
  public static boolean isAnyBlank(CharSequence... paramVarArgs)
  {
    if (ArrayUtils.isEmpty(paramVarArgs)) {
      return true;
    }
    int j = paramVarArgs.length;
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label35;
      }
      if (isBlank(paramVarArgs[i])) {
        break;
      }
      i += 1;
    }
    label35:
    return false;
  }
  
  public static boolean isAnyEmpty(CharSequence... paramVarArgs)
  {
    if (ArrayUtils.isEmpty(paramVarArgs)) {
      return true;
    }
    int j = paramVarArgs.length;
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label35;
      }
      if (isEmpty(paramVarArgs[i])) {
        break;
      }
      i += 1;
    }
    label35:
    return false;
  }
  
  public static boolean isAsciiPrintable(CharSequence paramCharSequence)
  {
    if (paramCharSequence == null) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label40;
      }
      if (!CharUtils.isAsciiPrintable(paramCharSequence.charAt(i))) {
        break;
      }
      i += 1;
    }
    label40:
    return true;
  }
  
  public static boolean isBlank(CharSequence paramCharSequence)
  {
    int j;
    if (paramCharSequence != null)
    {
      j = paramCharSequence.length();
      if (j != 0) {
        break label17;
      }
    }
    for (;;)
    {
      return true;
      label17:
      int i = 0;
      while (i < j)
      {
        if (!Character.isWhitespace(paramCharSequence.charAt(i))) {
          return false;
        }
        i += 1;
      }
    }
  }
  
  public static boolean isEmpty(CharSequence paramCharSequence)
  {
    return (paramCharSequence == null) || (paramCharSequence.length() == 0);
  }
  
  public static boolean isNoneBlank(CharSequence... paramVarArgs)
  {
    return !isAnyBlank(paramVarArgs);
  }
  
  public static boolean isNoneEmpty(CharSequence... paramVarArgs)
  {
    return !isAnyEmpty(paramVarArgs);
  }
  
  public static boolean isNotBlank(CharSequence paramCharSequence)
  {
    return !isBlank(paramCharSequence);
  }
  
  public static boolean isNotEmpty(CharSequence paramCharSequence)
  {
    return !isEmpty(paramCharSequence);
  }
  
  public static boolean isNumeric(CharSequence paramCharSequence)
  {
    if (isEmpty(paramCharSequence)) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label43;
      }
      if (!Character.isDigit(paramCharSequence.charAt(i))) {
        break;
      }
      i += 1;
    }
    label43:
    return true;
  }
  
  public static boolean isNumericSpace(CharSequence paramCharSequence)
  {
    if (paramCharSequence == null) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label52;
      }
      if ((!Character.isDigit(paramCharSequence.charAt(i))) && (paramCharSequence.charAt(i) != ' ')) {
        break;
      }
      i += 1;
    }
    label52:
    return true;
  }
  
  public static boolean isWhitespace(CharSequence paramCharSequence)
  {
    if (paramCharSequence == null) {
      return false;
    }
    int j = paramCharSequence.length();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label40;
      }
      if (!Character.isWhitespace(paramCharSequence.charAt(i))) {
        break;
      }
      i += 1;
    }
    label40:
    return true;
  }
  
  public static String join(Iterable<?> paramIterable, char paramChar)
  {
    if (paramIterable == null) {
      return null;
    }
    return join(paramIterable.iterator(), paramChar);
  }
  
  public static String join(Iterable<?> paramIterable, String paramString)
  {
    if (paramIterable == null) {
      return null;
    }
    return join(paramIterable.iterator(), paramString);
  }
  
  public static String join(Iterator<?> paramIterator, char paramChar)
  {
    if (paramIterator == null) {
      return null;
    }
    if (!paramIterator.hasNext()) {
      return "";
    }
    Object localObject = paramIterator.next();
    if (!paramIterator.hasNext()) {
      return ObjectUtils.toString(localObject);
    }
    StringBuilder localStringBuilder = new StringBuilder(256);
    if (localObject != null) {
      localStringBuilder.append(localObject);
    }
    while (paramIterator.hasNext())
    {
      localStringBuilder.append(paramChar);
      localObject = paramIterator.next();
      if (localObject != null) {
        localStringBuilder.append(localObject);
      }
    }
    return localStringBuilder.toString();
  }
  
  public static String join(Iterator<?> paramIterator, String paramString)
  {
    if (paramIterator == null) {
      return null;
    }
    if (!paramIterator.hasNext()) {
      return "";
    }
    Object localObject = paramIterator.next();
    if (!paramIterator.hasNext()) {
      return ObjectUtils.toString(localObject);
    }
    StringBuilder localStringBuilder = new StringBuilder(256);
    if (localObject != null) {
      localStringBuilder.append(localObject);
    }
    while (paramIterator.hasNext())
    {
      if (paramString != null) {
        localStringBuilder.append(paramString);
      }
      localObject = paramIterator.next();
      if (localObject != null) {
        localStringBuilder.append(localObject);
      }
    }
    return localStringBuilder.toString();
  }
  
  public static String join(byte[] paramArrayOfByte, char paramChar)
  {
    if (paramArrayOfByte == null) {
      return null;
    }
    return join(paramArrayOfByte, paramChar, 0, paramArrayOfByte.length);
  }
  
  public static String join(byte[] paramArrayOfByte, char paramChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfByte == null) {
      return null;
    }
    int i = paramInt2 - paramInt1;
    if (i <= 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder(i * 16);
    i = paramInt1;
    while (i < paramInt2)
    {
      if (i > paramInt1) {
        localStringBuilder.append(paramChar);
      }
      localStringBuilder.append(paramArrayOfByte[i]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static String join(char[] paramArrayOfChar, char paramChar)
  {
    if (paramArrayOfChar == null) {
      return null;
    }
    return join(paramArrayOfChar, paramChar, 0, paramArrayOfChar.length);
  }
  
  public static String join(char[] paramArrayOfChar, char paramChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfChar == null) {
      return null;
    }
    int i = paramInt2 - paramInt1;
    if (i <= 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder(i * 16);
    i = paramInt1;
    while (i < paramInt2)
    {
      if (i > paramInt1) {
        localStringBuilder.append(paramChar);
      }
      localStringBuilder.append(paramArrayOfChar[i]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static String join(double[] paramArrayOfDouble, char paramChar)
  {
    if (paramArrayOfDouble == null) {
      return null;
    }
    return join(paramArrayOfDouble, paramChar, 0, paramArrayOfDouble.length);
  }
  
  public static String join(double[] paramArrayOfDouble, char paramChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfDouble == null) {
      return null;
    }
    int i = paramInt2 - paramInt1;
    if (i <= 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder(i * 16);
    i = paramInt1;
    while (i < paramInt2)
    {
      if (i > paramInt1) {
        localStringBuilder.append(paramChar);
      }
      localStringBuilder.append(paramArrayOfDouble[i]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static String join(float[] paramArrayOfFloat, char paramChar)
  {
    if (paramArrayOfFloat == null) {
      return null;
    }
    return join(paramArrayOfFloat, paramChar, 0, paramArrayOfFloat.length);
  }
  
  public static String join(float[] paramArrayOfFloat, char paramChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfFloat == null) {
      return null;
    }
    int i = paramInt2 - paramInt1;
    if (i <= 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder(i * 16);
    i = paramInt1;
    while (i < paramInt2)
    {
      if (i > paramInt1) {
        localStringBuilder.append(paramChar);
      }
      localStringBuilder.append(paramArrayOfFloat[i]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static String join(int[] paramArrayOfInt, char paramChar)
  {
    if (paramArrayOfInt == null) {
      return null;
    }
    return join(paramArrayOfInt, paramChar, 0, paramArrayOfInt.length);
  }
  
  public static String join(int[] paramArrayOfInt, char paramChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfInt == null) {
      return null;
    }
    int i = paramInt2 - paramInt1;
    if (i <= 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder(i * 16);
    i = paramInt1;
    while (i < paramInt2)
    {
      if (i > paramInt1) {
        localStringBuilder.append(paramChar);
      }
      localStringBuilder.append(paramArrayOfInt[i]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static String join(long[] paramArrayOfLong, char paramChar)
  {
    if (paramArrayOfLong == null) {
      return null;
    }
    return join(paramArrayOfLong, paramChar, 0, paramArrayOfLong.length);
  }
  
  public static String join(long[] paramArrayOfLong, char paramChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfLong == null) {
      return null;
    }
    int i = paramInt2 - paramInt1;
    if (i <= 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder(i * 16);
    i = paramInt1;
    while (i < paramInt2)
    {
      if (i > paramInt1) {
        localStringBuilder.append(paramChar);
      }
      localStringBuilder.append(paramArrayOfLong[i]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static <T> String join(T... paramVarArgs)
  {
    return join(paramVarArgs, null);
  }
  
  public static String join(Object[] paramArrayOfObject, char paramChar)
  {
    if (paramArrayOfObject == null) {
      return null;
    }
    return join(paramArrayOfObject, paramChar, 0, paramArrayOfObject.length);
  }
  
  public static String join(Object[] paramArrayOfObject, char paramChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfObject == null) {
      return null;
    }
    int i = paramInt2 - paramInt1;
    if (i <= 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder(i * 16);
    i = paramInt1;
    while (i < paramInt2)
    {
      if (i > paramInt1) {
        localStringBuilder.append(paramChar);
      }
      if (paramArrayOfObject[i] != null) {
        localStringBuilder.append(paramArrayOfObject[i]);
      }
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static String join(Object[] paramArrayOfObject, String paramString)
  {
    if (paramArrayOfObject == null) {
      return null;
    }
    return join(paramArrayOfObject, paramString, 0, paramArrayOfObject.length);
  }
  
  public static String join(Object[] paramArrayOfObject, String paramString, int paramInt1, int paramInt2)
  {
    if (paramArrayOfObject == null) {
      return null;
    }
    String str = paramString;
    if (paramString == null) {
      str = "";
    }
    int i = paramInt2 - paramInt1;
    if (i <= 0) {
      return "";
    }
    paramString = new StringBuilder(i * 16);
    i = paramInt1;
    while (i < paramInt2)
    {
      if (i > paramInt1) {
        paramString.append(str);
      }
      if (paramArrayOfObject[i] != null) {
        paramString.append(paramArrayOfObject[i]);
      }
      i += 1;
    }
    return paramString.toString();
  }
  
  public static String join(short[] paramArrayOfShort, char paramChar)
  {
    if (paramArrayOfShort == null) {
      return null;
    }
    return join(paramArrayOfShort, paramChar, 0, paramArrayOfShort.length);
  }
  
  public static String join(short[] paramArrayOfShort, char paramChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfShort == null) {
      return null;
    }
    int i = paramInt2 - paramInt1;
    if (i <= 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder(i * 16);
    i = paramInt1;
    while (i < paramInt2)
    {
      if (i > paramInt1) {
        localStringBuilder.append(paramChar);
      }
      localStringBuilder.append(paramArrayOfShort[i]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static int lastIndexOf(CharSequence paramCharSequence, int paramInt)
  {
    if (isEmpty(paramCharSequence)) {
      return -1;
    }
    return CharSequenceUtils.lastIndexOf(paramCharSequence, paramInt, paramCharSequence.length());
  }
  
  public static int lastIndexOf(CharSequence paramCharSequence, int paramInt1, int paramInt2)
  {
    if (isEmpty(paramCharSequence)) {
      return -1;
    }
    return CharSequenceUtils.lastIndexOf(paramCharSequence, paramInt1, paramInt2);
  }
  
  public static int lastIndexOf(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      return -1;
    }
    return CharSequenceUtils.lastIndexOf(paramCharSequence1, paramCharSequence2, paramCharSequence1.length());
  }
  
  public static int lastIndexOf(CharSequence paramCharSequence1, CharSequence paramCharSequence2, int paramInt)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      return -1;
    }
    return CharSequenceUtils.lastIndexOf(paramCharSequence1, paramCharSequence2, paramInt);
  }
  
  public static int lastIndexOfAny(CharSequence paramCharSequence, CharSequence... paramVarArgs)
  {
    int k;
    if ((paramCharSequence == null) || (paramVarArgs == null)) {
      k = -1;
    }
    int n;
    int i;
    int j;
    do
    {
      return k;
      n = paramVarArgs.length;
      i = -1;
      j = 0;
      k = i;
    } while (j >= n);
    CharSequence localCharSequence = paramVarArgs[j];
    if (localCharSequence == null) {
      k = i;
    }
    for (;;)
    {
      j += 1;
      i = k;
      break;
      int m = CharSequenceUtils.lastIndexOf(paramCharSequence, localCharSequence, paramCharSequence.length());
      k = i;
      if (m > i) {
        k = m;
      }
    }
  }
  
  public static int lastIndexOfIgnoreCase(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null)) {
      return -1;
    }
    return lastIndexOfIgnoreCase(paramCharSequence1, paramCharSequence2, paramCharSequence1.length());
  }
  
  public static int lastIndexOfIgnoreCase(CharSequence paramCharSequence1, CharSequence paramCharSequence2, int paramInt)
  {
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null))
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt > paramCharSequence1.length() - paramCharSequence2.length()) {
      i = paramCharSequence1.length() - paramCharSequence2.length();
    }
    if (i < 0) {
      return -1;
    }
    if (paramCharSequence2.length() == 0) {
      return i;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt < 0) {
        break label94;
      }
      i = paramInt;
      if (CharSequenceUtils.regionMatches(paramCharSequence1, true, paramInt, paramCharSequence2, 0, paramCharSequence2.length())) {
        break;
      }
      paramInt -= 1;
    }
    label94:
    return -1;
  }
  
  public static int lastOrdinalIndexOf(CharSequence paramCharSequence1, CharSequence paramCharSequence2, int paramInt)
  {
    return ordinalIndexOf(paramCharSequence1, paramCharSequence2, paramInt, true);
  }
  
  public static String left(String paramString, int paramInt)
  {
    String str;
    if (paramString == null) {
      str = null;
    }
    do
    {
      return str;
      if (paramInt < 0) {
        return "";
      }
      str = paramString;
    } while (paramString.length() <= paramInt);
    return paramString.substring(0, paramInt);
  }
  
  public static String leftPad(String paramString, int paramInt)
  {
    return leftPad(paramString, paramInt, ' ');
  }
  
  public static String leftPad(String paramString, int paramInt, char paramChar)
  {
    String str;
    if (paramString == null) {
      str = null;
    }
    int i;
    do
    {
      return str;
      i = paramInt - paramString.length();
      str = paramString;
    } while (i <= 0);
    if (i > 8192) {
      return leftPad(paramString, paramInt, String.valueOf(paramChar));
    }
    return repeat(paramChar, i).concat(paramString);
  }
  
  public static String leftPad(String paramString1, int paramInt, String paramString2)
  {
    if (paramString1 == null) {
      paramString2 = null;
    }
    int i;
    int j;
    do
    {
      return paramString2;
      localObject = paramString2;
      if (isEmpty(paramString2)) {
        localObject = " ";
      }
      i = ((String)localObject).length();
      j = paramInt - paramString1.length();
      paramString2 = paramString1;
    } while (j <= 0);
    if ((i == 1) && (j <= 8192)) {
      return leftPad(paramString1, paramInt, ((String)localObject).charAt(0));
    }
    if (j == i) {
      return ((String)localObject).concat(paramString1);
    }
    if (j < i) {
      return ((String)localObject).substring(0, j).concat(paramString1);
    }
    paramString2 = new char[j];
    Object localObject = ((String)localObject).toCharArray();
    paramInt = 0;
    while (paramInt < j)
    {
      paramString2[paramInt] = localObject[(paramInt % i)];
      paramInt += 1;
    }
    return new String(paramString2).concat(paramString1);
  }
  
  public static int length(CharSequence paramCharSequence)
  {
    if (paramCharSequence == null) {
      return 0;
    }
    return paramCharSequence.length();
  }
  
  public static String lowerCase(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return paramString.toLowerCase();
  }
  
  public static String lowerCase(String paramString, Locale paramLocale)
  {
    if (paramString == null) {
      return null;
    }
    return paramString.toLowerCase(paramLocale);
  }
  
  public static String mid(String paramString, int paramInt1, int paramInt2)
  {
    if (paramString == null) {
      return null;
    }
    if ((paramInt2 < 0) || (paramInt1 > paramString.length())) {
      return "";
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    if (paramString.length() <= i + paramInt2) {
      return paramString.substring(i);
    }
    return paramString.substring(i, i + paramInt2);
  }
  
  public static String normalizeSpace(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return WHITESPACE_PATTERN.matcher(trim(paramString)).replaceAll(" ");
  }
  
  public static int ordinalIndexOf(CharSequence paramCharSequence1, CharSequence paramCharSequence2, int paramInt)
  {
    return ordinalIndexOf(paramCharSequence1, paramCharSequence2, paramInt, false);
  }
  
  private static int ordinalIndexOf(CharSequence paramCharSequence1, CharSequence paramCharSequence2, int paramInt, boolean paramBoolean)
  {
    int j = -1;
    int m = j;
    if (paramCharSequence1 != null)
    {
      m = j;
      if (paramCharSequence2 != null)
      {
        if (paramInt > 0) {
          break label30;
        }
        m = j;
      }
    }
    return m;
    label30:
    if (paramCharSequence2.length() == 0)
    {
      if (paramBoolean) {}
      for (paramInt = paramCharSequence1.length();; paramInt = 0) {
        return paramInt;
      }
    }
    int i = 0;
    int k = i;
    if (paramBoolean)
    {
      j = paramCharSequence1.length();
      k = i;
    }
    label80:
    if (paramBoolean) {}
    for (i = CharSequenceUtils.lastIndexOf(paramCharSequence1, paramCharSequence2, j - 1);; i = CharSequenceUtils.indexOf(paramCharSequence1, paramCharSequence2, j + 1))
    {
      m = i;
      if (i < 0) {
        break;
      }
      m = k + 1;
      k = m;
      j = i;
      if (m < paramInt) {
        break label80;
      }
      return i;
    }
  }
  
  public static String overlay(String paramString1, String paramString2, int paramInt1, int paramInt2)
  {
    if (paramString1 == null) {
      return null;
    }
    String str = paramString2;
    if (paramString2 == null) {
      str = "";
    }
    int j = paramString1.length();
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = i;
    if (i > j) {
      paramInt1 = j;
    }
    i = paramInt2;
    if (paramInt2 < 0) {
      i = 0;
    }
    paramInt2 = i;
    if (i > j) {
      paramInt2 = j;
    }
    int k = paramInt1;
    i = paramInt2;
    if (paramInt1 > paramInt2)
    {
      i = paramInt1;
      k = paramInt2;
    }
    return j + k - i + str.length() + 1 + paramString1.substring(0, k) + str + paramString1.substring(i);
  }
  
  private static String prependIfMissing(String paramString, CharSequence paramCharSequence, boolean paramBoolean, CharSequence... paramVarArgs)
  {
    if ((paramString == null) || (isEmpty(paramCharSequence)) || (startsWith(paramString, paramCharSequence, paramBoolean))) {
      return paramString;
    }
    if ((paramVarArgs != null) && (paramVarArgs.length > 0))
    {
      int j = paramVarArgs.length;
      int i = 0;
      for (;;)
      {
        if (i >= j) {
          break label66;
        }
        if (startsWith(paramString, paramVarArgs[i], paramBoolean)) {
          break;
        }
        i += 1;
      }
    }
    label66:
    return paramCharSequence.toString() + paramString;
  }
  
  public static String prependIfMissing(String paramString, CharSequence paramCharSequence, CharSequence... paramVarArgs)
  {
    return prependIfMissing(paramString, paramCharSequence, false, paramVarArgs);
  }
  
  public static String prependIfMissingIgnoreCase(String paramString, CharSequence paramCharSequence, CharSequence... paramVarArgs)
  {
    return prependIfMissing(paramString, paramCharSequence, true, paramVarArgs);
  }
  
  public static String remove(String paramString, char paramChar)
  {
    if ((isEmpty(paramString)) || (paramString.indexOf(paramChar) == -1)) {
      return paramString;
    }
    paramString = paramString.toCharArray();
    int j = 0;
    int i = 0;
    while (i < paramString.length)
    {
      int k = j;
      if (paramString[i] != paramChar)
      {
        paramString[j] = paramString[i];
        k = j + 1;
      }
      i += 1;
      j = k;
    }
    return new String(paramString, 0, j);
  }
  
  public static String remove(String paramString1, String paramString2)
  {
    if ((isEmpty(paramString1)) || (isEmpty(paramString2))) {
      return paramString1;
    }
    return replace(paramString1, paramString2, "", -1);
  }
  
  public static String removeEnd(String paramString1, String paramString2)
  {
    if ((isEmpty(paramString1)) || (isEmpty(paramString2))) {}
    while (!paramString1.endsWith(paramString2)) {
      return paramString1;
    }
    return paramString1.substring(0, paramString1.length() - paramString2.length());
  }
  
  public static String removeEndIgnoreCase(String paramString1, String paramString2)
  {
    if ((isEmpty(paramString1)) || (isEmpty(paramString2))) {}
    while (!endsWithIgnoreCase(paramString1, paramString2)) {
      return paramString1;
    }
    return paramString1.substring(0, paramString1.length() - paramString2.length());
  }
  
  public static String removePattern(String paramString1, String paramString2)
  {
    return replacePattern(paramString1, paramString2, "");
  }
  
  public static String removeStart(String paramString1, String paramString2)
  {
    if ((isEmpty(paramString1)) || (isEmpty(paramString2))) {}
    while (!paramString1.startsWith(paramString2)) {
      return paramString1;
    }
    return paramString1.substring(paramString2.length());
  }
  
  public static String removeStartIgnoreCase(String paramString1, String paramString2)
  {
    if ((isEmpty(paramString1)) || (isEmpty(paramString2))) {}
    while (!startsWithIgnoreCase(paramString1, paramString2)) {
      return paramString1;
    }
    return paramString1.substring(paramString2.length());
  }
  
  public static String repeat(char paramChar, int paramInt)
  {
    char[] arrayOfChar = new char[paramInt];
    paramInt -= 1;
    while (paramInt >= 0)
    {
      arrayOfChar[paramInt] = paramChar;
      paramInt -= 1;
    }
    return new String(arrayOfChar);
  }
  
  public static String repeat(String paramString, int paramInt)
  {
    Object localObject;
    if (paramString == null) {
      localObject = null;
    }
    int k;
    do
    {
      do
      {
        return (String)localObject;
        if (paramInt <= 0) {
          return "";
        }
        k = paramString.length();
        localObject = paramString;
      } while (paramInt == 1);
      localObject = paramString;
    } while (k == 0);
    if ((k == 1) && (paramInt <= 8192)) {
      return repeat(paramString.charAt(0), paramInt);
    }
    int m = k * paramInt;
    switch (k)
    {
    default: 
      localObject = new StringBuilder(m);
      k = 0;
    }
    while (k < paramInt)
    {
      ((StringBuilder)localObject).append(paramString);
      k += 1;
      continue;
      return repeat(paramString.charAt(0), paramInt);
      int i = paramString.charAt(0);
      int j = paramString.charAt(1);
      paramString = new char[m];
      for (paramInt = paramInt * 2 - 2; paramInt >= 0; paramInt = paramInt - 1 - 1)
      {
        paramString[paramInt] = i;
        paramString[(paramInt + 1)] = j;
      }
      return new String(paramString);
    }
    return ((StringBuilder)localObject).toString();
  }
  
  public static String repeat(String paramString1, String paramString2, int paramInt)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return repeat(paramString1, paramInt);
    }
    return removeEnd(repeat(paramString1 + paramString2, paramInt), paramString2);
  }
  
  public static String replace(String paramString1, String paramString2, String paramString3)
  {
    return replace(paramString1, paramString2, paramString3, -1);
  }
  
  public static String replace(String paramString1, String paramString2, String paramString3, int paramInt)
  {
    int i = 64;
    if ((isEmpty(paramString1)) || (isEmpty(paramString2)) || (paramString3 == null) || (paramInt == 0)) {}
    int m;
    int k;
    do
    {
      return paramString1;
      m = 0;
      k = paramString1.indexOf(paramString2, 0);
    } while (k == -1);
    int i1 = paramString2.length();
    int n = paramString3.length() - i1;
    int j = n;
    if (n < 0) {
      j = 0;
    }
    StringBuilder localStringBuilder;
    if (paramInt < 0)
    {
      i = 16;
      localStringBuilder = new StringBuilder(paramString1.length() + j * i);
      i = paramInt;
      paramInt = m;
    }
    for (j = k;; j = paramString1.indexOf(paramString2, paramInt))
    {
      k = paramInt;
      if (j != -1)
      {
        localStringBuilder.append(paramString1.substring(paramInt, j)).append(paramString3);
        paramInt = j + i1;
        i -= 1;
        if (i == 0) {
          k = paramInt;
        }
      }
      else
      {
        localStringBuilder.append(paramString1.substring(k));
        return localStringBuilder.toString();
        if (paramInt > 64) {
          break;
        }
        i = paramInt;
        break;
      }
    }
  }
  
  public static String replaceChars(String paramString, char paramChar1, char paramChar2)
  {
    if (paramString == null) {
      return null;
    }
    return paramString.replace(paramChar1, paramChar2);
  }
  
  public static String replaceChars(String paramString1, String paramString2, String paramString3)
  {
    if ((isEmpty(paramString1)) || (isEmpty(paramString2))) {}
    int j;
    do
    {
      return paramString1;
      String str = paramString3;
      if (paramString3 == null) {
        str = "";
      }
      j = 0;
      int m = str.length();
      int n = paramString1.length();
      paramString3 = new StringBuilder(n);
      int i = 0;
      if (i < n)
      {
        char c = paramString1.charAt(i);
        int i1 = paramString2.indexOf(c);
        if (i1 >= 0)
        {
          int k = 1;
          j = k;
          if (i1 < m)
          {
            paramString3.append(str.charAt(i1));
            j = k;
          }
        }
        for (;;)
        {
          i += 1;
          break;
          paramString3.append(c);
        }
      }
    } while (j == 0);
    return paramString3.toString();
  }
  
  public static String replaceEach(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    return replaceEach(paramString, paramArrayOfString1, paramArrayOfString2, false, 0);
  }
  
  private static String replaceEach(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2, boolean paramBoolean, int paramInt)
  {
    if ((paramString == null) || (paramString.isEmpty()) || (paramArrayOfString1 == null) || (paramArrayOfString1.length == 0) || (paramArrayOfString2 == null) || (paramArrayOfString2.length == 0)) {}
    int i3;
    boolean[] arrayOfBoolean;
    label205:
    do
    {
      return paramString;
      if (paramInt < 0) {
        throw new IllegalStateException("Aborting to protect against StackOverflowError - output of one loop is the input of another");
      }
      i3 = paramArrayOfString1.length;
      i = paramArrayOfString2.length;
      if (i3 != i) {
        throw new IllegalArgumentException("Search and Replace array lengths don't match: " + i3 + " vs " + i);
      }
      arrayOfBoolean = new boolean[i3];
      i = -1;
      j = -1;
      k = 0;
      if (k < i3)
      {
        m = j;
        n = i;
        if (arrayOfBoolean[k] == 0)
        {
          m = j;
          n = i;
          if (paramArrayOfString1[k] != null)
          {
            m = j;
            n = i;
            if (!paramArrayOfString1[k].isEmpty())
            {
              if (paramArrayOfString2[k] != null) {
                break label205;
              }
              n = i;
              m = j;
            }
          }
        }
        for (;;)
        {
          k += 1;
          j = m;
          i = n;
          break;
          i1 = paramString.indexOf(paramArrayOfString1[k]);
          if (i1 == -1)
          {
            arrayOfBoolean[k] = true;
            m = j;
            n = i;
          }
          else if (i != -1)
          {
            m = j;
            n = i;
            if (i1 >= i) {}
          }
          else
          {
            n = i1;
            m = k;
          }
        }
      }
    } while (i == -1);
    int i1 = 0;
    int m = 0;
    int k = 0;
    label327:
    int i2;
    if (k < paramArrayOfString1.length)
    {
      n = m;
      if (paramArrayOfString1[k] != null)
      {
        if (paramArrayOfString2[k] != null) {
          break label327;
        }
        n = m;
      }
      for (;;)
      {
        k += 1;
        m = n;
        break;
        i2 = paramArrayOfString2[k].length() - paramArrayOfString1[k].length();
        n = m;
        if (i2 > 0) {
          n = m + i2 * 3;
        }
      }
    }
    k = Math.min(m, paramString.length() / 5);
    StringBuilder localStringBuilder = new StringBuilder(paramString.length() + k);
    int n = i;
    int i = i1;
    i1 = j;
    while (n != -1)
    {
      while (i < n)
      {
        localStringBuilder.append(paramString.charAt(i));
        i += 1;
      }
      localStringBuilder.append(paramArrayOfString2[i1]);
      i2 = n + paramArrayOfString1[i1].length();
      k = -1;
      m = -1;
      j = 0;
      i1 = m;
      i = i2;
      n = k;
      if (j < i3)
      {
        i = m;
        n = k;
        if (arrayOfBoolean[j] == 0)
        {
          i = m;
          n = k;
          if (paramArrayOfString1[j] != null)
          {
            i = m;
            n = k;
            if (!paramArrayOfString1[j].isEmpty())
            {
              if (paramArrayOfString2[j] != null) {
                break label571;
              }
              n = k;
              i = m;
            }
          }
        }
        for (;;)
        {
          j += 1;
          m = i;
          k = n;
          break;
          label571:
          i1 = paramString.indexOf(paramArrayOfString1[j], i2);
          if (i1 == -1)
          {
            arrayOfBoolean[j] = true;
            i = m;
            n = k;
          }
          else if (k != -1)
          {
            i = m;
            n = k;
            if (i1 >= k) {}
          }
          else
          {
            n = i1;
            i = j;
          }
        }
      }
    }
    int j = paramString.length();
    while (i < j)
    {
      localStringBuilder.append(paramString.charAt(i));
      i += 1;
    }
    paramString = localStringBuilder.toString();
    if (!paramBoolean) {
      return paramString;
    }
    return replaceEach(paramString, paramArrayOfString1, paramArrayOfString2, paramBoolean, paramInt - 1);
  }
  
  public static String replaceEachRepeatedly(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    if (paramArrayOfString1 == null) {}
    for (int i = 0;; i = paramArrayOfString1.length) {
      return replaceEach(paramString, paramArrayOfString1, paramArrayOfString2, true, i);
    }
  }
  
  public static String replaceOnce(String paramString1, String paramString2, String paramString3)
  {
    return replace(paramString1, paramString2, paramString3, 1);
  }
  
  public static String replacePattern(String paramString1, String paramString2, String paramString3)
  {
    return Pattern.compile(paramString2, 32).matcher(paramString1).replaceAll(paramString3);
  }
  
  public static String reverse(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return new StringBuilder(paramString).reverse().toString();
  }
  
  public static String reverseDelimited(String paramString, char paramChar)
  {
    if (paramString == null) {
      return null;
    }
    paramString = split(paramString, paramChar);
    ArrayUtils.reverse(paramString);
    return join(paramString, paramChar);
  }
  
  public static String right(String paramString, int paramInt)
  {
    String str;
    if (paramString == null) {
      str = null;
    }
    do
    {
      return str;
      if (paramInt < 0) {
        return "";
      }
      str = paramString;
    } while (paramString.length() <= paramInt);
    return paramString.substring(paramString.length() - paramInt);
  }
  
  public static String rightPad(String paramString, int paramInt)
  {
    return rightPad(paramString, paramInt, ' ');
  }
  
  public static String rightPad(String paramString, int paramInt, char paramChar)
  {
    String str;
    if (paramString == null) {
      str = null;
    }
    int i;
    do
    {
      return str;
      i = paramInt - paramString.length();
      str = paramString;
    } while (i <= 0);
    if (i > 8192) {
      return rightPad(paramString, paramInt, String.valueOf(paramChar));
    }
    return paramString.concat(repeat(paramChar, i));
  }
  
  public static String rightPad(String paramString1, int paramInt, String paramString2)
  {
    if (paramString1 == null) {
      paramString2 = null;
    }
    int i;
    int j;
    do
    {
      return paramString2;
      localObject = paramString2;
      if (isEmpty(paramString2)) {
        localObject = " ";
      }
      i = ((String)localObject).length();
      j = paramInt - paramString1.length();
      paramString2 = paramString1;
    } while (j <= 0);
    if ((i == 1) && (j <= 8192)) {
      return rightPad(paramString1, paramInt, ((String)localObject).charAt(0));
    }
    if (j == i) {
      return paramString1.concat((String)localObject);
    }
    if (j < i) {
      return paramString1.concat(((String)localObject).substring(0, j));
    }
    paramString2 = new char[j];
    Object localObject = ((String)localObject).toCharArray();
    paramInt = 0;
    while (paramInt < j)
    {
      paramString2[paramInt] = localObject[(paramInt % i)];
      paramInt += 1;
    }
    return paramString1.concat(new String(paramString2));
  }
  
  private static double score(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    String str1;
    String str2;
    if (paramCharSequence1.length() > paramCharSequence2.length())
    {
      paramCharSequence1 = paramCharSequence1.toString().toLowerCase();
      paramCharSequence2 = paramCharSequence2.toString().toLowerCase();
      i = paramCharSequence2.length() / 2 + 1;
      str1 = getSetOfMatchingCharacterWithin(paramCharSequence2, paramCharSequence1, i);
      str2 = getSetOfMatchingCharacterWithin(paramCharSequence1, paramCharSequence2, i);
      if ((str1.length() != 0) && (str2.length() != 0)) {
        break label103;
      }
    }
    label103:
    while (str1.length() != str2.length())
    {
      return 0.0D;
      paramCharSequence2 = paramCharSequence2.toString().toLowerCase();
      str1 = paramCharSequence1.toString().toLowerCase();
      paramCharSequence1 = paramCharSequence2;
      paramCharSequence2 = str1;
      break;
    }
    int i = transpositions(str1, str2);
    return (str1.length() / paramCharSequence2.length() + str2.length() / paramCharSequence1.length() + (str1.length() - i) / str1.length()) / 3.0D;
  }
  
  public static String[] split(String paramString)
  {
    return split(paramString, null, -1);
  }
  
  public static String[] split(String paramString, char paramChar)
  {
    return splitWorker(paramString, paramChar, false);
  }
  
  public static String[] split(String paramString1, String paramString2)
  {
    return splitWorker(paramString1, paramString2, -1, false);
  }
  
  public static String[] split(String paramString1, String paramString2, int paramInt)
  {
    return splitWorker(paramString1, paramString2, paramInt, false);
  }
  
  public static String[] splitByCharacterType(String paramString)
  {
    return splitByCharacterType(paramString, false);
  }
  
  private static String[] splitByCharacterType(String paramString, boolean paramBoolean)
  {
    if (paramString == null) {
      return null;
    }
    if (paramString.isEmpty()) {
      return ArrayUtils.EMPTY_STRING_ARRAY;
    }
    paramString = paramString.toCharArray();
    ArrayList localArrayList = new ArrayList();
    int k = 0;
    int i = Character.getType(paramString[0]);
    int j = 0 + 1;
    while (j < paramString.length)
    {
      int m = Character.getType(paramString[j]);
      if (m == i)
      {
        m = k;
        k = i;
        j += 1;
        i = k;
        k = m;
      }
      else
      {
        int n;
        if ((paramBoolean) && (m == 2) && (i == 1))
        {
          n = j - 1;
          i = k;
          if (n != k) {
            localArrayList.add(new String(paramString, k, n - k));
          }
        }
        for (i = n;; i = j)
        {
          k = m;
          m = i;
          break;
          localArrayList.add(new String(paramString, k, j - k));
        }
      }
    }
    localArrayList.add(new String(paramString, k, paramString.length - k));
    return (String[])localArrayList.toArray(new String[localArrayList.size()]);
  }
  
  public static String[] splitByCharacterTypeCamelCase(String paramString)
  {
    return splitByCharacterType(paramString, true);
  }
  
  public static String[] splitByWholeSeparator(String paramString1, String paramString2)
  {
    return splitByWholeSeparatorWorker(paramString1, paramString2, -1, false);
  }
  
  public static String[] splitByWholeSeparator(String paramString1, String paramString2, int paramInt)
  {
    return splitByWholeSeparatorWorker(paramString1, paramString2, paramInt, false);
  }
  
  public static String[] splitByWholeSeparatorPreserveAllTokens(String paramString1, String paramString2)
  {
    return splitByWholeSeparatorWorker(paramString1, paramString2, -1, true);
  }
  
  public static String[] splitByWholeSeparatorPreserveAllTokens(String paramString1, String paramString2, int paramInt)
  {
    return splitByWholeSeparatorWorker(paramString1, paramString2, paramInt, true);
  }
  
  private static String[] splitByWholeSeparatorWorker(String paramString1, String paramString2, int paramInt, boolean paramBoolean)
  {
    if (paramString1 == null) {
      return null;
    }
    int j = paramString1.length();
    if (j == 0) {
      return ArrayUtils.EMPTY_STRING_ARRAY;
    }
    if ((paramString2 == null) || ("".equals(paramString2))) {
      return splitWorker(paramString1, null, paramInt, paramBoolean);
    }
    int i2 = paramString2.length();
    ArrayList localArrayList = new ArrayList();
    int m = 0;
    int k = 0;
    int i = 0;
    while (i < j)
    {
      int n = paramString1.indexOf(paramString2, k);
      if (n > -1)
      {
        if (n > k)
        {
          m += 1;
          if (m == paramInt)
          {
            i = j;
            localArrayList.add(paramString1.substring(k));
          }
          else
          {
            localArrayList.add(paramString1.substring(k, n));
            k = n + i2;
            i = n;
          }
        }
        else
        {
          i = n;
          int i1 = m;
          if (paramBoolean)
          {
            i1 = m + 1;
            if (i1 != paramInt) {
              break label208;
            }
            i = j;
            localArrayList.add(paramString1.substring(k));
          }
          for (;;)
          {
            k = i + i2;
            m = i1;
            break;
            label208:
            localArrayList.add("");
            i = n;
          }
        }
      }
      else
      {
        localArrayList.add(paramString1.substring(k));
        i = j;
      }
    }
    return (String[])localArrayList.toArray(new String[localArrayList.size()]);
  }
  
  public static String[] splitPreserveAllTokens(String paramString)
  {
    return splitWorker(paramString, null, -1, true);
  }
  
  public static String[] splitPreserveAllTokens(String paramString, char paramChar)
  {
    return splitWorker(paramString, paramChar, true);
  }
  
  public static String[] splitPreserveAllTokens(String paramString1, String paramString2)
  {
    return splitWorker(paramString1, paramString2, -1, true);
  }
  
  public static String[] splitPreserveAllTokens(String paramString1, String paramString2, int paramInt)
  {
    return splitWorker(paramString1, paramString2, paramInt, true);
  }
  
  private static String[] splitWorker(String paramString, char paramChar, boolean paramBoolean)
  {
    if (paramString == null) {
      return null;
    }
    int n = paramString.length();
    if (n == 0) {
      return ArrayUtils.EMPTY_STRING_ARRAY;
    }
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    int m = 0;
    int k = 0;
    int j = 0;
    while (i < n) {
      if (paramString.charAt(i) == paramChar)
      {
        if ((k != 0) || (paramBoolean))
        {
          localArrayList.add(paramString.substring(m, i));
          k = 0;
          j = 1;
        }
        i += 1;
        m = i;
      }
      else
      {
        j = 0;
        k = 1;
        i += 1;
      }
    }
    if ((k != 0) || ((paramBoolean) && (j != 0))) {
      localArrayList.add(paramString.substring(m, i));
    }
    return (String[])localArrayList.toArray(new String[localArrayList.size()]);
  }
  
  private static String[] splitWorker(String paramString1, String paramString2, int paramInt, boolean paramBoolean)
  {
    if (paramString1 == null) {
      return null;
    }
    int n = paramString1.length();
    if (n == 0) {
      return ArrayUtils.EMPTY_STRING_ARRAY;
    }
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    int i8 = 0;
    int i2 = 0;
    int i5 = 0;
    int i1 = 0;
    int i7 = 0;
    int i3 = 0;
    int i4 = 0;
    int m = 0;
    int j = 0;
    int i6 = 0;
    int k = 0;
    if (paramString2 == null)
    {
      j = 1;
      i1 = i7;
      i = i2;
      i5 = i;
      i4 = k;
      i2 = m;
      i3 = j;
      i3 = i1;
      if (i >= n) {
        break label520;
      }
      if (Character.isWhitespace(paramString1.charAt(i)))
      {
        if ((m == 0) && (!paramBoolean)) {
          break label568;
        }
        k = 1;
        m = j + 1;
        if (j == paramInt)
        {
          i = n;
          k = 0;
        }
        localArrayList.add(paramString1.substring(i1, i));
        i1 = 0;
        j = m;
        m = i1;
      }
    }
    label340:
    label517:
    label520:
    label539:
    label568:
    for (;;)
    {
      i += 1;
      i1 = i;
      break;
      k = 0;
      m = 1;
      i += 1;
      break;
      if (paramString2.length() == 1)
      {
        i4 = paramString2.charAt(0);
        i1 = 1;
        m = i5;
        k = i3;
        while (i < n) {
          if (paramString1.charAt(i) == i4)
          {
            if ((k == 0) && (!paramBoolean)) {
              break label539;
            }
            j = 1;
            k = i1 + 1;
            if (i1 == paramInt)
            {
              i = n;
              j = 0;
            }
            localArrayList.add(paramString1.substring(m, i));
            m = 0;
            i += 1;
            i2 = i;
            i1 = k;
            k = m;
            m = i2;
          }
          else
          {
            j = 0;
            k = 1;
            i += 1;
          }
        }
        if ((k != 0) || ((paramBoolean) && (j != 0))) {
          localArrayList.add(paramString1.substring(m, i));
        }
        return (String[])localArrayList.toArray(new String[localArrayList.size()]);
      }
      for (;;)
      {
        i5 = i;
        i4 = j;
        i2 = m;
        i3 = k;
        i3 = i1;
        if (i < n)
        {
          if (paramString2.indexOf(paramString1.charAt(i)) >= 0)
          {
            if ((m == 0) && (!paramBoolean)) {
              break label517;
            }
            j = 1;
            m = k + 1;
            if (k == paramInt)
            {
              i = n;
              j = 0;
            }
            localArrayList.add(paramString1.substring(i1, i));
            i1 = 0;
            k = m;
            m = i1;
          }
          for (;;)
          {
            i += 1;
            i1 = i;
            break;
            j = 0;
            m = 1;
            i += 1;
            break;
          }
        }
        i = i5;
        j = i4;
        k = i2;
        m = i3;
        break label340;
        m = k;
        k = i1;
        break;
        k = 1;
        i = i8;
        j = i6;
        m = i4;
      }
    }
  }
  
  public static boolean startsWith(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    return startsWith(paramCharSequence1, paramCharSequence2, false);
  }
  
  private static boolean startsWith(CharSequence paramCharSequence1, CharSequence paramCharSequence2, boolean paramBoolean)
  {
    boolean bool2 = false;
    boolean bool1;
    if ((paramCharSequence1 == null) || (paramCharSequence2 == null))
    {
      bool1 = bool2;
      if (paramCharSequence1 == null)
      {
        bool1 = bool2;
        if (paramCharSequence2 == null) {
          bool1 = true;
        }
      }
    }
    do
    {
      return bool1;
      bool1 = bool2;
    } while (paramCharSequence2.length() > paramCharSequence1.length());
    return CharSequenceUtils.regionMatches(paramCharSequence1, paramBoolean, 0, paramCharSequence2, 0, paramCharSequence2.length());
  }
  
  public static boolean startsWithAny(CharSequence paramCharSequence, CharSequence... paramVarArgs)
  {
    if ((isEmpty(paramCharSequence)) || (ArrayUtils.isEmpty(paramVarArgs))) {}
    for (;;)
    {
      return false;
      int j = paramVarArgs.length;
      int i = 0;
      while (i < j)
      {
        if (startsWith(paramCharSequence, paramVarArgs[i])) {
          return true;
        }
        i += 1;
      }
    }
  }
  
  public static boolean startsWithIgnoreCase(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    return startsWith(paramCharSequence1, paramCharSequence2, true);
  }
  
  public static String strip(String paramString)
  {
    return strip(paramString, null);
  }
  
  public static String strip(String paramString1, String paramString2)
  {
    if (isEmpty(paramString1)) {
      return paramString1;
    }
    return stripEnd(stripStart(paramString1, paramString2), paramString2);
  }
  
  public static String stripAccents(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return Pattern.compile("\\p{InCombiningDiacriticalMarks}+").matcher(Normalizer.normalize(paramString, Normalizer.Form.NFD)).replaceAll("");
  }
  
  public static String[] stripAll(String... paramVarArgs)
  {
    return stripAll(paramVarArgs, null);
  }
  
  public static String[] stripAll(String[] paramArrayOfString, String paramString)
  {
    int j;
    Object localObject;
    if (paramArrayOfString != null)
    {
      j = paramArrayOfString.length;
      if (j != 0) {}
    }
    else
    {
      localObject = paramArrayOfString;
      return (String[])localObject;
    }
    String[] arrayOfString = new String[j];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfString;
      if (i >= j) {
        break;
      }
      arrayOfString[i] = strip(paramArrayOfString[i], paramString);
      i += 1;
    }
  }
  
  public static String stripEnd(String paramString1, String paramString2)
  {
    int i;
    if (paramString1 != null)
    {
      i = paramString1.length();
      if (i != 0) {
        break label15;
      }
    }
    label15:
    int j;
    do
    {
      return paramString1;
      if (paramString2 == null) {
        for (;;)
        {
          j = i;
          if (i == 0) {
            break;
          }
          j = i;
          if (!Character.isWhitespace(paramString1.charAt(i - 1))) {
            break;
          }
          i -= 1;
        }
      }
    } while (paramString2.isEmpty());
    for (;;)
    {
      j = i;
      if (i == 0) {
        break;
      }
      j = i;
      if (paramString2.indexOf(paramString1.charAt(i - 1)) == -1) {
        break;
      }
      i -= 1;
    }
    return paramString1.substring(0, j);
  }
  
  public static String stripStart(String paramString1, String paramString2)
  {
    int k;
    if (paramString1 != null)
    {
      k = paramString1.length();
      if (k != 0) {
        break label17;
      }
    }
    label17:
    int j;
    do
    {
      return paramString1;
      j = 0;
      i = 0;
      if (paramString2 == null) {
        for (;;)
        {
          j = i;
          if (i == k) {
            break;
          }
          j = i;
          if (!Character.isWhitespace(paramString1.charAt(i))) {
            break;
          }
          i += 1;
        }
      }
    } while (paramString2.isEmpty());
    int i = j;
    for (;;)
    {
      j = i;
      if (i == k) {
        break;
      }
      j = i;
      if (paramString2.indexOf(paramString1.charAt(i)) == -1) {
        break;
      }
      i += 1;
    }
    return paramString1.substring(j);
  }
  
  public static String stripToEmpty(String paramString)
  {
    if (paramString == null) {
      return "";
    }
    return strip(paramString, null);
  }
  
  public static String stripToNull(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    String str = strip(paramString, null);
    paramString = str;
    if (str.isEmpty()) {
      paramString = null;
    }
    return paramString;
  }
  
  public static String substring(String paramString, int paramInt)
  {
    if (paramString == null) {
      return null;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = paramInt + paramString.length();
    }
    paramInt = i;
    if (i < 0) {
      paramInt = 0;
    }
    if (paramInt > paramString.length()) {
      return "";
    }
    return paramString.substring(paramInt);
  }
  
  public static String substring(String paramString, int paramInt1, int paramInt2)
  {
    if (paramString == null) {
      return null;
    }
    int i = paramInt2;
    if (paramInt2 < 0) {
      i = paramInt2 + paramString.length();
    }
    paramInt2 = paramInt1;
    if (paramInt1 < 0) {
      paramInt2 = paramInt1 + paramString.length();
    }
    paramInt1 = i;
    if (i > paramString.length()) {
      paramInt1 = paramString.length();
    }
    if (paramInt2 > paramInt1) {
      return "";
    }
    i = paramInt2;
    if (paramInt2 < 0) {
      i = 0;
    }
    paramInt2 = paramInt1;
    if (paramInt1 < 0) {
      paramInt2 = 0;
    }
    return paramString.substring(i, paramInt2);
  }
  
  public static String substringAfter(String paramString1, String paramString2)
  {
    if (isEmpty(paramString1)) {
      return paramString1;
    }
    if (paramString2 == null) {
      return "";
    }
    int i = paramString1.indexOf(paramString2);
    if (i == -1) {
      return "";
    }
    return paramString1.substring(paramString2.length() + i);
  }
  
  public static String substringAfterLast(String paramString1, String paramString2)
  {
    if (isEmpty(paramString1)) {
      return paramString1;
    }
    if (isEmpty(paramString2)) {
      return "";
    }
    int i = paramString1.lastIndexOf(paramString2);
    if ((i == -1) || (i == paramString1.length() - paramString2.length())) {
      return "";
    }
    return paramString1.substring(paramString2.length() + i);
  }
  
  public static String substringBefore(String paramString1, String paramString2)
  {
    if ((isEmpty(paramString1)) || (paramString2 == null)) {}
    int i;
    do
    {
      return paramString1;
      if (paramString2.isEmpty()) {
        return "";
      }
      i = paramString1.indexOf(paramString2);
    } while (i == -1);
    return paramString1.substring(0, i);
  }
  
  public static String substringBeforeLast(String paramString1, String paramString2)
  {
    if ((isEmpty(paramString1)) || (isEmpty(paramString2))) {}
    int i;
    do
    {
      return paramString1;
      i = paramString1.lastIndexOf(paramString2);
    } while (i == -1);
    return paramString1.substring(0, i);
  }
  
  public static String substringBetween(String paramString1, String paramString2)
  {
    return substringBetween(paramString1, paramString2, paramString2);
  }
  
  public static String substringBetween(String paramString1, String paramString2, String paramString3)
  {
    if ((paramString1 == null) || (paramString2 == null) || (paramString3 == null)) {}
    int i;
    int j;
    do
    {
      do
      {
        return null;
        i = paramString1.indexOf(paramString2);
      } while (i == -1);
      j = paramString1.indexOf(paramString3, paramString2.length() + i);
    } while (j == -1);
    return paramString1.substring(paramString2.length() + i, j);
  }
  
  public static String[] substringsBetween(String paramString1, String paramString2, String paramString3)
  {
    label18:
    int j;
    int k;
    int m;
    ArrayList localArrayList;
    if ((paramString1 == null) || (isEmpty(paramString2)) || (isEmpty(paramString3)))
    {
      break label78;
      return null;
    }
    else
    {
      j = paramString1.length();
      if (j == 0) {
        return ArrayUtils.EMPTY_STRING_ARRAY;
      }
      k = paramString3.length();
      m = paramString2.length();
      localArrayList = new ArrayList();
    }
    label78:
    int n;
    for (int i = 0;; i = n + k)
    {
      if (i < j - k)
      {
        i = paramString1.indexOf(paramString2, i);
        if (i >= 0) {}
      }
      else
      {
        if (localArrayList.isEmpty()) {
          break label18;
        }
        return (String[])localArrayList.toArray(new String[localArrayList.size()]);
      }
      i += m;
      n = paramString1.indexOf(paramString3, i);
      if (n < 0) {
        break;
      }
      localArrayList.add(paramString1.substring(i, n));
    }
  }
  
  public static String swapCase(String paramString)
  {
    if (isEmpty(paramString)) {
      return paramString;
    }
    paramString = paramString.toCharArray();
    int i = 0;
    if (i < paramString.length)
    {
      char c = paramString[i];
      if (Character.isUpperCase(c)) {
        paramString[i] = Character.toLowerCase(c);
      }
      for (;;)
      {
        i += 1;
        break;
        if (Character.isTitleCase(c)) {
          paramString[i] = Character.toLowerCase(c);
        } else if (Character.isLowerCase(c)) {
          paramString[i] = Character.toUpperCase(c);
        }
      }
    }
    return new String(paramString);
  }
  
  public static String toEncodedString(byte[] paramArrayOfByte, Charset paramCharset)
  {
    if (paramCharset != null) {}
    for (;;)
    {
      return new String(paramArrayOfByte, paramCharset);
      paramCharset = Charset.defaultCharset();
    }
  }
  
  @Deprecated
  public static String toString(byte[] paramArrayOfByte, String paramString)
    throws UnsupportedEncodingException
  {
    if (paramString != null) {
      return new String(paramArrayOfByte, paramString);
    }
    return new String(paramArrayOfByte, Charset.defaultCharset());
  }
  
  private static int transpositions(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    int j = 0;
    int i = 0;
    while (i < paramCharSequence1.length())
    {
      int k = j;
      if (paramCharSequence1.charAt(i) != paramCharSequence2.charAt(i)) {
        k = j + 1;
      }
      i += 1;
      j = k;
    }
    return j / 2;
  }
  
  public static String trim(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return paramString.trim();
  }
  
  public static String trimToEmpty(String paramString)
  {
    if (paramString == null) {
      return "";
    }
    return paramString.trim();
  }
  
  public static String trimToNull(String paramString)
  {
    String str = trim(paramString);
    paramString = str;
    if (isEmpty(str)) {
      paramString = null;
    }
    return paramString;
  }
  
  public static String uncapitalize(String paramString)
  {
    int i;
    if (paramString != null)
    {
      i = paramString.length();
      if (i != 0) {
        break label15;
      }
    }
    label15:
    char c;
    do
    {
      return paramString;
      c = paramString.charAt(0);
    } while (Character.isLowerCase(c));
    return i + Character.toLowerCase(c) + paramString.substring(1);
  }
  
  public static String upperCase(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return paramString.toUpperCase();
  }
  
  public static String upperCase(String paramString, Locale paramLocale)
  {
    if (paramString == null) {
      return null;
    }
    return paramString.toUpperCase(paramLocale);
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.StringUtils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */