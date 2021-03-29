# BI_Finance_project
(Français) Travail dans le cadre d'un cours de BI Finance. L'essentiel se fait sous excel, mais le traitement préalable a été réalisé sous Python avec Pandas.

Objectif : parser la data générée à partir de la BDD. Fichier massif de 2.8 millions de ligne donc il était nécessaire de passer par python. C'est pas plus mal car ça m'a permi de faire différent traitement pour résoudre les problèmes de dates manquantes et des changements brutaux de cours dûs aux splits/reverse-splits et autres opérations altérant le cours des actions.

Les fichiers jupyter notebook sont à considérer dans cet ordre :
  1.  BI Finance traitement des donnees.ipynb
  2.  BI Finance - suppression des outliers et sélection du portefeuille.ipynb

La base de données est trop lourde pour être mise en ligne, veiller à utiliser les bons noms de fichiers. La requête SQL pour obtenir la même base que moi est inclue.

Flux de données (notamment entre les 3 scripts et les excels) : description à venir.

Quelques remarques, surtout sur la partie 2 - construction d'un portfolio : 
  * L'énoncé comporte de nombreux points de flou qui nous font opter pour des hypothèses arbitraires. Les points suivants servent essentiellement à décrire ces hypothèses.
  * Pour la fusion des plusieurs séries de dates inégales : après confirmation de M. Mazars -> choisir le chemin le plus long ("outer join") avec un forward fill pour les valeurs manquantes. Autrement dit, on choisit la dernière valeur connue pour les actifs comportant des valeurs manquantes.
  * Comme décrit dans les script de traitement : la donnée est très incomplète et inconstante. Nous avons mis en place un nombre limité de traitements qui ont principalement 2 buts : supprimer les colonnes comportant de trop nombreux NaN consécutifs (considérés comme sortis des marchées publics) ; supprimer les colonnes dont les actifs connaissent des sauts trop brutaux en valeurs (correspondant à des splits ou d'autres opérations qui ne reflettent pas leur valeur réelle).
  * En plus de ces 2 traitements, nous avons supprimé les 45 premières lignes sur tout le jeu de donnée car elles étaient complètement absentes pour les instruments côtés au Japon. Le choix était : soit on supprime 200 actions parce que le jeu de donné est corrompu sur les 45 premières dates, soit on les garde mais on supprime les lignes pour lesquelles nous avons constaté un problème commun, choix pour lequel nous avons opté.
  * L'objectif retenu est simplement celui de la diversification du portefeuille sur les zones géographiques NA (40%) EU(30%) Asie (30%) et sur les 11 secteurs d'activité ; et non pas une optimisation de performances. Nous avons donc sélectionné les actifs complètement au hasard (en tachant de les tirer proportionnellemnt dans toutes les zones et tous les secteurs) puis nous avons ajusté les poids de manière à optimiser l'équilibre de départ le plus possible (en terme de valeur par zone et par industrie).
  * La performance "répartie" est représentée par se contribution ; La volatilité s'appuie sur la formule sum{ var(a_i*X_i) } = sum{ a_i²*var(X_i) + 2*a_i*a_j*cov(X_i,X_j) (forall unique i!=j pairs) }


Correction à effectuer : pour 2.d et 2.e, il faut utiliser sur toute la période au lieu de la dernière année.
