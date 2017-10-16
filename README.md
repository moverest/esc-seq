# Initiation aux séquences d'échappement

L'idée de cet utilitaire est de vous aider à manipuler les séquences d'échappement du terminal pour en comprendre le fonctionnement.

Pour lancer l'outil, il faut d'abord cloner ce dépôt:

```
git clone https://github.com/moverest/esc-seq
cd esc-seq
```

Ensuite, on lance l'utilitaire:

```
./esc_seq.sh start 'xterm -e'
```

`xterm -e` est la commande qui lance le terminal. Ici, on utilise `xterm`. Pour `termite`, on peut mettre `termite -e`.

Si tout ce passe bien, on devrait avoir un terminal qui se lance avec rien dedans si ce n'est que le curseur. Dans le terminal dans lequel on a lancé la commande, on doit avoir qqch comme:

```
Waiting for terminal to launch... done.
Shell pid: 6189
Terminal file: /dev/pts/3
>
```

Le `>` et un prompt qui nous invite à taper du texte.

Si on tape: `Bonjour` dans le prompt puis entrer, on a `Bonjour` qui s'affiche dans le terminal fils.
