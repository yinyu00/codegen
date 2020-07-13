package com.nocompany.tools.codegen.util;

public class GenUtil {
  public static String getCamelCaseString(String name, boolean firstUpperCase) {
    StringBuffer sb = new StringBuffer();

    while(name.startsWith("_")) {
      name = name.substring(1);
    }

    name = name.toUpperCase();
    boolean nextUpperCase = firstUpperCase;

    for (int i = 0; i < name.length(); i++) {
      if (name.charAt(i) == '_') {
        nextUpperCase = true;
        continue;
      }

      if (nextUpperCase) {
        sb.append(String.valueOf(name.charAt(i)).toUpperCase());
        nextUpperCase = false;
      } else {
        sb.append(String.valueOf(name.charAt(i)).toLowerCase());
      }
    }

    return sb.toString();
  }

  public static String getResourceString(String name, boolean firstUpperCase) {
    StringBuffer sb = new StringBuffer();

    name = name.toUpperCase();
    boolean nextUpperCase = firstUpperCase;

    for (int i = 0; i < name.length(); i++) {
      if (name.charAt(i) == '_') {
        sb.append(" ");
        nextUpperCase = true;
        continue;
      }

      if (nextUpperCase) {
        sb.append(String.valueOf(name.charAt(i)).toUpperCase());
        nextUpperCase = false;
      } else {
        sb.append(String.valueOf(name.charAt(i)).toLowerCase());
      }
    }

    return sb.toString();
  }

}
