using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Temizle
/// </summary>
public static class Temizle
{
	
		 public static string UrlCevir(this string kelime)
        {
            if (kelime == "" || kelime == null) { return ""; }
            kelime = kelime.Replace("ş", "s");
            kelime = kelime.Replace("Ş", "S");
            kelime = kelime.Replace(".", "");
            kelime = kelime.Replace(":", "");
            kelime = kelime.Replace(";", "");
            kelime = kelime.Replace(",", "");
            kelime = kelime.Replace(" ", "-");
            kelime = kelime.Replace("!", "");
            kelime = kelime.Replace("(", "");
            kelime = kelime.Replace(")", "");
            kelime = kelime.Replace("'", "");
            kelime = kelime.Replace("ğ", "g");
            kelime = kelime.Replace("Ğ", "G");
            kelime = kelime.Replace("ı", "i");
            kelime = kelime.Replace("I", "i");
            kelime = kelime.Replace("İ", "i");
            kelime = kelime.Replace("ç", "c");
            kelime = kelime.Replace("ç", "C");
            kelime = kelime.Replace("ö", "o");
            kelime = kelime.Replace("Ö", "O");
            kelime = kelime.Replace("ü", "u");
            kelime = kelime.Replace("Ü", "U");
            kelime = kelime.Replace("`", "");
            kelime = kelime.Replace("=", "");
            kelime = kelime.Replace("&", "");
            kelime = kelime.Replace("%", "");
            kelime = kelime.Replace("#", "");
            kelime = kelime.Replace("<", "");
            kelime = kelime.Replace(">", "");
            kelime = kelime.Replace("*", "");
            kelime = kelime.Replace("?", "");
            kelime = kelime.Replace("+", "-");
            kelime = kelime.Replace("\"", "-");
            kelime = kelime.Replace("»", "-");
            kelime = kelime.Replace("|", "-");
            kelime = kelime.Replace("^", "");
            return kelime;
        }
	}

