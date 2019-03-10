///state_update();
if(state_next != state)
{
  state=state_next;
}

if (state != state_executed_previously) {
	state_new = true;
	state_timer = 0;
} else {
	state_new = false;
	state_timer += 1;
}