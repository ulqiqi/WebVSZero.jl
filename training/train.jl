ENV["GKSwstype"] = "100"   # draw the plots without a screen
using CUDA, cuDNN
using AlphaZero

CUDA.functional() || error("No usable GPU. Stopping instead of training on the CPU.")
cuDNN.has_cudnn() || error("cuDNN is not usable. Stopping instead of training on the CPU.")

experiment = Examples.experiments["connect-four"]
session = Session(experiment; dir="sessions/connect-four", save_intermediate=true)

# Optional, only for GPU out-of-memory errors (see Common problems)
if haskey(ENV, "AZ_LEARNING_BATCH")
    batch = parse(Int, ENV["AZ_LEARNING_BATCH"])
    p = session.env.params
    learning = LearningParams(p.learning; batch_size=batch, loss_computation_batch_size=batch)
    session.env.params = Params(p; learning)
end

resume!(session)
