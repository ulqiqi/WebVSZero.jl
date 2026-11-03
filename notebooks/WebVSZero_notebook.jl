try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# WebVSZero : Interface graphique pour jouer contre Alphazero au Puissance 4
"""

#%% md id=88d407
@md"""
## 1. Introduction
"""

#%% md id=2da925
@md"""
## 2. Fonctionnement de Alphazero

Alphazero est un algorithme créé par l'entreprise Google DeepMind, pour les jeux à deux joueurs et à information complète (échecs, go, shogi). Dérivé de AlphaGo (logiciel spécialisé en Go, initialement entrainé sur des parties humaines), et version généraliste de sa version AlphaGo Zero (apprentissage par self-play, sans aucune donnée humaine), il ne connait que les règles du jeu, et est composé d'un réseau de neurones avec deux sorties. Le réseau utilise une boucle d'entraînement, il joue des parties contre lui-même avec Monte Carlo Tree Search, algorithme qui explore les arbres de décision et évalue la probabilité de jouer chaque coup (*Policy*) et y associe une estimation de qui va gagner depuis une position donnée (*Value* allant de -1 à 1), ce qui génère des données, et entraîne le réseau sur ces données. Il évalue ensuite le nouveau réseau contre l'ancien, et garde le meilleur puis recommence. La bibliothèque AlphaZero.jl est une implémentation en Julia réalisée par Jonathan Laurent, qui inclut comme exemple les règles du jeu Puissance 4, que l'on utilisera pour notre projet.
"""

#%% md id=f7afaa
@md"""
## 3. Entrainement de l'agent Puissance 4 (avec ALphazero.jl)

Le tutoriel utilisé pour l'entrainement de l'agent est disponible [ici](https://jonathan-laurent.github.io/AlphaZero.jl/dev/tutorial/connect_four/). Le code proposé dans le tutoriel a été légeremment modifiés pour y incorporer la libraie CUDA et cuDNN, afin de faciliter l'entraînement sur un GPU nVidia. Les fichiers train.jl, check_gpu.jl, test_agent.jl ainsi que le fichier WebVSZero.jl ont été modifiés à l'aide de Claude mais seront supprimés dans le repo final une fois l'entraînement terminé afin de ne pas être évalués.
"""

#%% md id=2aeefa
@md"""
## 4. Construction de l'interface web
"""

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 7c936b10-2f76-47a0-baf4-8afed53e9fe1
# ╚═╡
