(:exo14_XPath_q1 Afficher toutes les opérations de suppression par niveaux d’étude:)
distinct-values(TEI/text/body/div/head/replace(. , '(EC-)?(.+)-\d{4}.+','$2'))
/TEI/text/body/div/head[starts-with(. , "EC-CE1")]/../p//mod[@type="del"]
/TEI/text/body/div/head[matches(. , "(EC-)?CE2")]/../p//mod[@type="del"]
/TEI/text/body/div/head[starts-with(. , "CM1")]/../p//mod[@type="del"]
/TEI/text/body/div/head[starts-with(. , "EC-CM2")]/../p//mod[@type="del"]
/TEI/text/body/div/head[starts-with(. , "EC-6EME")]/../p//mod[@type="del"]
/TEI/text/body/div/head[starts-with(. , "CO-3")]/../p//mod[@type="del"]
/TEI/text/body/div/head[starts-with(. , "LY-2")]/../p//mod[@type="del"]
