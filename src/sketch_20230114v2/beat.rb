time = 0
rate = 3.1415 * 2 / 4
p = 0

live_loop :pan do
  time += 0.1
  p = Math.sin(time * rate)
  sleep 0.1
end

live_loop :l2 do
  with_fx :distortion do
    sample :bass_hit_c, release: 0.1
  end
  sleep 1
end

sleep 3

live_loop :l1 do
  with_fx :echo do
    with_fx :distortion do
      play :D, amp: 0.5, attack: 0.1, sustain: 0.2, decay: 0.1, release: 0.01
    end
  end
  sleep 2
end

sleep 1

live_loop :l4 do
  synth :noise, amp: 0.1, note: :D2, release: 0.1
  sleep 0.25
end

sleep 3

live_loop :l3 do
  with_fx :whammy do
    with_fx :vowel do
      synth :square, note: :F4, amp: 0.25, pan: p
    end
  end
  sleep 0.5
end
