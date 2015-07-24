## ------------------------------------------------------------------------
library(rotl)
taxa <- c("Hyla", "Salmo", "Diadema", "Nautilus")
resolved_names <- tnrs_match_names(taxa)

## ------------------------------------------------------------------------
resolved_names <- tnrs_match_names(taxa, context_name = "Animals")

## ---- fig.width=7, fig.height=4------------------------------------------
my_tree <- tol_induced_subtree(ott_ids = resolved_names$ott_id)
plot(my_tree, no.margin=TRUE)

## ------------------------------------------------------------------------
taxa <- c("Hyla", "Salmo", "Diadema", "Nautilus", "Acer")
resolved_names <- tnrs_match_names(taxa)
resolved_names
inspect(resolved_names, taxon_name = "diadema")

## ------------------------------------------------------------------------
resolved_names <- update(resolved_names, taxon_name = "diadema",
                         new_row_number = 2)

## we could also have used the ott_id to replace this taxon:
## resolved_names <- update(resolved_names, taxon_name = "diadema",
##                          new_ott_id = 631176)

## ------------------------------------------------------------------------
diadema_info <- taxonomy_taxon(631176)
tax_rank(diadema_info)
synonyms(diadema_info)
ott_taxon_name(diadema_info)

## ------------------------------------------------------------------------
diadema_tax_tree <- taxonomy_subtree(631176)
diadema_tax_tree

## ---- fig.width=7, fig.height=4------------------------------------------
mono_id <- tnrs_match_names("Monotremes")
mono_tree <- tol_subtree(ott_id = mono_id$ott_id[1])
plot(mono_tree)

## ------------------------------------------------------------------------
furry_studies <- studies_find_studies(property="ot:focalCladeOTTTaxonName", value="Mammalia")
furry_ids <- unlist(furry_studies$matched_studies)

## ------------------------------------------------------------------------
furry_meta <- get_study_meta("pg_2550")
knitr::kable(get_publication(furry_meta))     ## The citation for the source of the study
get_tree_ids(furry_meta)        ## This study has 10 trees associated with it
candidate_for_synth(furry_meta) ## None of these trees are yet included in the OTL

