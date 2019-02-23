(:exo14_XQuery_q1_1 Compter le nombre de copies par niveaux d’étude:)
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:omit-xml-declaration "no";
<statECRISCOL type="nombre" critere="niveau d'étude" nombre="{count(collection("ECRITSCOL"))}">
{
  let $div :=collection("ECRITSCOL")//TEI/text/body/div
  for $niveau in distinct-values($div/head/replace(. , '(EC-)?(.+)-\d{4}.+','$2'))
  return 
    <niveau nombre="{count($div/head[matches(., $niveau)])}">{$niveau}</niveau>  
}
</statECRISCOL>