# Par où commencer · le pas à pas du champion

> Trois moments : **avant** (10 min, d'ici le 23/10), **à l'arrivée** (12 h 30 – 13 h 30), **la première heure** (13 h 30 – 14 h 30).
> Si vous ne lisez qu'un document, lisez celui-ci, puis la fiche `KIT.md` de votre squad.

## Avant · d'ici le vendredi 23/10 (10 minutes)

1. Lire `01-bases-en-5-minutes.md` et la fiche de votre squad : `squads/<votre-squad>/KIT.md`.
2. Choisir votre façon d'être prêt (détails dans `03-prerequis-poste.md`) :
   - **Profil non technique** : créez un compte GitHub et envoyez votre identifiant au support. Le jour J, vous ouvrirez un **Codespace** : rien à installer.
   - **Installation sur votre poste** : une ligne à coller (PowerShell sous Windows, Terminal sous macOS), sans droits administrateur.
     Le script se termine par un bilan, qui doit être tout vert.
3. **Deux postes prêts par squad suffisent** (Orchestrator et Decision Guarantor). Les autres peuvent travailler en binôme.
4. Une ligne rouge au bilan ? Envoyez-le au support **avant** le 23/10, pas le jour J.

## À l'arrivée · lundi 26/10, à partir de 12 h 30

À votre table de squad, un seul poste suffit pour les étapes 1 à 4 ; les autres suivent sur leur propre poste.

> **En Codespace** : ouvrez le dépôt de votre squad, cliquez sur **Code → Codespaces → Create codespace on main**,
> puis connectez-vous avec `claude auth login`. Les étapes 1 à 4 se font toutes seules ;
> passez directement à l'étape 5. Pas à pas détaillé : `fiche-demarrage.md`, voie A.

**1. Récupérer les deux dépôts, côte à côte**
```bash
mkdir -p ~/hackathon && cd ~/hackathon
git clone https://github.com/Zenika-dev/ai4d-hackathon-context-nexus.git context-nexus
git clone <url-du-starter-de-votre-squad> starter-<votre-squad>
```
> L'URL du starter de votre squad est affichée sur l'écran commun et sur le mur de squad.

**2. Connecter Claude Code à votre compte Claude** : `claude auth login`, puis connexion dans le navigateur. Vérification : `claude auth status --text`.

**3. Assembler le contexte de votre squad**
```bash
cd ~/hackathon/context-nexus
node tools/context-assemble.mjs --squad <votre-squad> --out ../starter-<votre-squad>/.context/brief.md
```
Attendu : un bloc `task_brief:` avec un identifiant `TB-<squad>-xxxxxxxx`, puis
`✓ Toutes les dépendances épinglées sont à jour.`

**4. Vérifier le starter**
```bash
cd ~/hackathon/starter-<votre-squad>
ls CLAUDE.md .context/brief.md        # les deux doivent exister
npm install && npm test               # tests verts
specify check
```
> Pas de `CLAUDE.md` ? Copiez celui de `squads/<votre-squad>/CLAUDE.md` à la racine du starter.
> Pas de dossier `.specify/` ? Lancez `specify init --here --integration claude`.

**5. Premier contact avec l'agent**
```bash
claude
```
Puis, dans Claude Code, tapez exactement :
```
Résume en 10 lignes ce que contient .context/brief.md : qui nous sommes, ce que nous devons
construire, quels contrats nous publions, lesquels nous consommons et à quelles versions.
```
Si la réponse cite votre volet et les contrats de vos voisines, l'agent voit bien le Context Nexus. Vous êtes prêts.

Tapez aussi `/speckit` : les commandes `/speckit-constitution` à `/speckit-implement` doivent apparaître.

## La première heure · 13 h 30 – 14 h 30 (horaires de la squad 1, +5 min par squad)

### 0:00 – 0:30 · Cadrage commun, puis mise en route

- Écouter les règles, le brief Vélora et les volets.
- **Confirmer les chapeaux** de la squad (proposition dans votre `KIT.md`) et les écrire sur le mur de squad.
- Si l'étape « À l'arrivée » n'est pas finie, la terminer maintenant. Le cadrage de 30 minutes prévoit cette marge.

### 0:30 – 1:00 · Discover → G1

| Qui | Fait quoi |
|---|---|
| **Context Engineer** | Relance `context-assemble`, ouvre les contrats v0 des voisines et lit à voix haute ce qu'ils attendent de vous |
| **Specification Engineer** | Copie le gabarit et tient la plume des 5 champs (voir ci-dessous) |
| **Orchestrator** | Fait travailler l'agent sur les questions ouvertes (prompt ci-dessous) |
| **Decision Guarantor** | Fait trancher le critère de succès chiffré et la priorité, prépare le passage de G1 |

```bash
cd ~/hackathon/context-nexus
cp gabarits/business-intent.md teams/<votre-squad>/intent/business-intent.md
```

Prompt de départ (dans Claude Code, depuis le starter) :
```
Lis .context/brief.md. Liste ce que le brief ne dit pas et qui empêche de fixer un critère de succès chiffré
pour notre volet. Pour chaque point, dis quelle donnée ou quelle squad pourrait y répondre.
Ne rédige pas la Business Intent Spec : pose les questions.
```

Avant votre créneau G1, **publiez** la Business Intent Spec :
```bash
cd ~/hackathon/context-nexus
# frontmatter : status: active, owner: <prénom.nom>, last-validated: 2026-10-26
git add teams/<votre-squad> && git commit -m "<votre-squad>: publie business-intent v1.0.0"
git pull --rebase && git push
node tools/context-assemble.mjs --squad <votre-squad> --check
```

### À partir de 1:00 · Design → G2

Enchaîner `/speckit-constitution` → `/speckit-specify` → `/speckit-clarify` → `/speckit-plan` → `/speckit-tasks` → `/speckit-analyze`,
puis publier le contrat v1. Tout est détaillé, avec les prompts, dans `02-spec-kit-x-context-nexus.md`.

## Les trois réflexes pour toute la session

1. **Début de bloc** : `git pull` puis `context-assemble` (Context Engineer).
2. **Avant chaque gate** : gate-check, puis `context-assemble --check`. Code retour 1 = quelque chose est `stale`.
3. **Annonce « un contrat a changé »** : `context-assemble --mark-stale`, lire le diff, mettre à jour, ré-épingler, republier.

## En cas de problème

| Symptôme | Réflexe |
|---|---|
| `context-assemble` : « Aucun artefact pour la squad » | Vérifier le nom : `squad-1-offre`, `squad-2-prix`, `squad-3-paiement`, `squad-4-experience` |
| `git push` refusé | `git pull --rebase` puis `git push` (vous n'écrivez que dans votre dossier : pas de conflit attendu) |
| L'agent ignore le contexte | Vérifier que `CLAUDE.md` contient `@.context/brief.md` et que le fichier existe ; relancer `claude` |
| Claude demande de se connecter, ou refuse | `claude auth login` ; toujours bloqué : support (AgentOps). Plan B : poste pilote de la squad |
| Désaccord de contrat avec une voisine | Aller la voir. Toujours bloqué : gate keeper tech (Convergence Arbitrator) |
| Bloqué plus de 5 minutes | Lever la main |
