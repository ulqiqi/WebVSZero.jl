using CUDA, cuDNN, AlphaZero

CUDA.versioninfo()
println("CUDA functional: ", CUDA.functional())
println("cuDNN available: ", cuDNN.has_cudnn())

e = Examples.experiments["connect-four"]
net = Network.copy(e.mknet(e.gspec, e.netparams); on_gpu=true, test_mode=true)
println("Network on GPU: ", Network.on_gpu(net))

policy, value = net(GI.current_state(GI.init(e.gspec)))
println("Policy sum (should be about 1): ", sum(policy))
