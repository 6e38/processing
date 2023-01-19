with_fx :pitch_shift do |foo|
  synth :noise, decay: 20, amp: 0.5
  sleep 0.5
  control foo, pitch_slide: 1, pitch: -3
  sleep 3
  control foo, pitch_slide: 1, pitch: -4
  sleep 3
  control foo, pitch_slide: 1, pitch: -3
  sleep 2
  with_fx :compressor do
    synth :gnoise, decay: 9, amp: 0.25, pitch: -2
  end
  sleep 1
  9.times do
    synth :gnoise, release: 0.1, amp: 0.5
    sleep 1
  end
end