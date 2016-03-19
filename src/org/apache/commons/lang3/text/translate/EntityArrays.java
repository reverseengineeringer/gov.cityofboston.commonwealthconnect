package org.apache.commons.lang3.text.translate;

import java.lang.reflect.Array;

public class EntityArrays
{
  private static final String[][] APOS_ESCAPE = { { "'", "&apos;" } };
  private static final String[][] APOS_UNESCAPE = invert(APOS_ESCAPE);
  private static final String[][] BASIC_ESCAPE;
  private static final String[][] BASIC_UNESCAPE;
  private static final String[][] HTML40_EXTENDED_ESCAPE;
  private static final String[][] HTML40_EXTENDED_UNESCAPE;
  private static final String[][] ISO8859_1_ESCAPE;
  private static final String[][] ISO8859_1_UNESCAPE;
  private static final String[][] JAVA_CTRL_CHARS_ESCAPE = { { "\b", "\\b" }, { "\n", "\\n" }, { "\t", "\\t" }, { "\f", "\\f" }, { "\r", "\\r" } };
  private static final String[][] JAVA_CTRL_CHARS_UNESCAPE = invert(JAVA_CTRL_CHARS_ESCAPE);
  
  static
  {
    String[] arrayOfString1 = { " ", "&nbsp;" };
    String[] arrayOfString2 = { "¡", "&iexcl;" };
    String[] arrayOfString3 = { "¢", "&cent;" };
    String[] arrayOfString4 = { "¤", "&curren;" };
    String[] arrayOfString5 = { "¥", "&yen;" };
    String[] arrayOfString6 = { "¦", "&brvbar;" };
    String[] arrayOfString7 = { "¨", "&uml;" };
    String[] arrayOfString8 = { "©", "&copy;" };
    String[] arrayOfString9 = { "ª", "&ordf;" };
    String[] arrayOfString10 = { "«", "&laquo;" };
    String[] arrayOfString11 = { "¬", "&not;" };
    String[] arrayOfString12 = { "­", "&shy;" };
    String[] arrayOfString13 = { "®", "&reg;" };
    String[] arrayOfString14 = { "¯", "&macr;" };
    String[] arrayOfString15 = { "°", "&deg;" };
    String[] arrayOfString16 = { "±", "&plusmn;" };
    String[] arrayOfString17 = { "²", "&sup2;" };
    String[] arrayOfString18 = { "´", "&acute;" };
    String[] arrayOfString19 = { "µ", "&micro;" };
    String[] arrayOfString20 = { "¶", "&para;" };
    String[] arrayOfString21 = { "·", "&middot;" };
    String[] arrayOfString22 = { "¸", "&cedil;" };
    String[] arrayOfString23 = { "¹", "&sup1;" };
    String[] arrayOfString24 = { "º", "&ordm;" };
    String[] arrayOfString25 = { "»", "&raquo;" };
    String[] arrayOfString26 = { "¼", "&frac14;" };
    String[] arrayOfString27 = { "½", "&frac12;" };
    String[] arrayOfString28 = { "¿", "&iquest;" };
    String[] arrayOfString29 = { "À", "&Agrave;" };
    String[] arrayOfString30 = { "Á", "&Aacute;" };
    String[] arrayOfString31 = { "Ã", "&Atilde;" };
    String[] arrayOfString32 = { "Ä", "&Auml;" };
    String[] arrayOfString33 = { "Å", "&Aring;" };
    String[] arrayOfString34 = { "Æ", "&AElig;" };
    String[] arrayOfString35 = { "È", "&Egrave;" };
    String[] arrayOfString36 = { "É", "&Eacute;" };
    String[] arrayOfString37 = { "Ê", "&Ecirc;" };
    String[] arrayOfString38 = { "Ì", "&Igrave;" };
    String[] arrayOfString39 = { "Í", "&Iacute;" };
    String[] arrayOfString40 = { "Î", "&Icirc;" };
    String[] arrayOfString41 = { "Ï", "&Iuml;" };
    String[] arrayOfString42 = { "Ð", "&ETH;" };
    String[] arrayOfString43 = { "Ñ", "&Ntilde;" };
    String[] arrayOfString44 = { "Ò", "&Ograve;" };
    String[] arrayOfString45 = { "Ó", "&Oacute;" };
    String[] arrayOfString46 = { "Ô", "&Ocirc;" };
    String[] arrayOfString47 = { "Õ", "&Otilde;" };
    String[] arrayOfString48 = { "Ö", "&Ouml;" };
    String[] arrayOfString49 = { "×", "&times;" };
    String[] arrayOfString50 = { "Ø", "&Oslash;" };
    String[] arrayOfString51 = { "Ù", "&Ugrave;" };
    String[] arrayOfString52 = { "Ú", "&Uacute;" };
    String[] arrayOfString53 = { "Û", "&Ucirc;" };
    String[] arrayOfString54 = { "Ü", "&Uuml;" };
    String[] arrayOfString55 = { "Ý", "&Yacute;" };
    String[] arrayOfString56 = { "Þ", "&THORN;" };
    String[] arrayOfString57 = { "ß", "&szlig;" };
    String[] arrayOfString58 = { "à", "&agrave;" };
    String[] arrayOfString59 = { "á", "&aacute;" };
    String[] arrayOfString60 = { "â", "&acirc;" };
    String[] arrayOfString61 = { "ä", "&auml;" };
    String[] arrayOfString62 = { "å", "&aring;" };
    String[] arrayOfString63 = { "ç", "&ccedil;" };
    String[] arrayOfString64 = { "è", "&egrave;" };
    String[] arrayOfString65 = { "é", "&eacute;" };
    String[] arrayOfString66 = { "ë", "&euml;" };
    String[] arrayOfString67 = { "ì", "&igrave;" };
    String[] arrayOfString68 = { "í", "&iacute;" };
    String[] arrayOfString69 = { "î", "&icirc;" };
    String[] arrayOfString70 = { "ð", "&eth;" };
    String[] arrayOfString71 = { "ñ", "&ntilde;" };
    String[] arrayOfString72 = { "ò", "&ograve;" };
    String[] arrayOfString73 = { "ó", "&oacute;" };
    String[] arrayOfString74 = { "ô", "&ocirc;" };
    String[] arrayOfString75 = { "ö", "&ouml;" };
    String[] arrayOfString76 = { "ø", "&oslash;" };
    String[] arrayOfString77 = { "ù", "&ugrave;" };
    String[] arrayOfString78 = { "û", "&ucirc;" };
    String[] arrayOfString79 = { "ü", "&uuml;" };
    String[] arrayOfString80 = { "ý", "&yacute;" };
    String[] arrayOfString81 = { "þ", "&thorn;" };
    ISO8859_1_ESCAPE = new String[][] { arrayOfString1, arrayOfString2, arrayOfString3, { "£", "&pound;" }, arrayOfString4, arrayOfString5, arrayOfString6, { "§", "&sect;" }, arrayOfString7, arrayOfString8, arrayOfString9, arrayOfString10, arrayOfString11, arrayOfString12, arrayOfString13, arrayOfString14, arrayOfString15, arrayOfString16, arrayOfString17, { "³", "&sup3;" }, arrayOfString18, arrayOfString19, arrayOfString20, arrayOfString21, arrayOfString22, arrayOfString23, arrayOfString24, arrayOfString25, arrayOfString26, arrayOfString27, { "¾", "&frac34;" }, arrayOfString28, arrayOfString29, arrayOfString30, { "Â", "&Acirc;" }, arrayOfString31, arrayOfString32, arrayOfString33, arrayOfString34, { "Ç", "&Ccedil;" }, arrayOfString35, arrayOfString36, arrayOfString37, { "Ë", "&Euml;" }, arrayOfString38, arrayOfString39, arrayOfString40, arrayOfString41, arrayOfString42, arrayOfString43, arrayOfString44, arrayOfString45, arrayOfString46, arrayOfString47, arrayOfString48, arrayOfString49, arrayOfString50, arrayOfString51, arrayOfString52, arrayOfString53, arrayOfString54, arrayOfString55, arrayOfString56, arrayOfString57, arrayOfString58, arrayOfString59, arrayOfString60, { "ã", "&atilde;" }, arrayOfString61, arrayOfString62, { "æ", "&aelig;" }, arrayOfString63, arrayOfString64, arrayOfString65, { "ê", "&ecirc;" }, arrayOfString66, arrayOfString67, arrayOfString68, arrayOfString69, { "ï", "&iuml;" }, arrayOfString70, arrayOfString71, arrayOfString72, arrayOfString73, arrayOfString74, { "õ", "&otilde;" }, arrayOfString75, { "÷", "&divide;" }, arrayOfString76, arrayOfString77, { "ú", "&uacute;" }, arrayOfString78, arrayOfString79, arrayOfString80, arrayOfString81, { "ÿ", "&yuml;" } };
    ISO8859_1_UNESCAPE = invert(ISO8859_1_ESCAPE);
    arrayOfString1 = new String[] { "Κ", "&Kappa;" };
    arrayOfString2 = new String[] { "κ", "&kappa;" };
    arrayOfString3 = new String[] { "ν", "&nu;" };
    arrayOfString4 = new String[] { "υ", "&upsilon;" };
    arrayOfString5 = new String[] { "ω", "&omega;" };
    arrayOfString6 = new String[] { "ϑ", "&thetasym;" };
    arrayOfString7 = new String[] { "′", "&prime;" };
    arrayOfString8 = new String[] { "⇒", "&rArr;" };
    arrayOfString9 = new String[] { "⇓", "&dArr;" };
    arrayOfString10 = new String[] { "∂", "&part;" };
    arrayOfString11 = new String[] { "∇", "&nabla;" };
    arrayOfString12 = new String[] { "∝", "&prop;" };
    arrayOfString13 = new String[] { "⊕", "&oplus;" };
    arrayOfString14 = new String[] { "⌈", "&lceil;" };
    arrayOfString15 = new String[] { "Œ", "&OElig;" };
    arrayOfString16 = new String[] { "Š", "&Scaron;" };
    arrayOfString17 = new String[] { "ˆ", "&circ;" };
    arrayOfString18 = new String[] { " ", "&ensp;" };
    arrayOfString19 = new String[] { " ", "&emsp;" };
    arrayOfString20 = new String[] { "‌", "&zwnj;" };
    arrayOfString21 = new String[] { "‰", "&permil;" };
    arrayOfString22 = new String[] { "‹", "&lsaquo;" };
    HTML40_EXTENDED_ESCAPE = new String[][] { { "ƒ", "&fnof;" }, { "Α", "&Alpha;" }, { "Β", "&Beta;" }, { "Γ", "&Gamma;" }, { "Δ", "&Delta;" }, { "Ε", "&Epsilon;" }, { "Ζ", "&Zeta;" }, { "Η", "&Eta;" }, { "Θ", "&Theta;" }, { "Ι", "&Iota;" }, arrayOfString1, { "Λ", "&Lambda;" }, { "Μ", "&Mu;" }, { "Ν", "&Nu;" }, { "Ξ", "&Xi;" }, { "Ο", "&Omicron;" }, { "Π", "&Pi;" }, { "Ρ", "&Rho;" }, { "Σ", "&Sigma;" }, { "Τ", "&Tau;" }, { "Υ", "&Upsilon;" }, { "Φ", "&Phi;" }, { "Χ", "&Chi;" }, { "Ψ", "&Psi;" }, { "Ω", "&Omega;" }, { "α", "&alpha;" }, { "β", "&beta;" }, { "γ", "&gamma;" }, { "δ", "&delta;" }, { "ε", "&epsilon;" }, { "ζ", "&zeta;" }, { "η", "&eta;" }, { "θ", "&theta;" }, { "ι", "&iota;" }, arrayOfString2, { "λ", "&lambda;" }, { "μ", "&mu;" }, arrayOfString3, { "ξ", "&xi;" }, { "ο", "&omicron;" }, { "π", "&pi;" }, { "ρ", "&rho;" }, { "ς", "&sigmaf;" }, { "σ", "&sigma;" }, { "τ", "&tau;" }, arrayOfString4, { "φ", "&phi;" }, { "χ", "&chi;" }, { "ψ", "&psi;" }, arrayOfString5, arrayOfString6, { "ϒ", "&upsih;" }, { "ϖ", "&piv;" }, { "•", "&bull;" }, { "…", "&hellip;" }, arrayOfString7, { "″", "&Prime;" }, { "‾", "&oline;" }, { "⁄", "&frasl;" }, { "℘", "&weierp;" }, { "ℑ", "&image;" }, { "ℜ", "&real;" }, { "™", "&trade;" }, { "ℵ", "&alefsym;" }, { "←", "&larr;" }, { "↑", "&uarr;" }, { "→", "&rarr;" }, { "↓", "&darr;" }, { "↔", "&harr;" }, { "↵", "&crarr;" }, { "⇐", "&lArr;" }, { "⇑", "&uArr;" }, arrayOfString8, arrayOfString9, { "⇔", "&hArr;" }, { "∀", "&forall;" }, arrayOfString10, { "∃", "&exist;" }, { "∅", "&empty;" }, arrayOfString11, { "∈", "&isin;" }, { "∉", "&notin;" }, { "∋", "&ni;" }, { "∏", "&prod;" }, { "∑", "&sum;" }, { "−", "&minus;" }, { "∗", "&lowast;" }, { "√", "&radic;" }, arrayOfString12, { "∞", "&infin;" }, { "∠", "&ang;" }, { "∧", "&and;" }, { "∨", "&or;" }, { "∩", "&cap;" }, { "∪", "&cup;" }, { "∫", "&int;" }, { "∴", "&there4;" }, { "∼", "&sim;" }, { "≅", "&cong;" }, { "≈", "&asymp;" }, { "≠", "&ne;" }, { "≡", "&equiv;" }, { "≤", "&le;" }, { "≥", "&ge;" }, { "⊂", "&sub;" }, { "⊃", "&sup;" }, { "⊆", "&sube;" }, { "⊇", "&supe;" }, arrayOfString13, { "⊗", "&otimes;" }, { "⊥", "&perp;" }, { "⋅", "&sdot;" }, arrayOfString14, { "⌉", "&rceil;" }, { "⌊", "&lfloor;" }, { "⌋", "&rfloor;" }, { "〈", "&lang;" }, { "〉", "&rang;" }, { "◊", "&loz;" }, { "♠", "&spades;" }, { "♣", "&clubs;" }, { "♥", "&hearts;" }, { "♦", "&diams;" }, arrayOfString15, { "œ", "&oelig;" }, arrayOfString16, { "š", "&scaron;" }, { "Ÿ", "&Yuml;" }, arrayOfString17, { "˜", "&tilde;" }, arrayOfString18, arrayOfString19, { " ", "&thinsp;" }, arrayOfString20, { "‍", "&zwj;" }, { "‎", "&lrm;" }, { "‏", "&rlm;" }, { "–", "&ndash;" }, { "—", "&mdash;" }, { "‘", "&lsquo;" }, { "’", "&rsquo;" }, { "‚", "&sbquo;" }, { "“", "&ldquo;" }, { "”", "&rdquo;" }, { "„", "&bdquo;" }, { "†", "&dagger;" }, { "‡", "&Dagger;" }, arrayOfString21, arrayOfString22, { "›", "&rsaquo;" }, { "€", "&euro;" } };
    HTML40_EXTENDED_UNESCAPE = invert(HTML40_EXTENDED_ESCAPE);
    arrayOfString1 = new String[] { "\"", "&quot;" };
    arrayOfString2 = new String[] { "<", "&lt;" };
    BASIC_ESCAPE = new String[][] { arrayOfString1, { "&", "&amp;" }, arrayOfString2, { ">", "&gt;" } };
    BASIC_UNESCAPE = invert(BASIC_ESCAPE);
  }
  
