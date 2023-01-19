live_loop :beat1 do
  sample :ambi_choir, rate: 0.3, amp: 0.5
  sleep 1
end

time = 0
rate = 3.1415 * 2 / 4
p = 0

live_loop :one do
  time += 0.2
  p = Math.sin(time * rate)
  n = rand(90..108)
  play n, amp: 0.1, release: 0.08, pan: p
  sleep 0.2
end

sleep 0.1

live_loop :two do
  n = rand(90..108)
  play n, amp: 0.1, release: 0.08, pan: p
  sleep 0.2
  
end