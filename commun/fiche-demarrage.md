# Fiche de démarrage · Hackathon Champions

**Lundi 26 octobre · 13 h 30 – 17 h 30 · installation dès 12 h 30**
Votre squad, votre chapeau et vos horaires de gate : `squads/<votre-squad>/KIT.md` sur [ai4d-hackathon-kit](https://github.com/zenika-dev/ai4d-hackathon-kit).

## Avant le vendredi 23/10

Installer Git, Node 20+, Claude Code et Spec Kit (`uv tool install specify-cli --from git+https://github.com/github/spec-kit.git`), puis vérifier :

```bash
git --version && node --version && claude --version && specify check
```

Un échec ? Prévenez le support **avant** le 23/10.

## Le jour J, en 4 étapes

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
