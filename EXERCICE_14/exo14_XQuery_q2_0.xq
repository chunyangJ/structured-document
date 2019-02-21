(:exo14_XQuery_q2_0 Compter le nombre d’opérations de réécriture par copie:)
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:omit-xml-declaration "no";
<statECRISCOL type="nombre" critere="type d'opération" unit="copie">
{
  let $div :=collection("ECRITSCOL")//TEI/text/body/div
  for $doc at $pos in $div
  return
    <copie id="{$pos}" nom="{$doc/head}">
      <remplacement>{count($doc//mod[@type="subst"])}</remplacement>
      <insertion>{count($doc//mod[@type="add"])}</insertion>
      <suppression>{count($doc//mod[@type="del"])}</suppression>
      <correction>{count($doc//mod[@type="corr"])}</correction>
  </copie>
  }
</statECRISCOL>