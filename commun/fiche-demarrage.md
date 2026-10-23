# Fiche de démarrage · Hackathon Champions

**Lundi 26 octobre · 13 h 30 – 17 h 30 · installation dès 12 h 30**
Votre squad, votre chapeau et vos horaires de gate : votre fiche squad, ci-dessous.

## Vos liens

| Squad | Votre fiche | Ouvrir votre Codespace | Dépôt de la squad | Dossier de la squad dans le contexte |
|---|---|---|---|---|
| **1 · Offre** | [KIT.md](https://github.com/zenika-dev/ai4d-hackathon-kit/blob/main/squads/squad-1-offre/KIT.md) | [codespaces.new/…/starter-squad-1-offre](https://codespaces.new/zenika-dev/starter-squad-1-offre) | [starter-squad-1-offre](https://github.com/zenika-dev/starter-squad-1-offre) | [teams/squad-1-offre](https://github.com/zenika-dev/ai4d-hackathon-context-nexus/tree/main/teams/squad-1-offre) |
| **2 · Prix** | [KIT.md](https://github.com/zenika-dev/ai4d-hackathon-kit/blob/main/squads/squad-2-prix/KIT.md) | [codespaces.new/…/starter-squad-2-prix](https://codespaces.new/zenika-dev/starter-squad-2-prix) | [starter-squad-2-prix](https://github.com/zenika-dev/starter-squad-2-prix) | [teams/squad-2-prix](https://github.com/zenika-dev/ai4d-hackathon-context-nexus/tree/main/teams/squad-2-prix) |
| **3 · Paiement** | [KIT.md](https://github.com/zenika-dev/ai4d-hackathon-kit/blob/main/squads/squad-3-paiement/KIT.md) | [codespaces.new/…/starter-squad-3-paiement](https://codespaces.new/zenika-dev/starter-squad-3-paiement) | [starter-squad-3-paiement](https://github.com/zenika-dev/starter-squad-3-paiement) | [teams/squad-3-paiement](https://github.com/zenika-dev/ai4d-hackathon-context-nexus/tree/main/teams/squad-3-paiement) |
| **4 · Expérience** | [KIT.md](https://github.com/zenika-dev/ai4d-hackathon-kit/blob/main/squads/squad-4-experience/KIT.md) | [codespaces.new/…/starter-squad-4-experience](https://codespaces.new/zenika-dev/starter-squad-4-experience) | [starter-squad-4-experience](https://github.com/zenika-dev/starter-squad-4-experience) | [teams/squad-4-experience](https://github.com/zenika-dev/ai4d-hackathon-context-nexus/tree/main/teams/squad-4-experience) |

Contexte partagé (les 4 squads) : [github.com/zenika-dev/ai4d-hackathon-context-nexus](https://github.com/zenika-dev/ai4d-hackathon-context-nexus) ·
Kit complet : [github.com/zenika-dev/ai4d-hackathon-kit](https://github.com/zenika-dev/ai4d-hackathon-kit)

> Les dépôts de squad (`starter-…`) et donc les liens Codespace seront actifs au plus tard le lundi 26/10 à 12 h 30.

**Deux postes prêts par squad suffisent.** Choisissez votre voie :

| | Voie A · Codespace | Voie B · votre poste |
|---|---|---|
| Pour qui | **Vous n'êtes pas développeur** (PO, designer, Scrum Master, data…) | Vous êtes à l'aise avec un terminal |
| Il faut | Un navigateur, un compte GitHub et votre compte Claude | Lancer un script d'installation avant le 23/10, et votre compte Claude |
| Le jour J | 3 clics, tout est prêt en 3 minutes | 3 commandes |

---

## Voie A · Codespace : rien à installer

Un Codespace est un ordinateur prêt à l'emploi qui s'ouvre **dans votre navigateur**. Tout y est déjà installé :
l'éditeur (VS Code), l'agent Claude Code, Spec Kit, le dépôt de votre squad et le contexte partagé.

### Avant le 23/10 (5 minutes)

1. Créez un compte sur [github.com/signup](https://github.com/signup) si vous n'en avez pas (adresse pro conseillée).
2. Envoyez votre **identifiant GitHub** au support : il vous donnera accès au contexte partagé.
3. Vérifiez que vous pouvez vous connecter à [claude.ai](https://claude.ai) avec votre **compte Claude** (l'abonnement fourni par l'entreprise).

### Le jour J, à 12 h 30

1. **Connectez-vous à GitHub**, puis cliquez sur le lien **« Ouvrir votre Codespace »** de votre squad (tableau « Vos liens »).
2. La page « Create a new codespace » s'affiche. *Autre chemin, si le lien ne marche pas : ouvrez le dépôt de votre squad,
   bouton vert **Code** → onglet **Codespaces** → **…** → **New with options…**.*
3. La page affiche un cadre avec trois réglages : **Branch** (`main`), **Region** et **Machine type**. **Ne changez rien.**
   Si des champs `ANTHROPIC_…` apparaissent, **laissez-les vides** : vous vous connecterez avec votre compte Claude à l'étape 5, pas avec une clé.
   Cliquez sur le bouton vert **Create codespace**, en bas à droite du cadre.
4. **Patientez 2 à 4 minutes.** Un éditeur s'ouvre dans l'onglet ; en bas, un terminal affiche l'installation.
   C'est prêt quand il écrit **« ✓ Codespace prêt »**.
5. **Connectez Claude à votre compte** (une seule fois par Codespace) : dans le terminal en bas, tapez `claude auth login` puis Entrée.
   - Un lien s'affiche : ouvrez-le (Ctrl + clic, ou Cmd + clic sur Mac) et connectez-vous à Claude avec votre compte habituel, puis cliquez sur **Autoriser**.
   - Si la page affiche un **code**, copiez-le, revenez dans le terminal, collez-le et appuyez sur Entrée.
   - Pour vérifier : `claude auth status --text` doit afficher votre adresse e-mail.

   Puis **parlez à l'agent** : cliquez sur l'icône Claude dans la barre de gauche (ou tapez `claude` dans le terminal).
6. **Vérifiez** en lui écrivant :
   > Résume .context/brief.md : notre volet, les contrats que nous publions et ceux que nous consommons.

   S'il cite votre volet et les contrats des autres squads, vous êtes prêt.

### Travailler avec Claude dans le Codespace

**Où lui parler** : le panneau Claude (icône dans la barre de gauche). On lui écrit en français, comme dans une messagerie.
Il lit les fichiers, propose des modifications et vous demande votre accord avant de les appliquer : lisez, puis acceptez ou refusez.

**Les commandes Spec Kit** se tapent dans le même panneau : `/speckit.specify`, `/speckit.clarify`… (le mode opératoire indique laquelle à quel moment).

**Des phrases toutes faites**, que l'agent sait exécuter pour vous, sans que vous touchiez au terminal :

| Vous voulez | Écrivez à Claude |
|---|---|
| Avoir le contexte à jour | « Récupère les dernières versions du Context Nexus et réassemble notre contexte. » |
| Savoir ce qui a changé | « Qu'est-ce qui a changé dans les contrats des autres squads depuis tout à l'heure ? » |
| Démarrer la Business Intent Spec | « Copie le gabarit business-intent dans le dossier de notre squad et aide-moi à remplir les 5 champs. Pose-moi les questions. » |
| Partager votre travail | « Publie mes changements dans le Context Nexus. » |
| Vérifier avant une gate | « Vérifie que notre squad passe le check de context-assemble. » |

**Une règle d'équipe** : chaque Codespace est une copie séparée. Ce que vous écrivez reste invisible pour les autres tant que ce n'est pas **publié**.
- La spec et le code vivent dans **un seul Codespace, celui de l'Orchestrator**, affiché sur l'écran de la table.
- Dans votre Codespace, vous lisez le contexte et vous préparez vos textes (Business Intent, spec, contrat), puis vous demandez à Claude de les **publier**.

### Bon à savoir

- Les fichiers sont à gauche : votre dépôt de squad, et le contexte partagé dans le dossier `context-nexus` à côté.
- Vous avez fermé l'onglet ? Retrouvez votre Codespace sur [github.com/codespaces](https://github.com/codespaces). Rien n'est perdu.
  Ne recliquez pas sur le lien « Ouvrir votre Codespace » : il en créerait un deuxième, vide de votre travail non publié.
- Après 30 minutes sans activité, le Codespace se met en veille : rouvrez-le, il redémarre en quelques secondes, toujours connecté à votre compte Claude.
- Claude vous demande de vous connecter ? Relancez `claude auth login`. Le Codespace est **personnel** : ne le partagez pas, il est connecté à votre compte.
- Le terminal ne vous parle pas ? Vous n'en avez pas besoin : le Context Engineer de la squad lance les commandes. Vous travaillez avec l'agent.

---

## Voie B · votre poste

### Avant le 23/10

Une ligne à coller, sans droits administrateur. Elle installe Git, Node.js, Claude Code et Spec Kit, puis affiche un bilan.

```powershell
# Windows : dans PowerShell (menu Démarrer, tapez « PowerShell »)
irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex
```

```bash
# macOS : dans Terminal (Cmd + Espace, tapez « Terminal »)
curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash
```

Le bilan doit être tout vert. Une ligne rouge : envoyez le bilan au support **avant** le 23/10.

### Le jour J, à 12 h 30

```bash
# 1. Cloner le contexte partagé et le dépôt de votre squad, côte à côte
mkdir -p ~/hackathon && cd ~/hackathon
git clone https://github.com/zenika-dev/ai4d-hackathon-context-nexus.git context-nexus
git clone https://github.com/zenika-dev/starter-<squad>.git starter-<squad>

# 2. Assembler le contexte de votre squad
cd context-nexus && node tools/context-assemble.mjs --squad <squad> --out ../starter-<squad>/.context/brief.md

# 3. Lancer l'agent
cd ../starter-<squad> && claude
```

Au premier lancement, Claude Code propose de se connecter : choisissez le **compte Claude avec abonnement**, puis connectez-vous dans le navigateur qui s'ouvre.
Puis vérifiez avec la même question qu'en voie A (étape 6), et tapez `/speckit` : les commandes doivent apparaître.

`<squad>` : `squad-1-offre`, `squad-2-prix`, `squad-3-paiement` ou `squad-4-experience`.

---

## Trois réflexes pendant la session (Context Engineer, dans les deux voies)

À taper dans le terminal, depuis le dossier de votre squad :

1. **Début de chaque bloc** : `cd ../context-nexus && git pull && node tools/context-assemble.mjs --squad <squad> --out ../starter-<squad>/.context/brief.md && cd -`
2. **Avant chaque gate** : `node ../context-nexus/tools/context-assemble.mjs --squad <squad> --check`
3. **« Un contrat a changé »** : la même commande avec `--mark-stale`, puis lire le changement, mettre à jour, ré-épingler, republier.

Bloqué plus de 5 minutes ? Levez la main.
