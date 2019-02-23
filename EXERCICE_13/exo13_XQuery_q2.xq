(:exo13_XQuery_q2 Construire une requête pour extraire les items en relation de dépendance syntaxique de type
OBJ (on affichera les formes ou les lemmes connectés par cette relation):)
let $fName := "./exo13_XQuery_q2_OBJ.xml"
let $params := <output:serialization-parameters xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization">
<output:method value='xml'/>
<output:omit-xml-declaration value="no"/>
</output:serialization-parameters>
return 
file:write($fName,<base nom="TrameurFromRhapsodie" cat="OBJ">
{
   let $base:=doc("TrameurFromRhapsodie")/baselexicometrique/trame/items
   for $item in $base/item[a[7][matches(.,"OBJ")]]
   let $dep_pos:=number($item/@pos)
   let $dependant:=<dependant pos="{$dep_pos}">{$item/f}{$item/c}{$item/l}</dependant>
   let $gov_pos:=number($item/a[7]/replace($item/a[7],'OBJ\((\d+)\)','$1'))
   let $diff:=number($gov_pos - $dep_pos)
   let $gov_item:=
   if ($diff > 0) then $item/following-sibling::item[$diff]
   else $item/preceding-sibling::item[abs($diff)]
   let $governor:=<gouverneur pos="{$gov_pos}">{$gov_item/f}{$gov_item/c}{$gov_item/l}</gouverneur>  
   return <dependance>{$governor}{$dependant}</dependance>   
}
</base>
,$params)
