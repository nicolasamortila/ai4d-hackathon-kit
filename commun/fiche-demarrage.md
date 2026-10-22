# Fiche de démarrage · Hackathon Champions

**Lundi 26 octobre · 13 h 30 – 17 h 30 · installation dès 12 h 30**
Votre squad, votre chapeau et vos horaires de gate : `squads/<votre-squad>/KIT.md` sur [ai4d-hackathon-kit](https://github.com/zenika-dev/ai4d-hackathon-kit).

## Avant le vendredi 23/10

**Deux postes prêts par squad suffisent.** Profil non technique : un compte GitHub suffit, vous utiliserez un Codespace (rien à installer).

Pour installer sur votre poste, une ligne, sans droits administrateur :

```powershell
# Windows, dans PowerShell
irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex
```

```bash
# macOS, dans Terminal
curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash
```

Le bilan final doit être tout vert. Une ligne rouge : envoyez le bilan au support **avant** le 23/10.

## Le jour J, en 4 étapes

**En Codespace** : ouvrez le dépôt du starter de votre squad → **Code → Codespaces → Create codespace**, collez la clé de la squad, puis passez directement à l'étape 3 (`claude`).

**Sur votre poste** :

```bash
# 1. Cloner le contexte partagé et le starter de votre squad (URL du starter affichée sur place)
mkdir -p ~/hackathon && cd ~/hackathon
git clone https://github.com/zenika-dev/ai4d-hackathon-context-nexus.git context-nexus
git clone <url-du-starter> starter-<squad>

# 2. Assembler le contexte de votre squad
cd context-nexus && node tools/context-assemble.mjs --squad <squad> --out ../starter-<squad>/.context/brief.md

# 3. Lancer l'agent dans le starter
cd ../starter-<squad> && claude
```

4. Dans Claude Code, demander : « Résume .context/brief.md : notre volet, les contrats que nous publions et ceux que nous consommons. » Puis taper `/speckit` : les commandes doivent apparaître.

`<squad>` : `squad-1-offre`, `squad-2-prix`, `squad-3-paiement` ou `squad-4-experience`.

## Trois réflexes pendant la session

1. **Début de chaque bloc** : `git pull`, puis `context-assemble`.
2. **Avant chaque gate** : `context-assemble --squad <squad> --check`.
3. **« Un contrat a changé »** : `--mark-stale`, lire le changement, mettre à jour, ré-épingler, republier.

Bloqué plus de 5 minutes ? Levez la main.
