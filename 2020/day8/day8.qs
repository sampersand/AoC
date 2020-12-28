#### These will eventually be implemented in the std lib:
Text.'*@' = self -> { self.__splat__ = true; self };
Text.':' = (self, value) -> { self.__default__ = value; self };

# List destructuring. We do this by overloading `=`.
List.'=' = (self, args, scope) -> {
	# `:n` means "n strackframes up"
	scope = scope.or(:1);
	rhs = [];

	args.each({
		# `.?` means "if the rhs exists on the lhs, return `rhs.lhs`. otherwise,
		# return `null`."
		if (_0.?__splat__, {
			rhs += _0 # add the splat in
		}, {
			rhs.push(_0) # push the var onto the end.
		})
	});

	self.each({
		_0.'='(
			if (_0.?__splat__, {
				# if it's a splat operator, slurp up the rest of the arguments
				x = rhs.clone(); rhs.clear(); x
			}, {
				# if RHS isn't empty, remove the first value from `rhs`. else,
				# get the default value associated with the variable, or null.
				if (rhs, rhs.shift, { _0.?__default__ })
			}),
			scope
		)
	});
};

# Overload `->` so it'll destructure for us.
List.'->' = {
	(self, block, *'') = __args__;
	{
		self.'='(__args__, :0);
		:0.instance_exec(block)
	}
};

Pristine.object = {
	(__args__.len() == 0).then(__args__.push << {});
	(__args__.len() == 2).then() {
		:1.__parents__ = [:1.__args__.shift()];
	};

	:0.instance_exec(__args__.pop());
	:0
};

#### ACTUAL SOLUTION STARTS HERE

Instr = object() {
	'()' = (class, arg) -> { __parents__ = [class]; arg = arg.@num(); :0 };

	@text = self -> { self::OPERATION + " " + self.arg };
	inspect = self -> { self::OPERATION + '(' + self.arg + ')' };

	Nop = object(:0) {
		OPERATION = 'nop';
		run = (self, vm) -> { /* do nothing */ };
	};

	Acc = object(:0) {
		OPERATION = 'acc';
		run = (self, vm) -> { vm.rax += self.arg; };
	};

	Jmp = object(:0) {
		OPERATION = 'jmp';
		run = (self, vm) -> { vm.rip += self.arg - 1; };
	};

	INSTRUCTIONS = object() {
		(Nop::OPERATION) = Nop;
		(Acc::OPERATION) = Acc;
		(Jmp::OPERATION) = Jmp;
	};

	parse = line -> {
		(instr, arg) = line.split(' ');
		INSTRUCTIONS.(instr).assert("unknown instruction: " + instr)(arg)
	};
};

Vm = object() {
	'()' = (class, instrs) -> { __parents__ = [class]; :0.reset(); :0 };

	@text = inspet = self -> {
		['Vm(rax=', self.rax, ', rip=', self.rip, ', nistr=', self.instrs.len(), ')'].join()
	};

	reset = self -> { self.rip = 0; self.rax = 0; self.visited = []; };
	done? = self -> { self.rip >= self.instrs.len() - 1 };
	'[]' = (self, idx) -> { self.instrs[idx] };

	step = self -> {
		(self.visited[self.rip]).then(return);
		instr = (self[self.rip]).else(return);
		self.visited[self.rip] = true;
		self.rip += 1;

		instr
	};
};

vm = 
	Io.File('day8.txt')
		.lines()
		.select(~$itself)
		.map(Instr::parse)
		.@list()
		.tap_into(Vm);

1.upto(vm.instrs.len()).each(idx -> {{
	(Instr::Acc == (vm[idx-1]).class).then(return);
	vm.reset();

	until (vm.done?) {
		instr = vm.step().else(null.return << :2);

		if (idx == vm.rip) {
			:1.instr = object(instr){};
			instr.__parents__.unshift(ifl(instr.class == Instr::Jmp, Instr::Nop, Instr::Jmp));
		};

		instr.run(vm);
	};

	print("Part 2: ", vm.rax);
	quit();
}()});
