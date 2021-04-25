extends Sprite



func _ready():
	var num = 1
	var t
	var time = 0.3
	while(true):
		t = Timer.new()
		t.set_wait_time(time)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		if num == 1:
			self.set_frame(num)
			num = 0
		else:
			self.set_frame(num)
			num = 1
