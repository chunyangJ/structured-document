(:exo14_XQuery_q2_1 Compter le nombre d’opérations de réécriture par type et par niveaux d’étude:)
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:omit-xml-declaration "no";
<statECRISCOL type="nombre" critere="type d'opération" unit="niveau">
{
  let $div := collection("ECRITSCOL")//TEI/text/body/div
  for $niveau in distinct-values($div/head/replace(. , '(EC-)?(.+)-\d{4}.+','$2'))
  let $doc := $div/head[matches(.,$niveau)]/..
  where true()
  return
    <niveau nom="{$niveau}">
        <remplacement>{count($doc/p//mod[@type="subst"])}</remplacement>
        <insertion>{count($doc/p//mod[@type="add"])}</insertion>
        <suppression>{count($doc/p//mod[@type="del"])}</suppression>
        <correction>{count($doc/p//mod[@type="corr"])}</correction>
  </niveau>
}
</statECRISCOL>