(:exo_12_XQuery_TREETAGGER_q1 Sur les fichiers étiquetés avec treetagger (par rubrique a priori), Construire une requête pour extraire les patrons morpho-syntaxiques NOM ADJ:)
(:les patrons sont écrits respectivement dans des fichiers nommés par rubrique:)
   let $base := collection("SAMPLETREETAGGER")/base
   for $rubrique in distinct-values($base/@rubrique)
   let $fName := concat("./Patrons/", $rubrique, "_NOMADJ.xml")
   let $params := <output:serialization-parameters xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization">
   <output:method value='xml'/>
  <output:omit-xml-declaration value="no"/>
</output:serialization-parameters>
   return 
     file:write($fName,
       <patrons rubrique="{$rubrique}" type="NOM ADJ">
       {
         for $ele1 in $base[@rubrique=$rubrique]/etiquetage/fichier/element
         let $ele2 := $ele1/following-sibling::element[1]
         where $ele1/data[1]="NOM" and $ele2/data[1]="ADJ"
         return <patron>{$ele1/data[3]/text()," ", $ele2/data[3]/text()}</patron>
       }
       </patrons>, $params)
   
    
