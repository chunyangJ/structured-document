(:exo_12_XQuery_RSS_q1 Sur les fils RSS de l’ensemble du corpus, construire une requête pour extraire les contenus textuels des titres:)
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:omit-xml-declaration "no";
<base nom="fils RSS du Monde 2017">
{
  let $channel:=collection("RSSMONDE2017")/rss/channel
  for $item at $pos in $channel/item
    let $title:=$item/title/text()
    return <description id="{$pos}">{$title}</description>
}
</base>