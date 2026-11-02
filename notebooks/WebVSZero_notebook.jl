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
"""

#%% md id=f7afaa
@md"""
## 3. Entrainement de l'agent Puissance 4 (avec ALphazero.jl)
"""

#%% md id=2aeefa
@md"""
## 4. Construction de l'interfacde web
"""

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 7c936b10-2f76-47a0-baf4-8afed53e9fe1
# ╚═╡
