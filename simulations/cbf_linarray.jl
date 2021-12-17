# Simulate a classic beamformer with a linear array

# before running:
#  include("../src/DirectionFinding.jl")
#  using <favorite plotting program>

using DirectionFinding

begin
    fc = 1e9
    λ = 299.79e6/fc
    N₀ = 0.0001
    a1 = pi/8
    la = lineararray(9, 2λ, σ²=0.0001)
    s1 = SignalSource(a1, halfsine_train(1e6))
    sim = Simulation(la, fc, N₀, s1)
    doa = cbf(sim, 2.00013e9, 100)
    println("Source Angle: $a1")
    println("Found: $(doa > 0 ? doa : doa+2π)")
end