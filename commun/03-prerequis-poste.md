# Prérequis du poste · à faire avant le vendredi 23/10

> En cas de blocage : support technique Zenika.
> Bon moment pour le faire : pendant l'upskilling AI Tools (niveau 1 le 22/10, niveau 2 le 23/10).

## D'abord : tout le monde n'a pas besoin d'installer

**Deux postes prêts par squad suffisent**, ceux de l'Orchestrator et du Decision Guarantor.
Si vous êtes PO, designer, Scrum Master ou data, vous écrivez la spec et relisez ce que propose l'agent : vous pouvez
travailler sur le poste d'un ou une collègue. Installer sur votre poste reste un plus, pas une obligation.

## Deux façons d'être prêt

### Option A · rien à installer : GitHub Codespaces (recommandée pour les profils non techniques)

Il faut seulement un navigateur et un compte GitHub.

1. Créez un compte sur [github.com](https://github.com) si vous n'en avez pas, et envoyez votre identifiant au support.
2. Le jour J, ouvrez le dépôt de votre squad, puis cliquez sur **Code → Codespaces → … → New with options…**.
3. Collez la clé agent de la squad dans le champ `ANTHROPIC_API_KEY`, cliquez sur **Create codespace**, puis attendez 2 à 4 minutes.

Le pas à pas illustré est dans la **fiche de démarrage** (`fiche-demarrage.md`, voie A).

Vous obtenez VS Code dans le navigateur, avec tout déjà installé et le contexte de votre squad prêt.

### Option B · installation sur votre poste, en une ligne

Aucun droit administrateur n'est nécessaire : tout s'installe dans votre profil.

**Windows** : ouvrez **PowerShell** (menu Démarrer, tapez « PowerShell », pas besoin du mode administrateur), collez :

```powershell
irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex
```

**macOS** : ouvrez **Terminal** (Cmd + Espace, tapez « Terminal »), collez :

```bash
curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash
```

Le script installe ce qui manque parmi Git, Node.js 22, Claude Code, uv et Spec Kit, puis affiche un bilan.
- Tout est vert : fermez la fenêtre, ouvrez-en une nouvelle. Vous êtes prêt.
- Une ligne est rouge : copiez le bilan et envoyez-le au support.
- macOS : si une fenêtre propose d'installer les « outils de ligne de commande », acceptez, attendez la fin, puis relancez la commande.

Pour seulement vérifier, sans rien installer : ajoutez `-s -- --verifier` après `bash` (macOS), ou lancez
`$env:VERIFIER_SEULEMENT = "1"` avant la commande (Windows).

## Clés agent

- Jusqu'au 25/10 : vos tests se font avec les **clés pilote**.
- Le 26/10 : chaque squad reçoit une **clé dédiée**, hors quota personnel, avec un budget de tokens suivi en direct.
  Les clés pilote restent actives jusqu'au 27/10 : pas de bascule de gateway pendant la session.

## Ce que vous n'avez pas besoin de préparer

Le fond. Le brief, les contrats v0, les données et les gabarits sont dans le kit.
Le pas à pas du jour J est dans `00-par-ou-commencer.md`.
