extends Sprite



func _ready():
	var num = 1
	var t
	var time = 0.8
	var rand
	randomize()
	while(true):
		time = float(rand_range(0.2,1))
		t = Timer.new()
		t.set_wait_time(time)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		rand = int(rand_range(0,7))
		self.set_frame(rand)
