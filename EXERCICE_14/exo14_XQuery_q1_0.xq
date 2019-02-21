(:exo14_XQuery_q1_0 Compter le nombre de copies globalement:)
let $nb:=count(collection("ECRITSCOL"))
return concat("Le nombre de copies dans la base ECRISCOL : ",$nb)
