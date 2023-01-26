live_loop :clicks1 do
  with_fx :reverb do
    sample :glitch_robot2, finish: 0.02, amp: 0.3 + rand(0.1), rate: 0.4 + rand(0.1)
  end
  sleep rand(0.3) + 0.1
end
