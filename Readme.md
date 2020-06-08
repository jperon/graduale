# Graduale

Ce document est un projet de graduel grégorien.

Saisi en LaTeX, il est conçu de façon à séparer autant que possible la
définition des commandes du corps du document, de façon à rendre facile la
réutilisation du gabarit pour d'autres documents liturgiques.

Si vous voulez personnaliser la mise en forme, reportez-vous au document
*lib/gredoc.sty*, et aux commentaires qui s'y trouvent.

## Commandes utiles

Outre les commandes fournies par les *KOMA-scripts* et par *GregorioTeX*,
sur lesquels il est basé, le gabarit utilisé définit les commandes décrites
brièvement ci-après. Un petit dessin valant mieux qu'un long discours, le
meilleur moyen de comprendre leur fonctionnement est de se reporter au
contenu de 00-Document.tex. Cependant, ce dernier ne contient pas de textes
traduits en parallèle du texte latin ; les commandes de traduction sont
cependant assez naturelles à utiliser.

### Rubriques

* \rubrica{TEXTE} : pour saisir une rubrique ;
* \rubrum{TEXTE} : pour colorer le texte en rouge ;
* \TP{TEXTE} : pour les rubriques propres au Temps pascal.

### Bi-linguisme

Commandes :
* \versiculus{LATIN}{VERNACULAIRE} et \responsum{LATIN}{VERNACULAIRE} :
    pour saisir versets et répons, sans se soucier des ℣. et ℟.
* \oratio{LATIN}{VERNACULAIRE} : pour saisir une oraison, sans s'occuper du
    *Dóminus vobíscum* et du *Amen*

Environnements :
* *priere* : pour saisir une prière en vernaculaire ;
* *litaniae* : pour les litanies. Au sein de cet environnement, les invocations
    doivent être saisies au sein d'une commande \invocatio{LATIN}{VERNACULAIRE}
	ou d'une commande
	\rinvocatio{LATIN}{VERNACULAIRE}{REPONSELATIN}{REPONSEVERNACULAIRE}

### Musique

* \cantus{DOSSIER}{PARTITION}{TYPE}{MODE} : pour insérer des partitions gabc
* \vulgo{TEXTE EN VERNACULAIRE} : pour saisir la traduction d'un chant avant
    la partition
* \ps{CHIFFRE ROMAIN} : pour indiquer le titre d'un psaume
* \psalmus{PSAUME} : pour saisir un psaume, en indiquant le premier verset,
    le dernier, et le ton souhaité.
* \versus{VERSET DE PSAUME}, \praa, \prab… (cf. *gredoc.sty*) : commandes de
    formatage des psaumes, pour éviter de devoir saisir manuellement à chaque
	fois des \textit{} et des \textbf{}.

### Commandes pour faciliter la saisie de ℣, ℟, †, ✠, et \* (hémistiche)

* \vb : ℣
* \rb : ℟
* \\+ : †
* \crux : ✠
* \\\* : \*

Toutes ces commandes sont mises en rouge. En outre, si l'on donne un paramètre
à \vb ou \rb, ce paramètre est lui aussi en rouge. Les quatre premiers
caractères sont *actifs* : si vous les saisissez directement, ils seront
reconnus et auront le même comportement que la commande.

Ici encore, un petit dessin vaut mieux qu'un long discours : si vous saisissez
℟. vous obtiendrez sur le document final ce symbole en rouge avec le point en
rouge ; si vous ne savez pas saisir directement le symbole ℟, la commande \rb.
donnera le même résultat que ℟.

Voyez *gredoc.sty* si ceci ne vous semble pas clair.