  public static String[][] APOS_ESCAPE()
  {
    return (String[][])APOS_ESCAPE.clone();
  }
  
  public static String[][] APOS_UNESCAPE()
  {
    return (String[][])APOS_UNESCAPE.clone();
  }
  
  public static String[][] BASIC_ESCAPE()
  {
    return (String[][])BASIC_ESCAPE.clone();
  }
  
  public static String[][] BASIC_UNESCAPE()
  {
    return (String[][])BASIC_UNESCAPE.clone();
  }
  
  public static String[][] HTML40_EXTENDED_ESCAPE()
  {
    return (String[][])HTML40_EXTENDED_ESCAPE.clone();
  }
  
  public static String[][] HTML40_EXTENDED_UNESCAPE()
  {
    return (String[][])HTML40_EXTENDED_UNESCAPE.clone();
  }
  
  public static String[][] ISO8859_1_ESCAPE()
  {
    return (String[][])ISO8859_1_ESCAPE.clone();
  }
  
  public static String[][] ISO8859_1_UNESCAPE()
  {
    return (String[][])ISO8859_1_UNESCAPE.clone();
  }
  
  public static String[][] JAVA_CTRL_CHARS_ESCAPE()
  {
    return (String[][])JAVA_CTRL_CHARS_ESCAPE.clone();
  }
  
  public static String[][] JAVA_CTRL_CHARS_UNESCAPE()
  {
    return (String[][])JAVA_CTRL_CHARS_UNESCAPE.clone();
  }
  
  public static String[][] invert(String[][] paramArrayOfString)
  {
    String[][] arrayOfString = (String[][])Array.newInstance(String.class, new int[] { paramArrayOfString.length, 2 });
    int i = 0;
    while (i < paramArrayOfString.length)
    {
      arrayOfString[i][0] = paramArrayOfString[i][1];
      arrayOfString[i][1] = paramArrayOfString[i][0];
      i += 1;
    }
    return arrayOfString;
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.text.translate.EntityArrays
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */