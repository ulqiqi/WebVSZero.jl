using WebVSZero

agent = load_agent(isempty(ARGS) ? "agent/bestnn.data" : ARGS[1])

tests = [
    ("Red can win in column 4", [4, 3, 4, 3, 4, 3]),
    ("Blue must block column 4", [4, 3, 4, 3, 4]),
    ("Empty board", Int[]),
]

for (name, moves) in tests
    start = time()
    column, probs = best_move(agent, moves)
    seconds = round(time() - start; digits=1)
    println(name, " -> column ", column, " (", seconds, " s) ", probs)
end
