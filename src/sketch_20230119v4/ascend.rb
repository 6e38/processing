
notes = [ :C4, :D4, :E4, :F4, :G4 ]
instruments = [ :sine, :sine, :sine, :rodeo, :rodeo, :rodeo ]

instruments.each do |instrument|
  notes.each do |note|
    with_fx :ixi_techno do
      synth instrument, note: note, amp: 0.3
      synth instrument, note: :C3, amp: 0.1
      synth instrument, note: :E3, amp: 0.1
      synth instrument, note: :G3, amp: 0.1
    end
    sleep 0.7
  end
end

