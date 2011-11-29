package fr.duprey.easyb.sample

description "This story is about empty stack management. From http://www.easyb.org/howtos.html"

before "instanciate empty stack", {
	given "an empty stack",{ stack = new Stack() }
}

scenario "null is pushed onto empty stack", {

	when "null is pushed", {
		pushnull = { stack.push(null) }
	}

	then "an exception should be thrown", {
		ensureThrows(RuntimeException){ pushnull() }
	}

	and "then the stack should still be empty", { stack.empty.shouldBe true }
}


scenario "pop is called on empty stack", {

	when "pop is called", {
		popnull = { stack.pop() }
	}

	then "an exception should be thrown", {
		ensureThrows(RuntimeException){ popnull() }
	}

	and "then the stack should still be empty", { stack.empty.shouldBe true }
}