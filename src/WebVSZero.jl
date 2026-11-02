module WebVSZero

using AlphaZero
using Serialization: deserialize

export load_agent, best_move

const C4 = AlphaZero.Examples.ConnectFour

"Load a trained network on the CPU. `sims` is the search effort per move."
function load_agent(path::AbstractString; sims::Int=600)
    net = Network.copy(deserialize(path); on_gpu=false, test_mode=true)
    base = Examples.experiments["connect-four"].params.arena.mcts
    mcts = MctsParams(base; num_iters_per_turn=sims, dirichlet_noise_ϵ=0.0)
    return MctsPlayer(C4.GameSpec(), net, mcts)
end

"Return the best column (1 to 7), given the columns played so far. Red plays first."
function best_move(player, moves::AbstractVector{<:Integer})
    game = GI.init(C4.GameSpec())
    foreach(m -> GI.play!(game, m), moves)
    GI.game_terminated(game) && error("The game is already over")
    reset_player!(player)
    actions, probs = think(player, game)
    return actions[argmax(probs)], Dict(zip(actions, round.(probs; digits=3)))
end

end
