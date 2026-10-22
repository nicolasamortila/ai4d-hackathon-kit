# Prérequis du poste · à vérifier avant le vendredi 23/10

> Envoyé aux 16 champions le 23/10. En cas de blocage : support technique Zenika.
> Bon moment pour le faire : en marge de l'upskilling AI Tools (niveau 1 le 22/10, niveau 2 le 23/10).

## À installer sur votre poste habituel

| Outil | Version | Vérification |
|---|---|---|
| Git | 2.40+ | `git --version` |
| Node.js | 20+ | `node --version` |
| Claude Code | dernière | `claude --version` |
| uv (pour installer Spec Kit) | dernière | `uv --version` |
| Spec Kit (`specify`) | **version figée par Zenika, communiquée avec le kit du 23/10** | `specify check` |

```bash
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
```

Les commandes `/speckit.*` du kit sont à aligner sur la version figée.

## Clés agent

- Jusqu'au 25/10 : vos tests se font avec les **clés pilote**.
- Le 26/10 : chaque squad reçoit une **clé dédiée**, hors quota personnel, avec un budget de tokens suivi en direct.
  Les clés pilote restent actives jusqu'au 27/10 : pas de bascule de gateway pendant la session.

## Ce que vous n'avez pas besoin de préparer

Le fond. Le brief, les contrats v0, les données et les gabarits sont dans le kit.
Le pas à pas du jour J est dans `00-par-ou-commencer.md`.
