# BI_Finance_project
(Français) Travail dans le cadre d'un cours de BI Finance. L'essentiel se fait sous excel, mais le traitement préalable a été réalisé sous Python avec Pandas.

Objectif : parser la data générée à partir de la BDD. Fichier massif de 2.8 millions de ligne donc il était nécessaire de passer par python. C'est pas plus mal car ça m'a permi de faire différent traitement pour résoudre les problèmes de dates manquantes et des changements brutaux de cours dûs aux splits/reverse-splits et autres opérations altérant le cours des actions.

Les fichiers jupyter notebook sont à considérer dans cet ordre :
  1.  BI Finance traitement des donnees.ipynb
  2.  BI Finance - suppression des outliers et sélection du portefeuille.ipynb

La base de données est trop lourde pour être mise en ligne, veiller à utiliser les bons noms de fichiers. La requête SQL pour obtenir la même base que moi est inclue.

J'en suis à une étape intermédiaire où il faut se décider sur la stratégie pour se constituer le portefeuille de 20 actifs. Plusieurs remarques
  * La consigne n'est pas explicite sur la nécessité d'optimiser la rentabilité, donc je ne sais pas si ça rentre en jeu. -> il faut se décider si les actifs sont choisi aléatoirement (tout en respectant les conditions de la consigne) ou s'il convient de les choisir selon des mesures de rendement ou de volatilité (que l'on ne connait qu'à posteriori, donc pas sûr que ce soit l'idée)
  * 30% de 20 actifs = ~6 actifs, alors qu'il existe au total 11 secteur. Il est donc impossible de répartir le risque sur tous les secteurs toutes les zones géographiques prises indépendamment. 
  
