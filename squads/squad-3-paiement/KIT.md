# Squad 3 · Paiement · Kit de démarrage

> Hackathon Champions 4 h, dry run du **lundi 26 octobre 2026, 13 h 30 à 17 h 30** (installation dès 12 h 30).
> À lire avec : `commun/00-par-ou-commencer.md` (le pas à pas), `commun/01-bases-en-5-minutes.md`, et pendant la session `commun/02-spec-kit-x-context-nexus.md`.

## Démarrer en 5 étapes

1. **Avant le 23/10** : cette fiche lue, votre chapeau repéré ci-dessous, et votre façon d'être prêt choisie (`commun/03-prerequis-poste.md`) : **Codespace** (un compte GitHub, rien à installer) ou **installation en une ligne** sur votre poste. Deux postes prêts par squad suffisent.
2. **À 12 h 30** : en Codespace, ouvrir `starter-squad-3-paiement` → **Code → Codespaces → … → New with options…**, coller la clé de la squad dans `ANTHROPIC_API_KEY`, puis **Create codespace** (pas à pas : `commun/fiche-demarrage.md`, voie A) (le clonage et l'étape 3 se font tout seuls). Sur votre poste : cloner côte à côte `context-nexus` et `starter-squad-3-paiement` dans `~/hackathon/`, brancher la clé agent de la squad.
3. **Assembler votre contexte** :
   ```bash
   cd ~/hackathon/context-nexus
   node tools/context-assemble.mjs --squad squad-3-paiement --out ../starter-squad-3-paiement/.context/brief.md
   ```
4. **Vérifier l'agent** : dans `starter-squad-3-paiement`, lancer `claude` et demander « Résume .context/brief.md : notre volet, les contrats que nous publions et ceux que nous consommons ». Taper `/speckit` pour voir les commandes.
5. **À 14h10, Discover** : le Context Engineer lit les contrats voisins, le Specification Engineer copie `gabarits/business-intent.md` dans `teams/squad-3-paiement/intent/` et tient la plume.

## Votre mission

Construire l'**encaissement du supplément**, en ligne (débit immédiat via le PSP fictif PayVel) ou à l'hôtel (ajout à la note de chambre). Vous débitez un montant qui vient d'Offre et doit respecter les bornes de Prix ; Expérience consomme votre contrat pour afficher le paiement.

**Ce que vous construisez pendant le dry run** : `POST /v1/late-checkout/payments` dans le starter, avec un mock PayVel, l'idempotence, le recalcul serveur du montant (SEC-05) à partir de l'offre, et le mode « à l'hôtel ».

## Votre squad et vos chapeaux

| Profil | Chapeau proposé |
|---|---|
| PO | Specification Engineer |
| TL | Decision Guarantor |
| SA Android | Agentic Workflow Orchestrator |
| Scrum Master | Context Engineer |

Répartition proposée par l'animation ; vous l'ajustez au cadrage (0:00 à 0:30). En fin de session : l'effort estimé de votre chapeau était-il réaliste ?

**Qui porte quoi à chaque gate** : le livrable est porté selon la matrice du TOM V1.0 ; le profil **TL**, Decision Guarantor, signe chaque gate.

| Gate | Livrable porté par |
|---|---|
| G1 | PO |
| G2 | PO, TL, SA Android (co-owners) |
| G3 | SA Android, avec la **signature humaine PCI du TL** (pas de profil dev : écart noté) |
| G4 | Scrum Master (pas de QA : écart noté) |
| G5 | PO (pas de profil Data : écart noté ; bonus) |
| G6 | PO (bonus) |

## Votre agenda

Squad 3 : décalage de **10 minutes** par rapport à la squad 1.

| Horaire | Relatif | Bloc |
|---|---|---|
| 13h30 – 14h00 | 0:00 – 0:30 | Cadrage commun : accueil, règles, brief Vélora, volets, chapeaux |
| 14h00 – 14h10 | 0:30 – 0:40 | Mise en route décalée : fin des vérifications, `context-assemble`, lecture du contexte |
| 14h10 – 14h40 | 0:40 – 1:10 | **Discover** : lire le contexte des voisines, besoin à 5 champs, données, priorité |
| 14h40 – 15h25 | 1:10 – 1:55 | **Design** : constitution → spec → plan → tâches → analyze, contrat v1 publié |
| 15h25 – 15h35 | 1:55 – 2:05 | Pause |
| 15h35 – 16h25 | 2:05 – 2:55 | **Develop** : `/speckit.implement` tâche par tâche · ⚡ un contrat voisin change pendant ce bloc |
| 16h25 – 16h50 | 2:55 – 3:20 | **Deploy** : déploiement, bascule de flag tracée, KPI et événements publiés |
| 16h50 – 16h55 | 3:20 – 3:25 | **Bonus** (5 min) : Deepen (G5) et Drop (G6), version courte, si le temps le permet |
| 16h55 – 17h30 | 3:25 – 4:00 | Débrief commun : préparation de la démo (10'), démos croisées (5'), rétro du TOM (10'), retour pour le 8 h (10') |

| Gate | Créneau de 5 min | Gate keeper |
|---|---|---|
| G1 · Ready to Spec | **14h35** (1:05) | Produit |
| G2 · Ready to Build | **15h20** (1:50) | Tech |
| G3 · Ready to Release | **16h20** (2:50) | Tech |
| G4 · Released and Observable | **16h45** (3:15) | Run |
| G5, G6 · bonus | dans votre fenêtre de 5 min, de 16h50 à 16h55 | data (G5), produit (G6) |

Règles de coupe : G2 pas passée 10 minutes après son créneau → le Develop devient guidé par le coach. G4 pas passée à 16h55 → la squad prépare sa démo.

Avant chaque créneau : gate-check, puis `node tools/context-assemble.mjs --squad squad-3-paiement --check`. Après chaque gate : fiche de retour (20 secondes).

## Ce que vous publiez, ce que vous consommez

Le Context Nexus est un dépôt partagé : vous lisez tout, vous n'écrivez que dans `teams/squad-3-paiement/`.

**Vous publiez** (v0 écrits par l'animation, v1 à publier avant G2) :

| Fichier | Contenu | Lu par |
|---|---|---|
| `teams/squad-3-paiement/contracts/paiement-api.md` | Contrat de paiement | Expérience |
| `teams/squad-3-paiement/contracts/contraintes-pci.md` | Contraintes PCI | Expérience |

**Vous consommez** (versions épinglées au départ) :

| Fichier | Version épinglée | Squad | Pour |
|---|---|---|---|
| `teams/squad-1-offre/contracts/offre-api.md` | 0.1.0 | Offre | Prix et devise |
| `teams/squad-2-prix/contracts/regle-prix.md` | 0.1.0 | Prix | Bornes de prix |
| `org/contracts/security.md` | 1.0.0 | org | Sécurité, PCI-DSS |

Un écart entre votre contrat et celui d'une voisine se règle **en allant la voir**, pas en modifiant son fichier. Si vous n'y arrivez pas : gate keeper tech (Convergence Arbitrator).

## À lire en premier (Discover)

1. `.context/brief.md`, généré par `context-assemble` : tout ce qui suit y est assemblé.
2. `programme/late-checkout/knowledge/brief.md` et `regles-metier.md` : le brief Vélora et les règles RM-01 à RM-08.
3. Votre contrat v0 : `paiement-api.md`, `contraintes-pci.md`.
4. Les contrats v0 que vous consommez (tableau ci-dessus), **en entier**.
5. Vos données fictives (remises sur place).

## Spec Kit, adapté à votre volet

Point de départ pour `/speckit.specify` (à réécrire avec votre Business Intent Spec) :

```
/speckit.specify Le service de paiement encaisse le supplément de late check-out en ligne via PayVel ou l'ajoute à la note de chambre, en recalculant côté serveur un montant conforme à l'offre et aux bornes de prix, sans jamais manipuler de donnée de carte.
Source : teams/squad-3-paiement/intent/business-intent.md. Critères d'acceptance vérifiables par un test,
chacun rattaché à une règle RM-xx ou à un contract (API-xx, SEC-xx, A11Y-xx, ENG-xx).
```

Questions utiles pour `/speckit.clarify` et pour vos échanges avec les voisines :

- Comment recalculez-vous le montant côté serveur (SEC-05), et à partir de quelle source ?
- Qui, nommément, signe le code qui déclenche un débit ? Quand ?
- Que se passe-t-il si l'offre a changé de prix entre l'affichage et le paiement ?
- Le remboursement (RM-04) est-il dans votre volet du dry run, ou explicitement reporté ?

## Les gates de votre squad

| Gate | Livrable | Où dans le Nexus | Vérifié par gate-check | Jugé par le gate keeper |
|---|---|---|---|---|
| **G1** 14h35 | Business Intent Spec | `teams/squad-3-paiement/intent/business-intent.md` | 5 champs complets, contexte daté et sourcé | Critère de succès chiffré, données, priorité avec owner |
| **G2** 15h20 | Solution Design Spec | spec publiée dans `intent/specs/` + contrat v1 dans `contracts/` | Critères évaluables, versions épinglées, contrat d'API valide face aux voisines | NFR chiffrés, DoR, spec « active » avec owner |
| **G3** 16h20 | Code et Test Specs | code et tests dans le starter, spec `active` (pas `stale`) | Lint, tests, couverture, sécurité, spec mise à jour | Revue nommée, criticité, signature humaine en PCI, plan de flags |
| **G4** 16h45 | Runtime Specs | `operations/runbook.md` + `operations/flags-journal.md` | Flag tracé, observabilité, KPI instrumentés, coût en tokens | Owner d'exploitation, runbook, rollback |
| **G5** bonus | Opportunity Spec | `intent/opportunity.md` | Résultats lus sur 30 jours, coût IA compris | Verdict parmi trois, face à la promesse du G1 |
| **G6** bonus | Retirement Spec | `intent/retirement.md` | Carte des dépendances, chaque ligne avec sa disposition | Utilisateurs impactés, porteur de la communication, decision record |

Un no-go renvoie vers l'étape gardée et nomme le critère qui manque. G5 et G6 : en bonus, version courte, sur matériel fourni.

## Points d'attention pour votre squad

- Paiement en ligne = périmètre PCI : sans signature humaine nommée sur le code de débit, G3 est un no-go (SEC-02, PCI-03).
- Vous consommez deux contrats amont : épinglez-les et relancez `context-assemble` au début de chaque bloc.

## Commandes de survie

```bash
# Assembler le contexte de la squad (début de chaque bloc, et après toute publication annoncée)
cd ~/hackathon/context-nexus && git pull
node tools/context-assemble.mjs --squad squad-3-paiement --out ../starter-squad-3-paiement/.context/brief.md

# Vérifier avant une gate (code retour 1 = quelque chose est stale)
node tools/context-assemble.mjs --squad squad-3-paiement --check

# Quand un contrat a changé : marquer ses artefacts stale, puis lire le changement
node tools/context-assemble.mjs --squad squad-3-paiement --mark-stale
git log -p -3 -- teams/

# Publier
git add teams/squad-3-paiement && git commit -m "squad-3-paiement: publie <artefact> v<version>" && git pull --rebase && git push
```

## Vos interlocuteurs

| Pour | Qui |
|---|---|
| Votre coach, présent à chacune de vos gates | présenté au cadrage |
| Rythme et règles de coupe | l'animateur principal |
| Agent, Spec Kit, CI, clés, dépôt partagé | le support technique Zenika |
| Conflit de contrat entre squads | gate keeper tech |
| Tokens et coût IA | les greffiers |

Bloqué plus de 5 minutes sur l'outillage : levez la main.
