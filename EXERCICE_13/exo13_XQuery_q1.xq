(:exo13_XQuery_q1 Construire une requête pour extraire les items portant une relation de dépendance syntaxique de type OBJ:)
let $fName := "./exo13_XQuery_q1_OBJ.xml"
let $params := <output:serialization-parameters xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization">
<output:method value='xml'/>
<output:omit-xml-declaration value="no"/>
</output:serialization-parameters>
return 
file:write($fName,<base nom="TrameurFromRhapsodie" cat="OBJ">
{
   let $base:=doc("TrameurFromRhapsodie")/baselexicometrique/trame/items
   for $item in $base/item[a[7][contains(.,"OBJ")]]
   return <item pos="{$item/@pos}">{$item/f}{$item/c}{$item/l}</item>   
}
</base>,$params)
