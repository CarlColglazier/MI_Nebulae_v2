s.waitForBoot {
	~rPort = 3000;

	SynthDef(\ResonateR, {
		arg out, trig=0, pit=60.0, struct=0.25, bright=0.5, damp=0.7, pos=0.25, model=0, poly=1, intern_exciter=0, easteregg=0, bypass=0, mul=1.0, add=0;
		var sound = {
			MiRings.ar(SoundIn.ar([0,1]),
				trig, 
				pit, 
				struct, 
				bright, 
				damp, 
				pos, 
				model, 
				poly, 
				intern_exciter, 
				easteregg, 
				bypass, 
				mul, 
				add
			); 
		};

		Out.ar(out, sound);
	}).add;

	// Need this for the SynthDef to run.
	s.sync;

	~synth = Synth.new(\ResonateR, [\out, 0]);

	// -- Knobs --
	// trig
	OSCdef( \osc_reset, {
		arg msg, time, addr, recvPort;
		~synth.set(\trig, msg[1]);
	}, '/neb/reset',recvPort:~rPort);
	// pitch
	OSCdef( \osc_pitch, {
		arg msg, time, addr, recvPort;
		~synth.set(\pit, 24 + (msg[1] * 12));
	},
	'/neb/pitch',recvPort:~rPort);
	// structure
	OSCdef( \osc_start, {
		arg msg, time, addr, recvPort;
		~synth.set(\struct, msg[1]);
	},
	'/neb/start',recvPort:~rPort);
	// brightness
	OSCdef( \osc_blend, {
		arg msg, time, addr, recvPort;
		~synth.set(\bright, msg[1]);
	},
	'/neb/blend',recvPort:~rPort);
	// damping
	OSCdef( \osc_density, {
		arg msg, time, addr, recvPort;
		~synth.set(\damp, msg[1]);
	},
	'/neb/density',recvPort:~rPort);
	// position
	OSCdef( \osc_window, {
		arg msg, time, addr, recvPort;
		~synth.set(\pos, msg[1]);
	},
	'/neb/window',recvPort:~rPort);
	// model
	OSCdef( \osc_model, {
		arg msg, time, addr, recvPort;
		a = [5, 4, 3, 2, 1, 0, 1, 2, 3, 4, 5];
		~synth.set(\model, a.at(msg[1].linlin(0, 1, 0, 10).round));
	}, '/neb/speed',recvPort:~rPort);
	// polyphony
	// intern_exciter
	OSCdef( \osc_source, {
		arg msg, time, addr, recvPort;
		~synth.set(\intern_exciter, msg[1]);
	}, '/neb/source',recvPort:~rPort);
	// easteregg
	// bypass
	OSCdef( \osc_freeze, {
		arg msg, time, addr, recvPort;
		~synth.set(\bypass, msg[1]);
	}, '/neb/freeze',recvPort:~rPort);
};
